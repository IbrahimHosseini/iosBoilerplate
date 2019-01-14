//
//  App.swift
//  baseproject
//
//  Created by Pazandish on 1/14/19.
//  Copyright © 2019 sehosseini. All rights reserved.
//

import UIKit
import MBProgressHUD
import PromiseKit
import SwiftyUserDefaults
import CoreLocation
import SwiftLocation

enum LoginStatus:Int {
    case login = 0
    case logout
}
enum SendStatus:String {
    case  sent = "sent"
    case  notSent = "not_sent"
}

enum LoggedInType:String {
    //    case  facebook  = "facebook"
    //    case  google    = "google"
    case  phone     = "email"
    case  skiped     = "skiped"
}

enum IntroPage: Int {
    case unSeen = 0
    case seen
}

enum NoIncomeArchive: Int {
    case unSeen = 0
    case seen
}

extension DefaultsKeys {
    static let UserToken = DefaultsKey<String?>("UserToken")
}

class App {
    public static let shared = App()
    
    public let configurations = Configurations()
    
    public let appVersion = Bundle.main.infoDictionary!["CFBundleShortVersionString"] as! String
    
    public var rootViewController: UINavigationController?
    
    public weak var mainTabbarController: MainTabbarCtrl?
    
    private(set) var loginStatus: LoginStatus = .logout
    
    var itemUri: ItemUriModel?
    
    var fcmToken: String?
    
    var userToken:String? {
        didSet{
            checkLoginStatus()
        }
    }
    
    var currentLang: Language {
        get{
            let langString = Defaults[DefaultsKeys.AppLanguages].first ?? Language.persian.rawValue
            return Language(rawValue: langString) ?? .persian
        }
        set(newValue){
            Defaults[DefaultsKeys.AppLanguages] = [newValue.rawValue]
        }
    }
    
    var loggedInType: LoggedInType {
        get{
            let langString = Defaults[DefaultsKeys.LoggedInType] ?? LoggedInType.skiped.rawValue
            return LoggedInType(rawValue: langString) ?? .skiped
        }
        set(newValue){
            Defaults[DefaultsKeys.LoggedInType] = newValue.rawValue
        }
    }
    
    
    init() {
        
        let a: String? = Defaults[DefaultsKeys.UserToken]
        self.userToken = a
        checkLoginStatus()
    }
    
    private func checkLoginStatus() {
        if userToken == nil {
            Defaults.remove(DefaultsKeys.UserToken)
            self.loginStatus = .logout
        } else {
            Defaults[DefaultsKeys.UserToken] = userToken
            BaseRequestHolder.defaultHeaderParams["shop-token"] = "\(userToken!)"
            self.loginStatus = .login
        }
    }
    
    public func setPushToken(_ token: String) {
        let oldToken = Defaults[DefaultsKeys.PushToken]
        if oldToken.count == 0 || token == oldToken {
            return
        }
        Defaults[DefaultsKeys.PushToken] = token
        Defaults[DefaultsKeys.PushTokenSentStatus] = SendStatus.notSent.rawValue
        
        syncPushToken()
    }
    
    @discardableResult
    public func syncPushToken() -> Promise<NVDataResponse>? {
        
        let status = Defaults[DefaultsKeys.PushTokenSentStatus]
        if( status.count == 0 || status == SendStatus.sent.rawValue ) {
            return nil;
        }
        
        let model = SMPushToken()
        model.token = Defaults[DefaultsKeys.PushToken]
        return CommonApi.pushTokenUpdate
            .set(urlData: model.toJSON())
            .requestForPromise()
            .then { (resp: NVDataResponse) -> NVDataResponse in
                Defaults[DefaultsKeys.PushTokenSentStatus] = SendStatus.sent.rawValue
                return resp
        }
    }
    
    func forceLogout() {
        self.userToken = nil
        BaseRequestHolder.defaultHeaderParams = [:]
        reboot()
        self.checkLoginStatus()
        
    }
    
    @discardableResult
    func logout() -> Promise<NVDataResponse> {
        return CommonApi.logout.requestForPromise()
            .then {[weak self] (resp: NVDataResponse) -> NVDataResponse in
                self?.userToken = nil
                BaseRequestHolder.defaultHeaderParams = [:]
                self?.checkLoginStatus()
                self?.reboot()
                return resp
        }
    }
    
    func reboot() {
        App.shared.rootViewController?.popToRootViewController(animated: true)
    }
    
    @discardableResult
    public func syncDeviceInfo() -> Promise<NVDataResponse>? {
        let oldDeviceInfo = Defaults[DefaultsKeys.DeviceInfo]
        let newDeviceInfo = SMDeviceInfo()
        if self.loginStatus != .login || ( oldDeviceInfo != nil && newDeviceInfo == oldDeviceInfo)  {
            return nil
        }
        return CommonApi.deviceInfo
            .set(queryParams: newDeviceInfo.toJSON())
            .requestForPromise()
            .then(execute: {(resp) -> NVDataResponse in
                Defaults[DefaultsKeys.DeviceInfo] = newDeviceInfo
                return resp
            })
    }
    
    func lockOrientation(_ orientation: UIInterfaceOrientationMask) {
        if let delegate = UIApplication.shared.delegate as? AppDelegate {
            delegate.orientationLock = orientation
        }
    }
    
    /// OPTIONAL Added method to adjust lock and rotate to the desired orientation
    func lockOrientation(_ orientation: UIInterfaceOrientationMask, andRotateTo rotateOrientation:UIInterfaceOrientation) {
        self.lockOrientation(orientation)
        UIDevice.current.setValue(rotateOrientation.rawValue, forKey: "orientation")
    }
    
    private(set) var location: CLLocation?
    private var locationReq: LocationRequest?
    
    func locationTrackerInit() {
        
        let status = CLLocationManager.authorizationStatus()
        if status != .authorizedWhenInUse && status != .authorizedAlways {
            return
        }
        
        if locationReq == nil {
            locationReq =  Locator.subscribePosition(accuracy: .city, onUpdate: {[weak self] (location) -> (Void) in
                self?.location = location
            }) { (error, location) -> (Void) in
            }
        }
    }
    
    
    func encode(input: String) -> String {
        let data = input.data(using: .nonLossyASCII, allowLossyConversion: true)!
        return String(data: data, encoding: .utf8)!
    }
    
    func decode(input: String) -> String {
        let data = input.data(using: .utf8)!
        return String(data: data, encoding: .nonLossyASCII)!
    }
    
    func encodeUrl(input: String) -> String? {
        return input.addingPercentEncoding( withAllowedCharacters: NSCharacterSet.urlQueryAllowed)
    }
    
    func decodeUrl(input: String) -> String? {
        return input.removingPercentEncoding
    }
}


