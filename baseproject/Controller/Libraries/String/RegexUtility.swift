//
//  RegexUtility.swift
//  baseproject
//
//  Created by sehosseini on 1/14/19.
//  Copyright © 2019 sehosseini. All rights reserved.
//

import Foundation


extension String {
    
    mutating func replacingRegexMatches(pattern: String, with replaceStr: String) {
        do {
            let regex = try NSRegularExpression(pattern: pattern, options: NSRegularExpression.Options.caseInsensitive)
            let range = NSMakeRange(0, self.count)
            self = regex.stringByReplacingMatches(in: self, options: [], range: range, withTemplate: replaceStr)
        } catch {
            return
        }
    }
    func replacingRegexMatchesTest(pattern: String, with replaceStr: String) -> String {
        do {
            let regex = try NSRegularExpression(pattern: pattern, options: NSRegularExpression.Options.caseInsensitive)
            let range = NSMakeRange(0, self.count)
            return regex.stringByReplacingMatches(in: self, options: [], range: range, withTemplate: replaceStr)
        } catch {
            return ""
        }
    }
    
    
    func passwordValidation() -> Bool {
        let regex = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d$@$!%*?&]{6,}"//"^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[$@$!%*?&])[A-Za-z\\d$@$!%*?&]{8,}" //Minimum 8 characters at least 1 Uppercase Alphabet, 1 Lowercase Alphabet, 1 Number and 1 Special Character
        let isMatched = NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: self)
        if isMatched  == true {
            return true
        }  else {
            return false
        }
    }
    
    func mobileValidation() -> Bool {
        
        let regex = "(\\d{11,})"
        let isMatched = NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: self)
        if isMatched  == true {
            return true
        } else {
            return false
        }
    }

    func emailValidation() -> Bool {
        
        let regex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        let isMatched = NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: self)
        
        if isMatched  == true {
            return true
        }  else {
            return false
        }
    }
    
    
}

