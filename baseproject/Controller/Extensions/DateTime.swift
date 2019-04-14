//
//  DateTime.swift
//  baseproject
//
//  Created by Pazandish on 12/30/18.
//  Copyright © 2018 sehosseini. All rights reserved.
//

import Foundation
import Localize_Swift


class DateTime {
    
    class func calendarIdentifier() -> Calendar.Identifier {
        
        if Localize.currentLanguage() == Language.persian.rawValue {
            return .persian
        } else {
            return .gregorian
        }
        
    }
    
    class func dateTimeFormat(time: String)-> String {
        
        var unixTimestamp = Double(time)
        unixTimestamp = unixTimestamp!
        let date = Date(timeIntervalSince1970: unixTimestamp!)
        
        let dateFormatter = DateFormatter()
        dateFormatter.calendar = Calendar(identifier: calendarIdentifier())
        
        if Localize.currentLanguage() == Language.persian.rawValue {
            dateFormatter.dateFormat = "yyyy/MM/dd - HH:mm"
        } else {
            dateFormatter.dateFormat = "dd/MM/yyyy - HH:mm"
        }
        
        return dateFormatter.string(from: date)
    }
    
    class func timeFormat(time: String)-> String {
        
        var unixTimestamp = Double(time)
        unixTimestamp = unixTimestamp!
        let date = Date(timeIntervalSince1970: unixTimestamp!)
        
        let dateFormatter = DateFormatter()
        dateFormatter.calendar = Calendar(identifier: calendarIdentifier())
        dateFormatter.dateFormat = "HH:mm"
        
        return dateFormatter.string(from: date)
    }
    
    class func dateFormat(time: String)-> String {
        
        var unixTimestamp = Double(time)
        unixTimestamp = unixTimestamp!
        let date = Date(timeIntervalSince1970: unixTimestamp!)
        
        let dateFormatter = DateFormatter()
        dateFormatter.calendar = Calendar(identifier: calendarIdentifier())
        
        if Localize.currentLanguage() == Language.persian.rawValue {
            dateFormatter.dateFormat = "yyyy/MM/dd"
        } else {
            dateFormatter.dateFormat = "dd/MM/yyyy"
        }
        
        return dateFormatter.string(from: date)
    }
    
    
}

//-------------------------------------
//MARK: - persian date
//-------------------------------------
extension String {
    func toDate() -> String {
        return DateTime.dateFormat(time: self)
    }
    
    func toDateTime() -> String {
        return DateTime.dateTimeFormat(time: self)
    }
    
    func toTime() -> String {
        return DateTime.timeFormat(time: self)
    }
}
