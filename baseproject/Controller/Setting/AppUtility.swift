//
//  AppUtility.swift
//  baseproject
//
//  Created by sehosseini on 1/14/19.
//  Copyright © 2019 sehosseini. All rights reserved.
//

import Foundation
import UIKit
import SafariServices
import PKHUD
import Toaster


@discardableResult
func openUrl(url: URL) -> Bool {
    
    if !UIApplication.shared.canOpenURL(url) {
        Toast(text: NVLocalized("Your address is not valid"), duration: Delay.long).show()
        return false
    }
    
    if #available(iOS 10.0, *) {
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    } else {
        UIApplication.shared.openURL(url)
    }
    return true
}

@discardableResult
func openUrlInApp(url: URL, view: UIViewController) -> Bool {
    
    if !UIApplication.shared.canOpenURL(url) {
        Toast(text: NVLocalized("Your address is not valid"), duration: Delay.long).show()
        return false
    }
    
    let vc = SFSafariViewController(url: url)
    view.present(vc, animated: true, completion: nil)
    
    return true
}
