//
//  Colors.swift
//  baseproject
//
//  Created by Pazandish on 12/30/18.
//  Copyright © 2018 sehosseini. All rights reserved.
//

import UIKit

public class Colors : NSObject {
    
    //// Cache
    
    private struct Cache {
        
        static let baseBlue: UIColor = UIColor(red: 0.110, green: 0.592, blue: 0.745, alpha: 1.000)
        static let black: UIColor = UIColor(red: 0.000, green: 0.000, blue: 0.000, alpha: 1.000)
        static let gray: UIColor = UIColor(red: 0.490, green: 0.490, blue: 0.490, alpha: 1.000)
        static let white: UIColor = UIColor(red: 1.000, green: 1.000, blue: 1.000, alpha: 1.000)
        static let red: UIColor = UIColor(red: 0.988, green: 0.063, blue: 0.259, alpha: 1)
        static let orange: UIColor = UIColor(red: 0.988, green: 0.376, blue: 0.125, alpha: 1)
        static let darkBlue: UIColor = UIColor(red: 0.012, green: 0.165, blue: 0.294, alpha: 1)
        static let green: UIColor = UIColor(red: 0.090, green: 0.643, blue: 0.118, alpha: 1)
        static let tealBlue: UIColor = UIColor(red: 0.447, green: 0.804, blue: 0.918, alpha: 1)
        static let blue: UIColor = UIColor(red: 0.106, green: 0.655, blue: 0.855, alpha: 1)
        static let background: UIColor = UIColor(red: 0.490, green: 0.490, blue: 0.490, alpha: 0.05)
        
    }
    
    //// Colors
    @objc public dynamic class var baseBlue: UIColor { return Cache.baseBlue}
    @objc public dynamic class var black: UIColor { return Cache.black }
    @objc public dynamic class var gray: UIColor { return Cache.gray }
    @objc public dynamic class var white: UIColor { return Cache.white }
    @objc public dynamic class var red: UIColor { return Cache.red }
    @objc public dynamic class var orange: UIColor { return Cache.orange }
    @objc public dynamic class var darkBlue: UIColor { return Cache.darkBlue }
    @objc public dynamic class var green: UIColor { return Cache.green }
    @objc public dynamic class var tealBlue: UIColor { return Cache.tealBlue }
    @objc public dynamic class var blue: UIColor { return Cache.blue }
    @objc public dynamic class var background: UIColor { return Cache.background }
    
}
