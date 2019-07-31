//
//  StringParameterEncoding.swift
//  baseproject
//
//  Created by Pazandish on 7/31/19.
//  Copyright © 2019 sehosseini. All rights reserved.
//

import Foundation
import Alamofire

// when we want to send a string value without key with alamofire

extension String: ParameterEncoding {
    
    public func encode(_ urlRequest: URLRequestConvertible, with parameters: Parameters?) throws -> URLRequest {
        var request = try urlRequest.asURLRequest()
        request.httpBody = data(using: .utf8, allowLossyConversion: false)
        return request
    }
    
}
