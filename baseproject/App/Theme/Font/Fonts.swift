//
//  Fonts.swift
//  baseproject
//
//  Created by sehosseini on 12/30/18.
//  Copyright © 2018 sehosseini. All rights reserved.
//

import UIKit
import Localize_Swift


extension UIFont {
    
    class func regular(ofSize fontSize: CGFloat) -> UIFont? {
        return UIFont(name: NVLocalized(regular_font), size: fontSize)
    }
    
    class func bold(ofSize fontSize: CGFloat) -> UIFont? {
        return UIFont(name: NVLocalized(bold_font), size: fontSize)
    }
    
    class func number(ofSize fontSize: CGFloat) -> UIFont? {
        return UIFont(name: NVLocalized(number_font), size: fontSize)
    }
    
    class func numberBold(ofSize fontSize: CGFloat) -> UIFont? {
        return UIFont(name: NVLocalized(number_bold_font), size: fontSize)
    }
    
    class func numberMedium(ofSize fontSize: CGFloat) -> UIFont? {
        return UIFont(name: NVLocalized(number_medium_font), size: fontSize)
    }
    
    class func numberLight(ofSize fontSize: CGFloat) -> UIFont? {
        return UIFont(name: NVLocalized(number_light_font), size: fontSize)
    }
    
    class func light(ofSize fontSize: CGFloat) -> UIFont? {
        return UIFont(name: NVLocalized(light_font), size: fontSize)
    }
    
    class func italic(ofSize fontSize: CGFloat) -> UIFont? {
        return UIFont(name: NVLocalized(italic_font), size: fontSize)
    }
    
    class func medium(ofSize fontSize: CGFloat) -> UIFont? {
        return UIFont(name: NVLocalized(medium_font), size: fontSize)
    }
    
}


