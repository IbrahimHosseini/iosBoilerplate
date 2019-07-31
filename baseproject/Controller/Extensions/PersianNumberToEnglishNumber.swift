//
//  PersianNumberToEnglishNumber.swift
//  baseproject
//
//  Created by Pazandish on 7/31/19.
//  Copyright © 2019 sehosseini. All rights reserved.
//

import Foundation

extension String {
    
    func toEnglishNumber()-> String {
        return "\(perToEngNumber.p2e(number: self) ?? "")"
    }
}


//-------------------------------------
//MARK: - number to decimal
//-------------------------------------
internal class perToEngNumber {
    
    class func p2e(number: String) -> String? {
        
        let numberFormatter = NumberFormatter()
        numberFormatter.locale = NSLocale(localeIdentifier: "EN") as Locale?
        if let final = numberFormatter.number(from: number) {
            return "\(final)"
        }
        
        return nil
        
    }
}
