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
        setNav(title: NVLocalized(mainViewTitle), largTitle: true, tinColor: Colors.green)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNav(title: NVLocalized(mainViewTitle), largTitle: true, tinColor: Colors.green)
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
