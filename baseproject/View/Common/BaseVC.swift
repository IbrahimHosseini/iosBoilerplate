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
import SideMenu
import Localize_Swift

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
        setMenu()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        styleLeftButtons()
        updateNavigationBar()
        setMenu()
    }
    
    
    //-----------------------
    //MARK: - button actions
    //-----------------------
    
    //-----------------------
    //MARK: - functions
    //-----------------------
    @objc internal func applicationDidBecomeActive(){
        
    }
    
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
    
    
    func setNav(title: String? = nil, largTitle: Bool = false, tinColor: UIColor? = nil) {
        
        navigationController?.navigationBar.barTintColor = tinColor
        
        
        
        if title != nil {
            navigationItem.title = title
            
            let attributes = [ NSAttributedString.Key.font: UIFont.numberBold(ofSize: 35)!,
                               NSAttributedString.Key.foregroundColor: Colors.black]
            
            if #available(iOS 11.0, *) {
                self.navigationController?.navigationBar.prefersLargeTitles = largTitle
                self.navigationController?.navigationBar.largeTitleTextAttributes = attributes
            } else {
                self.navigationController?.navigationBar.titleTextAttributes = attributes
            }
            
            
        } else {
            let header = UIImageView(frame: CGRect(x: 0, y: 0, width: (1060.0 / 472.0 ) * 44 , height: 44))
            header.contentMode = .scaleAspectFit
            header.image = UIImage(named:"nav_logo")!
            let w = header.widthAnchor.constraint(equalToConstant: header.frame.width)
            w.priority = UILayoutPriority.defaultHigh
            w.isActive = true
            let h = header.heightAnchor.constraint(equalToConstant: header.frame.height)
            h.priority = UILayoutPriority.defaultHigh
            h.isActive = true
            navigationItem.titleView = header
        }
    }
    
    func setupSideMenu() {
        // Define the menus
        if Localize.currentLanguage() == Language.persian.rawValue {
            SideMenuManager.default.menuRightNavigationController = storyboard!.instantiateViewController(withIdentifier: "RightMenuVC") as? UISideMenuNavigationController
        } else {
            SideMenuManager.default.menuLeftNavigationController = storyboard!.instantiateViewController(withIdentifier: "RightMenuVC") as? UISideMenuNavigationController
        }
        // Enable gestures. The left and/or right menus must be set up above for these to work.
        // Note that these continue to work on the Navigation Controller independent of the View Controller it displays!
        SideMenuManager.default.menuAddPanGestureToPresent(toView: self.navigationController!.navigationBar)
        SideMenuManager.default.menuAddScreenEdgePanGesturesToPresent(toView: self.navigationController!.view)
        SideMenuManager.default.menuPresentMode = .viewSlideOut
        SideMenuManager.default.menuWidth = 280
        SideMenuManager.default.menuPresentMode = .menuSlideIn
        SideMenuManager.default.menuAnimationTransformScaleFactor = 1
        SideMenuManager.default.menuAnimationBackgroundColor = Colors.black
    }
    
    
    func setMenu() {
        //Menu bar button item
        let btnMenu = UIButton(type: .custom)
        btnMenu.setImage(UIImage(named: "menu")?.tint(with: Colors.black)?.resizeImage(to: CGSize(width: 25, height: 25)), for: .normal)
        btnMenu.addTarget(self, action:#selector(onMenu), for: .touchUpInside)
        let menuIcon = UIBarButtonItem(customView: btnMenu)
        menuIcon.customView?.frame = CGRect(x: 0, y: 0, width: 30, height: 22)
        let wTicket = menuIcon.customView?.widthAnchor.constraint(equalToConstant: 30)
        wTicket?.priority = UILayoutPriority.defaultHigh
        wTicket?.isActive = true
        let hTicket = menuIcon.customView?.heightAnchor.constraint(equalToConstant: 25)
        hTicket?.priority = UILayoutPriority.defaultHigh
        hTicket?.isActive = true
        
        self.navigationItem.leftBarButtonItems = [menuIcon]
        
        setupSideMenu()
        
    }
    
    @objc private func onMenu() {
        if Localize.currentLanguage() == Language.persian.rawValue {
            self.present(SideMenuManager.default.menuRightNavigationController!, animated: true, completion: nil)
        } else {
            self.present(SideMenuManager.default.menuLeftNavigationController!, animated: true, completion: nil)
        }
    }
    
}
