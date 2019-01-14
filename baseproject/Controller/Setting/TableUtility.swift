//
//  TableUtility.swift
//  chimidoni
//
//  Created by Seyed Ebrahim Hosseini on 12/31/18.
//  Copyright © 2018 sehosseini. All rights reserved.
//

import UIKit

extension NSObject {
    var className: String {
        return String(describing: type(of: self))
    }
    
    class var className: String {
        return String(describing: self)
    }
}

extension UITableViewCell {
    class var identifier: String {
        get {
            return self.className
        }
    }
}

extension UICollectionViewCell {
    class var identifier: String {
        get {
            return self.className
        }
    }
}

extension UITabBarController {
    class var identifier: String {
        get {
            return self.className
        }
    }
}

extension UITableViewCell {
    
    public func tableView() -> UITableView? {
        var v: UIView? = self.contentView
        while v != nil {
            if v is UITableView {
                return v as? UITableView;
            }
            v = v?.superview;
        }
        return nil
    }
    
    public func updateCellHeight() {
        let tbv = self.tableView()
        UIView.setAnimationsEnabled(false)
        
        if let indexPath = tbv?.indexPath(for: self) {
            tbv?.reloadRows(at: [indexPath], with: .none)
        } else {
            self.setNeedsUpdateConstraints()
            tbv?.beginUpdates()
            tbv?.endUpdates()
        }
        UIView.setAnimationsEnabled(true)
    }
}


