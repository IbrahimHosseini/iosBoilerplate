//
//  CustomButton.swift
//  baseproject
//
//  Created by Pazandish on 12/30/18.
//  Copyright © 2018 sehosseini. All rights reserved.
//

import UIKit
import Material

@IBDesignable
class CustomButton: CustomNibView {
    
    
    //-----------------------
    //MARK: - parameters
    //-----------------------
    public var onClick:(() -> Void)?
    @IBOutlet weak private(set) var btn: Button!
    
    //-----------------------
    //MARK: - view load
    //-----------------------
    override func awakeFromNib() {
        super.awakeFromNib()
        
        btn.backgroundColor = Colors.baseBlue
        btn.setTitleColor(Colors.white, for: .normal)
        btn.titleLabel?.font = UIFont.irMediumFont16()
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        btn.layer.cornerRadius = 0
        btn.clipsToBounds = true
    }
    
    //-----------------------
    //MARK: - button actions
    //-----------------------
    @IBAction func onClickBtn(_ sender: Any) {
        onClick?()
    }
    
    
}
