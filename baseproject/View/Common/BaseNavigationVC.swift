//
//  BaseNavigationVC.swift
//  baseproject
//
//  Created by Pazandish on 12/30/18.
//  Copyright © 2018 sehosseini. All rights reserved.
//

import UIKit

class BaseNavigationViewController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationBar.layer.shadowColor = Colors.gray50.cgColor
        self.navigationBar.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        self.navigationBar.layer.shadowRadius = 6.0
        self.navigationBar.layer.shadowOpacity = 0.5
        self.navigationBar.layer.masksToBounds = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
}
