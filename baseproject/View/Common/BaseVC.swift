//
//  BaseVC.swift
//  baseproject
//
//  Created by Pazandish on 12/30/18.
//  Copyright © 2018 sehosseini. All rights reserved.
//

import UIKit
import FontAwesome_swift
import SnapKit
import SwiftyUserDefaults
import SCLAlertView
import Toaster
import PKHUD

class BaseVC: UIViewController, UIGestureRecognizerDelegate {

    //-----------------------
    //MARK: - parameters
    //-----------------------
    enum BackStatus {
        case showBackIfExist
        case hide
    }
    
    enum NavigationBarHiddenStatus {
        case show
        case hide
    }
    
    var backStatus: BackStatus = .showBackIfExist {
        didSet {
            updateSwipe()
            styleLeftButtons()
        }
    }
    
    var navigationBarHiddenStatus: NavigationBarHiddenStatus = .show {
        didSet {
            updateNavigationBar()
        }
    }
    
    
    //-----------------------
    //MARK: - view load
    //-----------------------
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        styleLeftButtons()
        updateNavigationBar()
        updateSwipe()
        setNav()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        styleLeftButtons()
        updateNavigationBar()
        setNav()
    }
    
    
    //-----------------------
    //MARK: - button actions
    //-----------------------
    
    //-----------------------
    //MARK: - functions
    //-----------------------
    private func updateSwipe() {
        var swipeBack = false
        if (self.navigationController?.viewControllers.count ?? 0) > 2 && backStatus == .showBackIfExist {
            swipeBack = true
        }
        
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = swipeBack
        self.navigationController?.interactivePopGestureRecognizer?.delegate = nil
    }
    
    private func styleLeftButtons() {
        if (self.navigationController?.viewControllers.count ?? 0) > 2 && backStatus == .showBackIfExist {
            let btn = UIBarButtonItem(title: "\u{f104}",
                                      style: UIBarButtonItem.Style.plain,
                                      target: self,
                                      action: #selector(BaseVC.goBack))
            
            for  state in [.disabled,.focused,.highlighted,.normal] as [UIControl.State] {
                btn.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.fontAwesome(ofSize: 22, style: .solid),
                                            NSAttributedString.Key.foregroundColor: Colors.white], for: state)
            }
            
            self.navigationItem.backBarButtonItem = btn
            self.navigationItem.leftBarButtonItems = [btn]
        }else{
            self.navigationItem.backBarButtonItem = nil
            self.navigationItem.leftBarButtonItems = nil
            self.navigationItem.hidesBackButton = true
            
        }
    }
    
    private func updateNavigationBar() {
        self.navigationController?.setNavigationBarHidden(navigationBarHiddenStatus == .hide, animated: false)
    }
    
    @objc internal func goBack() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc internal func closeView() {
        self.dismiss(animated: true, completion: nil)
    }
    
    public func initTapDismissal() {
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(endEditing)))
    }
    
    @objc public func endEditing() {
        self.view.endEditing(true)
    }
  
}

extension BaseVC {
    
    
    func setNav(title: String? = nil, largTitle: Bool = false, backgroundColor: UIColor? = nil) {
        if title != nil {
            navigationItem.title = title
            
            let attributes = [ NSAttributedString.Key.font: UIFont.numberMediumFont(ofSize: 15)!,
                               NSAttributedString.Key.foregroundColor: Colors.white]
            
            if #available(iOS 11.0, *) {
                self.navigationController?.navigationBar.prefersLargeTitles = largTitle
                self.navigationController?.navigationBar.largeTitleTextAttributes = attributes
            } else {
                self.navigationController?.navigationBar.titleTextAttributes = attributes
            }
            
            
        } else {
            let header = UIImageView(frame: CGRect(x: 0, y: 0, width: (1060.0 / 472.0 ) * 44 , height: 44))
            header.contentMode = .scaleAspectFit
            header.image = UIImage(named:"logo")!
            let w = header.widthAnchor.constraint(equalToConstant: header.frame.width)
            w.priority = UILayoutPriority.defaultHigh
            w.isActive = true
            let h = header.heightAnchor.constraint(equalToConstant: header.frame.height)
            h.priority = UILayoutPriority.defaultHigh
            h.isActive = true
            navigationItem.titleView = header
        }
    }
    
}
