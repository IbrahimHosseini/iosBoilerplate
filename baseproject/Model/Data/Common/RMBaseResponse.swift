//
//  RMBaseResponse.swift
//  baseproject
//
//  Created by Pazandish on 12/30/18.
//  Copyright © 2018 sehosseini. All rights reserved.
//

import UIKit
import ObjectMapper

protocol BaseResponseType {
    var errors: [String]! { get set}
    var messages: [String]! { get set}
    var status: ServiceResponseStatus! { get set}
    func getData() -> Any?
}

class RMBaseResponse<Item>: NVMappable, BaseResponseType {
    func getData() -> Any? {
        return self.data
    }
    
    var data: Item!
    var errors: [String]!
    var messages: [String]!
    var status: ServiceResponseStatus!
    
    required init() {}
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        data     <- map ["data"]
        errors   <- map ["errors"]
        messages <- map ["messages"]
        status   <- map ["status"]
    }
}

class RMBaseObjectResponse<Item: NVMappable>: NVMappable, BaseResponseType {
    func getData() -> Any? {
        return self.data
    }
    
    var data: Item!
    var errors: [String]!
    var messages: [String]!
    var status: ServiceResponseStatus!
    
    required init() {}
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        data        <- map ["data"]
        errors      <- map ["errors"]
        messages    <- map ["messages"]
        status      <- map ["status"]
    }
}
