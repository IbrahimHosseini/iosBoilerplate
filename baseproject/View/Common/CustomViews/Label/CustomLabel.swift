//
//  CustomLabel.swift
//  baseproject
//
//  Created by Pazandish on 1/19/19.
//  Copyright © 2019 sehosseini. All rights reserved.
//

import Foundation
import UIKit

class CustomLabel: UILabel {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    func commonInit() {
        self.textColor = Colors.black
        self.font = UIFont.regularFont(ofSize: 15)
        setProperties(border: 0.0, border: Colors.black)
    }
    
    func setProperties(border with: Float, border color: UIColor) {
        
        self.layer.borderColor = color.cgColor
        self.layer.borderWidth = CGFloat(with)
        
    }
}

