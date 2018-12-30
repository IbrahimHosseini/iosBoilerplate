//
//  Common.swift
//  
//
//  Created by Seyed Ebrahim Hosseini on 12/31/18.
//  Copyright © 2018 sehosseini. All rights reserved.
//

import Foundation
import ObjectMapper
import SwiftyUserDefaults

public protocol NVMappable: Mappable{
    init();
}


extension UserDefaults {
    public subscript<T>(key: DefaultsKey<T>) -> T? where T:NVMappable {
        get {
            if let str = string(forKey: key._key) {
                return Mapper<T>().map(JSONString: str)
            }
            return nil
        }
        set {
            set(key, newValue?.toJSONString())
            
        }
    }
}


extension UserDefaults {
    public subscript<T:NVMappable>(key: DefaultsKey<T?>) -> T? {
        get {
            if let str = string(forKey: key._key){
                return Mapper<T>().map(JSONString: str)
            }
            return nil
        }
        set { set(key, newValue?.toJSONString())
            
        }
    }
    public subscript<T:NVMappable>(key: DefaultsKey<T>) -> T {
        get {
            if let str = string(forKey: key._key){
                return Mapper<T>().map(JSONString: str) ?? T()
            }
            return T()
        }
        set { set(key, newValue.toJSONString() ?? "") }
    }
    
}


