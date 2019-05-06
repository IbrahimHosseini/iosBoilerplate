//
//  Request.swift
//  baseproject
//
//  Created by sehosseini on 12/30/18.
//  Copyright © 2018 sehosseini. All rights reserved.
//

import Foundation
import ObjectMapper
import Alamofire
import PromiseKit
import AlamofireObjectMapper
import Mustache

func attempt<T>(_ body: @escaping (Int) -> Promise<T> ,count:Int = 3, interval:TimeInterval = 2) -> Promise<T> {
    var attempts = 0
    func attempt() -> Promise<T> {
        attempts += 1
        return body(attempts).recover { error -> Promise<T> in
            guard attempts < count else { throw error }
            return after(interval: interval).then(execute: attempt)
        }
    }
    return attempt()
}


class BaseRequestHolder {
    
    internal static let syncQueue = DispatchQueue(label: "syncRetokenQueue")
    
    public var rurl: String
    internal var headerParams: [String: String] = [:]
    static var defaultHeaderParams: [String: String] = [:]
    internal var urlData: [String: Any] = [:]
    static var defaultQueryParams: [AnyHashable: Any] = [:]
    internal var queryParams: [AnyHashable: Any] = [:]
    internal var body: [String: Any] = [:]
    internal var paramEncoding: ParameterEncoding = Alamofire.JSONEncoding.default
    internal var httpMethod: Alamofire.HTTPMethod = .get
    internal var isForm: Bool = false
    
    init(rurl: String) {
        self.rurl = rurl
    }
    convenience init(rurl: String,
                     urlData: [String: Any] = [:],
                     body: [String: Any] = [:],
                     bodyModel: Mappable? = nil,
                     httpMethod: Alamofire.HTTPMethod = .get,
                     header: [String: String] = [:],
                     isForm: Bool = false) {
        self.init(rurl: rurl)
        self.set(headerParams: headerParams)
        self.set(urlData: urlData)
        
        self.set(body: body)
        
        if let model = bodyModel {
            self.set(body: model)
        }
        
        self.set(httpMethod: httpMethod)
        self.set(isForm: isForm)
    }
    
    @discardableResult func set(body: [String: Any]) -> Self { self.body = body; return self }
    
    func getBody() -> [String: Any] {
        return body
    }
    
    @discardableResult func set(body: Mappable) -> Self {
        self.body = self.body.merging(body.toJSON(), uniquingKeysWith: {$1})
        return self;
    }
    
    func getHeaders() -> [String: String] {
        var params = self.headerParams
        for (k,v) in BaseRequestHolder.defaultHeaderParams {
            params[k] = v
        }
        
        return params
    }
    
    @discardableResult func set(headerParams: [String: String]) -> Self { self.headerParams = headerParams; return self; }
    
    func getQueryParams() -> [AnyHashable: Any] {
        var params = self.queryParams
        for (k,v) in BaseRequestHolder.defaultQueryParams {
            params[k] = v
        }
        
        return params
    }
    
    @discardableResult func set(queryParams: [AnyHashable: Any]) -> Self { self.queryParams = queryParams; return self; }
    
    func getParamEncoding() -> ParameterEncoding { return paramEncoding }
    
    @discardableResult func set(paramEncoding: ParameterEncoding) -> Self { self.paramEncoding = paramEncoding; return self; }
    
    func getIsForm() -> Bool { return isForm }
    
    @discardableResult func set(isForm: Bool) -> Self { self.isForm = isForm ; return self; }
    
    func getHttpMethod() -> Alamofire.HTTPMethod { return self.httpMethod }
    
    @discardableResult func set(httpMethod: Alamofire.HTTPMethod) -> Self { self.httpMethod = httpMethod; return self }
    
    func getUrlData() -> [String: Any] { return self.urlData }
    
    @discardableResult func set(urlData: [String: Any]) -> Self { self.urlData = urlData; return self; }
    
    func getUrl() -> URLConvertible {
        var baseUrl = Configurations.baseUrl
        
        
        let relativeUrlTemplate = try! Template(string: rurl)
        let relativeUrl = try! relativeUrlTemplate.render(self.urlData)
        
        if(baseUrl.last  == "/" && relativeUrl.first == "/") {
            baseUrl = String(baseUrl.dropLast())
        }
        
        var url = "\(baseUrl)\(relativeUrl)"
        if relativeUrl.hasPrefix("http"){
            url = relativeUrl
        }
        
        let urlTemp = URL(string: url)!
        
        var urlComponents = URLComponents(url: urlTemp, resolvingAgainstBaseURL: false)!
        
        var qpItems: [URLQueryItem] = []
        
        self.getQueryParams().forEach { (item: (key: AnyHashable, value: Any)) in
            if item.value is [UInt64] {
                (item.value as! [UInt64]).forEach({ (int) in
                    qpItems.append(URLQueryItem(name: "\(item.key)" + "[]", value: "\(int)"))
                })
            } else {
                qpItems.append(URLQueryItem(name: "\(item.key)", value: "\(item.value)"))
            }
        }
        
        urlComponents.queryItems?.forEach({ (item) in
            qpItems.append(item)
        })
        
        
        urlComponents.queryItems = qpItems
        return urlComponents.url!
    }
    
    func requestForPromise() -> Promise<NVDataResponse> {
        
        func request() -> Promise<NVDataResponse>  {
            let req =  Alamofire.request(self.getUrl(),
                                         method: self.getHttpMethod(),
                                         parameters: self.getBody(),
                                         encoding: self.getParamEncoding(),
                                         headers: self.getHeaders())
            return  req.responseData()
                .then(on: DispatchQueue.main, execute: { (data:Data) throws -> NVDataResponse in
                    let response = NVDataResponse(request: req.request, response: req.response, data: data)
                    let statusCode = BaseRequestHolder.getHttpErrorCode(response: response)
                    if  !(200 <= statusCode && statusCode < 300) {
                        throw NVError.requestFail(response)
                    } else{
                        return response
                    }
                }).catch(execute: { (error) -> Void in
                    let statusCode = BaseRequestHolder.getErrorCode(error: error)
                    if statusCode == 401 && App.shared.loginStatus == .login {
                        App.shared.forceLogout()
                        App.shared.reboot()
                    }
                })
        }
        
        return request()
    }
    
    //TODO:Not Tested
    public func resetData(){
        urlData = [:]
        queryParams = [:]
        body = [:]
        headerParams = [:]
    }
    
    static func getHttpErrorCode(response: NVDataResponse) -> Int {
        return response.response?.statusCode ?? 0
    }
    
    
    public static func getErrorCode(error: Error) -> Int {
        var errorCode: Int = error._code
        if error is NVError, case let NVError.requestFail(response) = error {
            errorCode = getHttpErrorCode(response: response)
        } else if error is NVError, case let NVError.mappingFail(response) = error {
            errorCode = getHttpErrorCode(response: response)
        }
        return errorCode
    }
    
    static func getHttpErrorMessage(error: Error) -> String {
        var errorCode: Int = error._code
        var errorMessage = NVLocalized(HttpCodeUnknown)
        if error is NVError, case let NVError.requestFail(response) = error {
            errorCode = getHttpErrorCode(response: response)
            if let data = response.data {
                if let json = try? JSONSerialization.jsonObject(with: data, options: [.allowFragments]) as? String {
                    if json != nil && json!.count > 0 {
                        errorMessage = json!
                        return errorMessage
                    }
                }
            }
        } else if error is NVError, case let NVError.mappingFail(response) = error {
            errorCode = getHttpErrorCode(response: response)
            errorMessage = NVLocalized(FatalError)
            return errorMessage
        }
        
        if errorCode >= 200 && errorCode < 300 {
            errorMessage = NVLocalized(HttpCode200To300)
        } else if errorCode == 401 {//
            errorMessage = NVLocalized(HttpCode401)
        } else if errorCode == 403 {//
            errorMessage = NVLocalized(HttpCode403)
        } else if errorCode == 404 {//
            errorMessage = NVLocalized(HttpCode404)
        } else if errorCode == 423 {//
            errorMessage = NVLocalized(HttpCode423)
        } else if errorCode == 429 {//many request
            errorMessage = NVLocalized(HttpCode429)
        } else if errorCode == 502 {
            errorMessage = NVLocalized(HttpCode502)
        }
        
        return errorMessage
    }
    
}

public enum NVError: Error {
    
    case requestFail(NVDataResponse)
    case mappingFail(NVDataResponse)
    
}

//
class RequestHolder<T: Mappable>: BaseRequestHolder {
    
    func responseObjectPromise() -> Promise<(T, NVDataResponse)> {
        return self.requestForPromise().then(on: DispatchQueue.main, execute:  { (resp: NVDataResponse) -> (T,NVDataResponse) in
            var ans:T? = nil
            if let data = resp.data {
                var responseString: String?  =  String(data: data, encoding: String.Encoding.utf8)
                if responseString != nil {
                    ans = Mapper<T>().map(JSONString: responseString!)
                }
            }
            
            if(ans == nil) {
                throw NVError.mappingFail(resp)
            } else if (ans! is BaseResponseType) {
                if !(ans! is RMBaseResponse<Void>) && ( (ans! as! BaseResponseType).getData() == nil || (ans! as! BaseResponseType).status != ServiceResponseStatus.success ) {
                    throw NVError.requestFail(resp)
                }
            }
            return (ans!, resp)
        })
    }
}

public struct NVDataResponse {
    fileprivate init(_ rawrsp: Alamofire.DataResponse<Any>) {
        request = rawrsp.request
        response = rawrsp.response
        data = rawrsp.data
    }
    
    fileprivate init(request: URLRequest? = nil ,response: HTTPURLResponse? = nil, data: Data? = nil) {
        self.request = request
        self.response = response
        self.data = data
    }
    
    /// The URL request sent to the server.
    public let request: URLRequest?
    
    /// The server's response to the URL request.
    public let response: HTTPURLResponse?
    
    /// The data returned by the server.
    public let data: Data?
}


