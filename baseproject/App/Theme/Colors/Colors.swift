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
        
        static let black: UIColor = UIColor(red: 0.000, green: 0.000, blue: 0.000, alpha: 1.000)
        static let gray: UIColor = UIColor(red: 0.490, green: 0.490, blue: 0.490, alpha: 1.000)
        static let white: UIColor = UIColor(red: 1.000, green: 1.000, blue: 1.000, alpha: 1.000)
        static let red: UIColor = UIColor(red: 1.000, green: 0.231, blue: 0.188, alpha: 1)
        static let orange: UIColor = UIColor(red: 1.000, green: 0.584, blue: 0.000, alpha: 1)
        static let yellow: UIColor = UIColor(red: 1.000, green: 0.800, blue: 0.000, alpha: 1)
        static let green: UIColor = UIColor(red: 0.298, green: 0.851, blue: 0.392, alpha: 1)
        static let tealBlue: UIColor = UIColor(red: 0.353, green: 0.784, blue: 0.980, alpha: 1)
        static let blue: UIColor = UIColor(red: 0.000, green: 0.478, blue: 1.000, alpha: 1)
        static let purple: UIColor = UIColor(red: 0.345, green: 0.337, blue: 0.839, alpha: 1)
        static let pink: UIColor = UIColor(red: 0.345, green: 0.337, blue: 0.839, alpha: 1)
        static let background: UIColor = UIColor(red: 0.490, green: 0.490, blue: 0.490, alpha: 0.05)
        
    }
    
    //// Colors
    @objc public dynamic class var black: UIColor { return Cache.black }
    @objc public dynamic class var gray: UIColor { return Cache.gray }
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
