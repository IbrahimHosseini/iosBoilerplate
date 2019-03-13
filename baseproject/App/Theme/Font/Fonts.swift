//
//  Fonts.swift
//  baseproject
//
//  Created by Pazandish on 12/30/18.
//  Copyright © 2018 sehosseini. All rights reserved.
//

import UIKit
import Localize_Swift


extension UIFont {
    
    class func regularFont(ofSize fontSize: CGFloat) -> UIFont? {
        return UIFont(name: NVLocalized(regular_font), size: fontSize)
    }
    
    class func boldFont(ofSize fontSize: CGFloat) -> UIFont? {
        return UIFont(name: NVLocalized(bold_font), size: fontSize)
    }
    
    class func numberFont(ofSize fontSize: CGFloat) -> UIFont? {
        return UIFont(name: NVLocalized(number_font), size: fontSize)
    }
    
    class func numberBoldFont(ofSize fontSize: CGFloat) -> UIFont? {
        return UIFont(name: NVLocalized(number_bold_font), size: fontSize)
    }
    
    class func numberMediumFont(ofSize fontSize: CGFloat) -> UIFont? {
        return UIFont(name: NVLocalized(number_medium_font), size: fontSize)
    }
    
    class func numberLightFont(ofSize fontSize: CGFloat) -> UIFont? {
        return UIFont(name: NVLocalized(number_light_font), size: fontSize)
    }
    
    class func lightFont(ofSize fontSize: CGFloat) -> UIFont? {
        return UIFont(name: NVLocalized(light_font), size: fontSize)
    }
    
    class func italicFont(ofSize fontSize: CGFloat) -> UIFont? {
        return UIFont(name: NVLocalized(italic_font), size: fontSize)
    }
    
    class func mediumFont(ofSize fontSize: CGFloat) -> UIFont? {
        return UIFont(name: NVLocalized(medium_font), size: fontSize)
    }
    
}


