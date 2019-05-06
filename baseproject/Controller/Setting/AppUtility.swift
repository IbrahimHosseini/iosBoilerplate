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


@discardableResult
func openUrl(url: URL) -> Bool {
    
    if !UIApplication.shared.canOpenURL(url) {
        return false
    }
    
    if #available(iOS 10.0, *) {
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    } else {
        UIApplication.shared.openURL(url)
    }
    return true
}
