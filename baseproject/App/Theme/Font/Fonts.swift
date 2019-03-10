//
//  Fonts.swift
//  baseproject
//
//  Created by Pazandish on 12/30/18.
//  Copyright © 2018 sehosseini. All rights reserved.
//

import UIKit
import Localize_Swift


private func getRegularFont() -> String {
    if Localize.currentLanguage() == Language.persian.rawValue {
        return "IRANSansMobile"
    } else {
        return "Roboto-Regular"
    }
}

private func getBoldFont() -> String {
    if Localize.currentLanguage() == Language.persian.rawValue {
        return "IRANSansMobile-Bold"
    } else {
        return "Roboto-Bold"
    }
}

private func getNumFont() -> String {
    if Localize.currentLanguage() == Language.persian.rawValue {
        return "IRANSansMobileFaNum"
    } else {
        return "Roboto-Regular"
    }
}

private func getNumBoldFont() -> String {
    if Localize.currentLanguage() == Language.persian.rawValue {
        return "IRANSansMobileFaNum-Bold"
    } else {
        return "Roboto-Bold"
    }
}

private func getNumMediumFont() -> String {
    print("current language=> \(Localize.currentLanguage())")
    if Localize.currentLanguage() == Language.persian.rawValue {
        return "IRANSansMobileFaNum-Medium"
    } else {
        return "Roboto-Medium"
    }
}

private func getNumLightFont() -> String {
    if Localize.currentLanguage() == Language.persian.rawValue {
        return "IRANSansMobileFaNum-Light"
    } else {
        return "Roboto-Light"
    }
}

private func getlightFont() -> String {
    if Localize.currentLanguage() == Language.persian.rawValue {
        return "IRANSansMobile-Light"
    } else {
        return "Roboto-Light"
    }
}

private func getItalicFont() -> String {
    if Localize.currentLanguage() == Language.persian.rawValue {
        return "IRANSansMobile"
    } else {
        return "Roboto-Italic"
    }
}

private func getMediumFont() -> String {
    if Localize.currentLanguage() == Language.persian.rawValue {
        return "IRANSansMobile-Medium"
    } else {
        return "Roboto-Medium"
    }
}


extension UIFont {
    
    class func regularFont(ofSize fontSize: CGFloat) -> UIFont? {
        return UIFont(name: getRegularFont(), size: fontSize)
    }
    
    class func boldFont(ofSize fontSize: CGFloat) -> UIFont? {
        return UIFont(name: getBoldFont(), size: fontSize)
    }
    
    class func numberFont(ofSize fontSize: CGFloat) -> UIFont? {
        return UIFont(name: getNumFont(), size: fontSize)
    }
    
    class func numberBoldFont(ofSize fontSize: CGFloat) -> UIFont? {
        return UIFont(name: getNumBoldFont(), size: fontSize)
    }
    
    class func numberMediumFont(ofSize fontSize: CGFloat) -> UIFont? {
        return UIFont(name: getNumMediumFont(), size: fontSize)
    }
    
    class func numberLightFont(ofSize fontSize: CGFloat) -> UIFont? {
        return UIFont(name: getNumLightFont(), size: fontSize)
    }
    
    class func lightFont(ofSize fontSize: CGFloat) -> UIFont? {
        return UIFont(name: getlightFont(), size: fontSize)
    }
    
    class func italicFont(ofSize fontSize: CGFloat) -> UIFont? {
        return UIFont(name: getItalicFont(), size: fontSize)
    }
    
    class func mediumFont(ofSize fontSize: CGFloat) -> UIFont? {
        return UIFont(name: getMediumFont(), size: fontSize)
    }
    
}


