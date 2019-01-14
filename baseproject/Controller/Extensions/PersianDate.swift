//
//  PersianDate.swift
//  baseproject
//
//  Created by Pazandish on 12/30/18.
//  Copyright © 2018 sehosseini. All rights reserved.
//

import Foundation


extension String {
    func toPersianDate() -> String {
        return App.shared.persianDate(time: self)
    }
    
    func toPersianDateTime() -> String {
        return App.shared.persianDateTime(time: self)
    }
    
    func toPersianTime() -> String {
        return App.shared.persianTime(time: self)
    }
}
