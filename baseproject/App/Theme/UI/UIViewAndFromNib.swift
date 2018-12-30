//
//  UIViewAndFromNib.swift
//  chimidoni
//
//  Created by Seyed Ebrahim Hosseini on 12/31/18.
//  Copyright © 2018 sehosseini. All rights reserved.
//

import UIKit

extension UIView {
    
    public class func fromNib() -> Self {
        return fromNi()
    }
    
    @discardableResult
    private class func fromNi<T : UIView>() -> T {
        let nibName = String(describing: self)
        //        let nibName = String(describing: type(of: self))
        guard let view = Bundle.main.loadNibNamed(nibName, owner: self, options: nil)?[0] as? T else {
            fatalError()
        }
        view.translatesAutoresizingMaskIntoConstraints = true
        return view
    }
}
