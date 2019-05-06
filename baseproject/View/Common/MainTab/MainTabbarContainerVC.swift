//
//  MainTabbarContainerVC.swift
//  baseproject
//
//  Created by sehosseini on 3/12/19.
//  Copyright © 2019 sehosseini. All rights reserved.
//

import UIKit

class MainTabbarContainerVC: BaseVC {

    //-----------------------
    //MARK: - parameters
    //-----------------------
    
    //-----------------------
    //MARK: - view load
    //-----------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBarHiddenStatus = .hide
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationBarHiddenStatus = .hide
        checkUniversalLink()
    }
    
    //-----------------------
    //MARK: - button actions
    //-----------------------
    
    //-----------------------
    //MARK: - functions
    //-----------------------
    override func applicationDidBecomeActive() {
        super.applicationDidBecomeActive()
        checkUniversalLink()
    }
    
    private func checkUniversalLink(){
        
//        if let itemUri = App.shared.itemUri {
//            App.shared.itemUri = nil
//            let vc = App.shared.rootViewController!.storyboard?
//                .instantiateViewController(withIdentifier: "ProductItemCtrl") as! ProductItemCtrl
//            vc.initWith(type: ProductItemCtrlInitType.withId(itemUri.itemID),nodeCode: itemUri.nodeCode)
//            App.shared.rootViewController!.pushViewController(vc, animated: true)
//        }
        
    }
    
    
    
}
