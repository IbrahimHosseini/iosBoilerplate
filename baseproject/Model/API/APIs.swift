//
//  APIs.swift
//  baseproject
//
//  Created by sehosseini on 12/30/18.
//  Copyright © 2018 sehosseini. All rights reserved.
//

import Foundation


struct CommonApi {
    
    static var login: BaseRequestHolder {
        get {
            return BaseRequestHolder(rurl: APIUrls.login, httpMethod:.post)
        }
    }
}
