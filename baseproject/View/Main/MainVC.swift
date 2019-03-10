//
//  MainVC.swift
//  baseproject
//
//  Created by Pazandish on 12/30/18.
//  Copyright © 2018 sehosseini. All rights reserved.
//

import UIKit

class MainVC: BaseVC {

    //-----------------------
    //MARK: - parameters
    //-----------------------
    
    //-----------------------
    //MARK: - view load
    //-----------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        viewDesign()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupSideMenu()
        setMenu()
    }
    
    //-----------------------
    //MARK: - button actions
    //-----------------------
    
    //-----------------------
    //MARK: - functions
    //-----------------------
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func viewDesign() {
        
    }

}
