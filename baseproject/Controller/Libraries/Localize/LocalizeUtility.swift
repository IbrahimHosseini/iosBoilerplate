//
//  LocalizeUtility.swift
//  Bazargam_Buyer
//
//  Created by Seyed Ebrahim Hosseini on 10/9/18.
//  Copyright © 2018 Bazargam. All rights reserved.
//

import Foundation
import MiawKit


public enum Language: String{
    case  persian = "fa"
    //    case  english = "en"
    public static let allValues:[Language] = [.persian]//, .english]
}

public func NVLocalizedWithFormat(_ key:String, values:CVarArg ...) -> String {
    return String(format: MKLocalized(key), arguments: values)
}

public func NVLocalized(_ key:String) -> String {
    return MKLocalized(key) ?? ""
}

public func translateNumberToPersion(number: Double) -> String{
    let formatter: NumberFormatter = NumberFormatter()
    formatter.locale = NSLocale(localeIdentifier: "fa_IR") as Locale!
    return formatter.string(from: NSNumber(value: number)) ?? ""
}

public func translateNumberToEnglish(numberStr: String) -> String{
    let formatter: NumberFormatter = NumberFormatter()
    formatter.locale = NSLocale(localeIdentifier: "en_US") as Locale!
    let final = formatter.number(from: numberStr)
    if final == nil {
        return ""
    }
    return "\(final!)"
}
