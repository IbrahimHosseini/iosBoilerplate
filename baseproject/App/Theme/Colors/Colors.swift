//
//  Colors.swift
//  baseproject
//
//  Created by sehosseini on 12/30/18.
//  Copyright © 2018 sehosseini. All rights reserved.
//

import UIKit

public class Colors : NSObject {
    
    //// Cache
    
    private struct Cache {
        
        static let black: UIColor = UIColor(red: 0.000, green: 0.000, blue: 0.000, alpha: 1.000)
        static let gray: UIColor = UIColor(red: 0.557, green: 0.557, blue: 0.576, alpha: 1.000)
        static let midGray: UIColor = UIColor(red: 0.780, green: 0.780, blue: 0.800, alpha: 1.000)
        static let lightMidGray: UIColor = UIColor(red: 0.820, green: 0.820, blue: 0.839, alpha: 1.000)
        static let lightGray: UIColor = UIColor(red: 0.898, green: 0.898, blue: 0.918, alpha: 1.000)
        static let extraLightGray: UIColor = UIColor(red: 0.937, green: 0.937, blue: 0.957, alpha: 1.000)
        static let white: UIColor = UIColor(red: 1.000, green: 1.000, blue: 1.000, alpha: 1.000)
        static let red: UIColor = UIColor(red: 1.000, green: 0.231, blue: 0.188, alpha: 1)
        static let orange: UIColor = UIColor(red: 1.000, green: 0.584, blue: 0.000, alpha: 1)
        static let yellow: UIColor = UIColor(red: 1.000, green: 0.800, blue: 0.000, alpha: 1)
        static let green: UIColor = UIColor(red: 0.298, green: 0.851, blue: 0.392, alpha: 1)
        static let tealBlue: UIColor = UIColor(red: 0.353, green: 0.784, blue: 0.980, alpha: 1)
        static let blue: UIColor = UIColor(red: 0.000, green: 0.478, blue: 1.000, alpha: 1)
        static let purple: UIColor = UIColor(red: 0.345, green: 0.337, blue: 0.839, alpha: 1)
        static let pink: UIColor = UIColor(red: 0.345, green: 0.337, blue: 0.839, alpha: 1)
        static let background: UIColor = UIColor(red: 0.937, green: 0.937, blue: 0.957, alpha: 1.000)
        
    }
    
    //// Colors
    @objc public dynamic class var black: UIColor { return Cache.black }
    @objc public dynamic class var gray: UIColor { return Cache.gray }
    @objc public dynamic class var midGray: UIColor { return Cache.midGray }
    @objc public dynamic class var lightMidGray: UIColor { return Cache.lightMidGray }
    @objc public dynamic class var lightGray: UIColor { return Cache.lightGray }
    @objc public dynamic class var extraLightGray: UIColor { return Cache.extraLightGray }
    @objc public dynamic class var white: UIColor { return Cache.white }
    @objc public dynamic class var red: UIColor { return Cache.red }
    @objc public dynamic class var orange: UIColor { return Cache.orange }
    @objc public dynamic class var yellow: UIColor { return Cache.yellow }
    @objc public dynamic class var green: UIColor { return Cache.green }
    @objc public dynamic class var tealBlue: UIColor { return Cache.tealBlue }
    @objc public dynamic class var blue: UIColor { return Cache.blue }
    @objc public dynamic class var purple: UIColor { return Cache.purple }
    @objc public dynamic class var pink: UIColor { return Cache.pink }
    @objc public dynamic class var background: UIColor { return Cache.background }
    
}
