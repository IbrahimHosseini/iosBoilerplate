//
//  Configurations.swift
//  baseproject
//
//  Created by Pazandish on 1/14/19.
//  Copyright © 2019 sehosseini. All rights reserved.
//

import Foundation
import UIKit
import Material

class Configurations {
    
    static let baseUrl = configuration.baseURL!
    static let wsUrl = configuration.wsURL!
    
    static let appId = ""
    
    //MARK: - url helper methods
    static func getBaseUrl(rurl:String) -> String {
        if rurl.trimmed.hasPrefix("http") {
            return rurl
        } else {
            return baseUrl + rurl
        }
    }
    
    static func getImageUrl(rurl:String) -> String {
        
        if rurl.trimmed.hasPrefix("http") {
            return rurl
        } else {
            if rurl != "" {
                return getBaseUrl(rurl:"static/public/" + rurl)
            } else {
                return ""
            }
        }
    }
    
    static func getMediaUrl(rurl: String) -> String {
        
        if rurl.trimmed.hasPrefix("http") {
            return rurl
        } else {
            if rurl != "" {
                return getBaseUrl(rurl:"static/public/" + rurl)// + "?token=\(App.shared.userToken!)")
            } else {
                return ""
            }
        }
    }
    
    static func getStaticUrl(rurl: String) -> String {
        
        if rurl.trimmed.hasPrefix("http") {
            return rurl
        } else {
            return getBaseUrl(rurl:"static/get-public-file/" + rurl)
        }
    }
    
    static func getProtectedUrl(rurl: String) -> String {
        
        if rurl.trimmed.hasPrefix("http"){
            return rurl
        } else {
            return getBaseUrl(rurl:"static/protected/" + rurl)
        }
    }
    
    
    //TODO:style needs to go struct
    //    let mainFont:UIFont = UIFont(name: "IRANSansWebFaNum ", size: 14)!
}
