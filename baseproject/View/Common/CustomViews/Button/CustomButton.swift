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
    @IBOutlet weak var btn: Button!
    
    //-----------------------
    //MARK: - view load
    //-----------------------
    override func awakeFromNib() {
        super.awakeFromNib()
        
        btn.backgroundColor = Colors.darkBlue
        btn.setTitleColor(Colors.white, for: .normal)
        btn.titleLabel?.font = UIFont.robotoBold15()
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        btn.layer.cornerRadius = btn.frame.height/2 - 7
        btn.clipsToBounds = true
    }
    
    //-----------------------
    //MARK: - button actions
    //-----------------------
    @IBAction func onClickBtn(_ sender: Any) {
        onClick?()
    }
    //-----------------------
    //MARK: - functions
    //-----------------------

    

}
