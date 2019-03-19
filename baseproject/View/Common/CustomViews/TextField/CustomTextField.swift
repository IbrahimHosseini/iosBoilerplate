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
class CustomUITextField: TextField {
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
        
        initTextField()
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
}

extension CustomTextField: TextFieldDelegate {
    
    private func initTextField() {
        
        textField.dividerNormalColor = Colors.black
        textField.dividerActiveColor = Colors.blue
        textField.font = UIFont.regular(ofSize: 15)
        textField.textAlignment = .right
        textField.isPlaceholderAnimated = true
        textField.placeholderVerticalOffset = 30.0
        textField.isPlaceholderUppercasedWhenEditing = true
        textField.placeholderActiveColor = Colors.blue
        textField.placeholderNormalColor = Colors.blue
        textField.placeholderLabel.textColor = Colors.black
        textField.textColor = Colors.white
        //        textField.attributedPlaceholder = NSAttributedString(string: "placeholder text", attributes: [NSAttributedString.Key.foregroundColor: Colors.materialLight])
        
        textField.delegate = self
        
    }
    
    public func textFieldDidEndEditing(_ textField: UITextField) {
        (textField as? ErrorTextField)?.isErrorRevealed = false
    }
    
    public func textFieldShouldClear(_ textField: UITextField) -> Bool {
        (textField as? ErrorTextField)?.isErrorRevealed = false
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        (textField as? ErrorTextField)?.isErrorRevealed = true
        return true
    }
}
