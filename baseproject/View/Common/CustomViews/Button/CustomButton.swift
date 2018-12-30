//
//  CustomButton.swift
//  baseproject
//
//  Created by Pazandish on 12/30/18.
//  Copyright © 2018 sehosseini. All rights reserved.
//

import UIKit

@IBDesignable
class CustomButton: CustomNibView {

    
    //-----------------------
    //MARK: - parameters
    //-----------------------
    public var onClick:(() -> Void)?
    
    
    //-----------------------
    //MARK: - view load
    //-----------------------
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
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
