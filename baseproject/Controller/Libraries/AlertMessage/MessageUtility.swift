//
//  MessageUtility.swift
//  baseproject
//
//  Created by Pazandish on 12/30/18.
//  Copyright © 2018 sehosseini. All rights reserved.
//

import Foundation
import SCLAlertView

enum AlertType {
    case info
    case warning
    case error
    case notic
    case success
}

class AletrView {
    
    class func message(title: String?, body: String?, buttonTitle: String?, type: AlertType) {
        
        let appearance = SCLAlertView.SCLAppearance(
            kDefaultShadowOpacity: 0.5,
            kTitleFont: UIFont.irNumBoldFont10()!,
            kTextFont: UIFont.irNumMediumFont13()!,
            kButtonFont: UIFont.irNumMediumFont15()!,
            showCloseButton: false,
            showCircularIcon: true,
            contentViewCornerRadius: 15.0,
            fieldCornerRadius: 5.0,
            buttonCornerRadius: 5.0,
            hideWhenBackgroundViewIsTapped: true,
            circleBackgroundColor: Colors.white,
            titleColor: Colors.gray,
            dynamicAnimatorActive: true,
            disableTapGesture: false)
        
        let alert = SCLAlertView(appearance: appearance)
        
        alert.addButton(buttonTitle ?? NVLocalized(undrestood)) {}
        
        switch type {
        case .error:
            alert.showError(title ?? "", subTitle: body ?? "")
        case .warning:
            alert.showWarning(title ?? "", subTitle: body ?? "")
        case .info:
            alert.showInfo(title ?? "", subTitle: body ?? "")
        case .success:
            alert.showSuccess(title ?? "", subTitle: body ?? "")
        case .notic:
            alert.showNotice(title ?? "", subTitle: body ?? "")
        default:
            break
        }
    }
}


