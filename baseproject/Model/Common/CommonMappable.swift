//
//  CommonMappable.swift
//  baseproject
//
//  Created by sehosseini on 1/14/19.
//  Copyright © 2019 sehosseini. All rights reserved.
//

import Foundation
import ObjectMapper
import SwiftyUserDefaults


extension UserDefaults {
    public subscript<T>(key: DefaultsKey<T>) -> T? where T: Mappable {
        get {
            if let str = string(forKey: key._key) {
                return Mapper<T>().map(JSONString: str)
            }
            return nil
        }
        set { set(key, newValue?.toJSONString()) }
    }
}


extension UserDefaults {
    public subscript<T: Mappable>(key: DefaultsKey<T?>) -> T? {
        get {
            if let str = string(forKey: key._key){
                return Mapper<T>().map(JSONString: str)
            }
            return nil
        }
        set { set(key, newValue?.toJSONString()) }
    }
    
    
}
