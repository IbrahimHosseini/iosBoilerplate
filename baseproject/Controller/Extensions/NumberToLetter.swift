//
//  NumberToLetter.swift
//  baseproject
//
//  Created by Pazandish on 7/31/19.
//  Copyright © 2019 sehosseini. All rights reserved.
//

import Foundation


public extension Int {
    var toWord: String {
        let numberValue = NSNumber(value: self)
        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: NVLocalized(NumberToLetter))
        formatter.numberStyle = .spellOut
        return formatter.string(from: numberValue)!
    }
}


class StringToNumber {
    
    class func cleanNumber(value: String)-> Int {
        
        return Int(value.replacingOccurrences(of: ",", with: "")) ?? 0
        
    }
}

//-------------------------------------
//MARK: - persian date
//-------------------------------------
extension String {
    
    func toRialNumber() -> Int {
        return StringToNumber.cleanNumber(value: self) * 10
    }
    
    func toNumber() -> Int {
        return StringToNumber.cleanNumber(value: self)
    }
    
    func toTomanNumber() -> Int {
        return StringToNumber.cleanNumber(value: self) / 10
    }
    
}
