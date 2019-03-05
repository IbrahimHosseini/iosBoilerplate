//
//  NVOverlayView.swift
//  baseproject
//
//  Created by Pazandish on 12/30/18.
//  Copyright © 2018 sehosseini. All rights reserved.
//

import UIKit


enum NVOverlayStatus {
    
    case loading
    case failed(String,()->())//description,on retry
    
    static func ==(lhs: NVOverlayStatus, rhs: NVOverlayStatus) -> Bool {
        switch (lhs,rhs) {
        case (.loading,.loading):
            return true
        case (.failed,.failed):
            return true
        default:
            return false
        }
    }
}

class NVOverlayView: UIView {
    static func show(in parentView:UIView = UIApplication.shared.keyWindow!, status:NVOverlayStatus = .loading){
        if let v = parentView.viewWithTag(14325) as? NVOverlayView{
            v.status = status
            parentView.bringSubviewToFront(v)
        }else{
            let v = NVOverlayView.fromNib()
            v.tag = 14325
            v.frame = parentView.bounds
            v.status = status
            parentView.addSubview(v)
            parentView.bringSubviewToFront(v)
        }
    }
    
    static func hide(in parentView:UIView = UIApplication.shared.keyWindow!){
        parentView.viewWithTag(14325)?.removeFromSuperview()
    }
    
    static func change(status:NVOverlayStatus, in parentView:UIView = UIApplication.shared.keyWindow!){
        let overLay = parentView.viewWithTag(14325) as? NVOverlayView
        overLay?.status = status
    }
    
    
    @IBOutlet private var errorDescription: UILabel!
    @IBOutlet private var errorBtn: UIButton!
    @IBOutlet var indicator: UIActivityIndicatorView!
    @IBOutlet var errorParentView: UIView!
    
    private var status: NVOverlayStatus! {
        didSet{
            self.errorParentView.isHidden = (status! == NVOverlayStatus.loading)
            self.indicator.isHidden = !self.errorParentView.isHidden
            !self.indicator.isHidden ? self.indicator.startAnimating() : self.indicator.stopAnimating()
            
            if case NVOverlayStatus.failed(let description,_) = status! {
                self.errorDescription.text = description
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        errorDescription.text = NVLocalized(NVOverlayViewDefaultDescription)
        errorDescription.font = UIFont.irNumRegularFont10()
        errorBtn.titleLabel?.font = UIFont.irNumMediumFont12()
        errorBtn.setTitle(NVLocalized(NVOverlayViewRetryBtnTitle), for: .normal)
        
        if self.status == nil {
            self.status = .loading
        }
    }
    
    @IBAction private func onCLickRetry(_ sender: Any) {
        if case NVOverlayStatus.failed(_ , let onClick) = status! {
            onClick()
        }
    }
}

