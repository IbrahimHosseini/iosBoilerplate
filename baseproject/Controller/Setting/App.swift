//
//  App.swift
//  baseproject
//
//  Created by Pazandish on 12/30/18.
//  Copyright © 2018 sehosseini. All rights reserved.
//

import UIKit
import Presentr
import MBProgressHUD
import PromiseKit
import SwiftyUserDefaults
import CoreLocation
import SwiftLocation

enum LoginStatus: Int {
    case login = 0
    case logout
}
enum SendStatus: String {
    case  sent = "sent"
    case  notSent = "not_sent"
}

enum LoggedInType: String {
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
    public static
    let shared = App()
    
    public let configuration = Configuration()
    
    public let appVersion = Bundle.main.infoDictionary!["CFBundleShortVersionString"] as! String
    
    public var rootViewController: UINavigationController?
    
    public weak var mainTabbarController:MainTabbarCtrl?
    
    private(set) var loginStatus: LoginStatus = .logout
    
    
    var userToken:String? {
        didSet{
            checkLoginStatus()
        }
    }
    
    
    init() {
        
        let a: String? = Defaults[DefaultsKeys.UserToken]
        self.userToken = a
        checkLoginStatus()
    }
    
    private func checkLoginStatus() {
        if userToken == nil{
            Defaults.remove(DefaultsKeys.UserToken)
            self.loginStatus = .logout
        } else {
            Defaults[DefaultsKeys.UserToken] = userToken
            self.loginStatus = .login
        }
    }
    
    func forceLogout() {
        self.userToken = nil
//        BaseRequestHolder.defaultHeaderParams = [:]
        reboot()
        self.checkLoginStatus()
        
    }
    
    @discardableResult
    func logout() -> Promise<NVDataResponse> {
//        return CommonApi.logout.requestForPromise()
//            .then {[weak self] (resp:NVDataResponse) -> NVDataResponse in
//                self?.userToken = nil
//                BaseRequestHolder.defaultHeaderParams = [:]
//                self?.checkLoginStatus()
//                self?.reboot()
//                return resp
//        }
    }
    
    func reboot() {
        App.shared.rootViewController?.popToRootViewController(animated: true)
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
    
    func locationTrackerInit(){
        
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
    
    func persianDate(time: String)-> String {
        
        var unixTimestamp = Double(time)
        unixTimestamp = unixTimestamp! //- 12600.0 // -3.5h
        let date = Date(timeIntervalSince1970: unixTimestamp!)
        
        let dateFormatter = DateFormatter()
        dateFormatter.calendar = Calendar(identifier: .persian)
        
        dateFormatter.dateFormat = "yyyy/MM/dd"// - HH:mm:ss"
        return dateFormatter.string(from: date)
    }
    
    func persianDateTime(time: String)-> String {
        
        var unixTimestamp = Double(time)
        unixTimestamp = unixTimestamp! //- 12600.0 // -3.5h
        let date = Date(timeIntervalSince1970: unixTimestamp!)
        
        let dateFormatter = DateFormatter()
        dateFormatter.calendar = Calendar(identifier: .persian)
        
        dateFormatter.dateFormat = "yyyy/MM/dd - HH:mm"
        return dateFormatter.string(from: date)
    }
    
    func persianTime(time: String)-> String {
        
        var unixTimestamp = Double(time)
        unixTimestamp = unixTimestamp! //- 12600.0 // -3.5h
        let date = Date(timeIntervalSince1970: unixTimestamp!)
        
        let dateFormatter = DateFormatter()
        dateFormatter.calendar = Calendar(identifier: .persian)
        
        dateFormatter.dateFormat = "HH:mm"
        return dateFormatter.string(from: date)
    }
}


