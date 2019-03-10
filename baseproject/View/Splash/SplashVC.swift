//
//  SplashVC.swift
//  baseproject
//
//  Created by Pazandish on 12/30/18.
//  Copyright © 2018 sehosseini. All rights reserved.
//

import UIKit

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
    
    private func viewDesign() {
        
        
        logoImage.image = UIImage(named: "logo")
        logoImage.contentMode = .scaleAspectFit
        
        retryButton.setTitleColor(Colors.blue, for: .normal)
        retryButton.setTitle(NVLocalized(NVOverlayViewRetryBtnTitle), for: .normal)
        retryButton.titleLabel?.font = UIFont.regularFont(ofSize: 15)
        retryButton.isHidden = true
        
        indicator.color = Colors.blue
        indicator.hidesWhenStopped = true
        indicator.startAnimating()
        
        
    }
    
    private func checkVersion() {
        
        retryButton.isHidden = true
        indicator.startAnimating()
        
        if App.shared.userToken != nil {
            goToMain()
        } else {
            goToLogin()
        }
        
        indicator.stopAnimating()
    }
    
    private func goToMain() {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "MainVC") as! MainVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    private func goToLogin() {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "LoginGetMobileVC") as! LoginGetMobileVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
