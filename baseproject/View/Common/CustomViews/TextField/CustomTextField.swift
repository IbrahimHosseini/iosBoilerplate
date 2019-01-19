//
//  CustomTextField.swift
//  baseproject
//
//  Created by Pazandish on 12/30/18.
//  Copyright © 2018 sehosseini. All rights reserved.
//

import UIKit
import Material


@IBDesignable
class CustomUITextField: UITextField {
    var shouldPerformAction = true
    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        if !shouldPerformAction {
            return false
        }
        return super.canPerformAction(action, withSender: sender)
    }
}

class CustomTextField: CustomNibView {
    
    @IBOutlet weak var textField: CustomUITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
       
    }
}

