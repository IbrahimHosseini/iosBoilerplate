//
//  SplashVC.swift
//  baseproject
//
//  Created by sehosseini on 12/30/18.
//  Copyright © 2018 sehosseini. All rights reserved.
//

import UIKit

///This view is firs view and you can check login status and version of app
class SplashVC: BaseVC {

    //-----------------------
    //MARK: - parameters
    //-----------------------
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var retryButton: UIButton!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    //-----------------------
    //MARK: - view load
    //-----------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        viewDesign()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        checkVersion()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        checkVersion()
    }
    
    //-----------------------
    //MARK: - button actions
    //-----------------------
    @IBAction func onClickRetry(_ sender: Any) {
        checkVersion()
    }

    //-----------------------
    //MARK: - functions
    //-----------------------
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    ///At this function you can set view design
    private func viewDesign() {
        
        logoImage.image = UIImage(named: "logo")
        logoImage.contentMode = .scaleAspectFit
        
        retryButton.setTitleColor(Colors.blue, for: .normal)
        retryButton.setTitle(NVLocalized(NVOverlayViewRetryBtnTitle), for: .normal)
        retryButton.titleLabel?.font = UIFont.regular(ofSize: 15)
        retryButton.isHidden = true
        
        indicator.color = Colors.blue
        indicator.hidesWhenStopped = true
        indicator.startAnimating()
        
        
    }
    
    
    private func checkVersion() {
        
        retryButton.isHidden = true
        indicator.startAnimating()
        
        if App.shared.userToken == nil {
            goToMain()
        } else {
            goToLogin()
        }
        
        indicator.stopAnimating()
    }
    
    ///This function enables you to go to the main page
    ///You have the main tab bar and a single view
    ///To select each one just need to uncomment that
    private func goToMain() {
        
        
        // uncomment if you have main tab bar view
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "MainTabbarContainerVC") as! MainTabbarContainerVC
        self.navigationController?.pushViewController(vc, animated: true)
        
        // uncomment if you have single view
//        let vc = self.storyboard?.instantiateViewController(withIdentifier: "MainVC") as! MainVC
//        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    ///This function send you to login view
    private func goToLogin() {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "LoginGetMobileVC") as! LoginGetMobileVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
