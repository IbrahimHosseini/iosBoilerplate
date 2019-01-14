//
//  Currency.swift
//  baseproject
//
//  Created by Pazandish on 12/30/18.
//  Copyright © 2018 sehosseini. All rights reserved.
//

import Foundation

//-------------------------------------
//MARK: - String to decimal Casting and add "ریال" label
//-------------------------------------
extension String{
    
    func toDecimal()-> String{
        return "\(number2Decimal.n2d(number: self))"
    }
    func toCurrency()-> String{
        return "\(number2Decimal.n2d(number: self)) ریال"
    }
}


//-------------------------------------
//MARK: - number to decimal
//-------------------------------------
internal class number2Decimal{
    
    class func n2d(number:String) -> String{
        
        let number = NSDecimalNumber(string: number)
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = NumberFormatter.Style.decimal
        let result = numberFormatter.string(from: number)
        
        return result!
    }
}
