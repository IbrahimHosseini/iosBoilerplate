//
//  Common.swift
//  chimidoni
//
//  Created by Seyed Ebrahim Hosseini on 12/31/18.
//  Copyright © 2018 sehosseini. All rights reserved.
//

import ObjectMapper


enum ServiceResponseStatus: String {
    
    case success = "OK"
    case failure = "FAILURE"
    case unauthenticated = "UNAUTHENTICATED"
    case unauthorized = "UNAUTHORIZED"
    case serverError = "SERVER_ERROR"
    case invalidData = "INVALID_DATA"
    case notSupported  = "NOT_SUPPORTED"
}


enum ItemShowType: String {
    case downloadable = "DOWNLOADABLE"
}

class VoidMappable : NVMappable {
    
    required init() {}
    required init?(map: Map) {}
    
    func mapping(map: Map) {}
    
}



