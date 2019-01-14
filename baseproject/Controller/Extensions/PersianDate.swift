//
//  PersianDate.swift
//  baseproject
//
//  Created by Pazandish on 12/30/18.
//  Copyright © 2018 sehosseini. All rights reserved.
//

import Foundation


class PersianDate {
    
    class func persianDateTime(time: String)-> String {
        
        var unixTimestamp = Double(time)
        unixTimestamp = unixTimestamp! //- 12600.0 // -3.5h
        let date = Date(timeIntervalSince1970: unixTimestamp!)
        
        let dateFormatter = DateFormatter()
        dateFormatter.calendar = Calendar(identifier: .persian)
        
        dateFormatter.dateFormat = "yyyy/MM/dd - HH:mm"
        return dateFormatter.string(from: date)
    }
    
    class func persianTime(time: String)-> String {
        
        var unixTimestamp = Double(time)
        unixTimestamp = unixTimestamp!// - 12600.0 // -3.5h
        let date = Date(timeIntervalSince1970: unixTimestamp!)
        
        let dateFormatter = DateFormatter()
        dateFormatter.calendar = Calendar(identifier: .persian)
        
        dateFormatter.dateFormat = "HH:mm"
        return dateFormatter.string(from: date)
    }
}

//-------------------------------------
//MARK: - persian date
//-------------------------------------
extension String {
    func toPersianDate() -> String {
        return PersianDate.persianDate(time: self)
    }
    
    func toPersianDateTime() -> String {
        return PersianDate.persianDateTime(time: self)
    }
    
    func toPersianTime() -> String {
        return PersianDate.persianTime(time: self)
    }
}
