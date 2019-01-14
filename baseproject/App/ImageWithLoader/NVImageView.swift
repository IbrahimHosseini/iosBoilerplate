//
//  NVImageView.swift
//  baseproject
//
//  Created by Pazandish on 1/14/19.
//  Copyright © 2019 sehosseini. All rights reserved.
//

import UIKit
import Kingfisher
import UIColor_Hex_Swift
import SkeletonView

class NVImageView: UIImageView {
    
    @IBOutlet var indicator: UIActivityIndicatorView!
    
    override init(image: UIImage?) {
        super.init(image: image)
        initView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initView()
    }
    
    
    override func awakeFromNib() {
        initView()
    }
    
    private func initView() {
        
        self.indicator = UIActivityIndicatorView()
        self.indicator.center = self.center
        self.indicator.isHidden = true
        self.indicator.color = Colors.gray
        self.isOpaque = true
        self.clipsToBounds = true
        self.addSubview(self.indicator)
        
        //        self.isSkeletonable = true
        //        self.showAnimatedSkeleton()
        //        let gradient = SkeletonGradient(baseColor: Colors.lightGray)
        //        self.showAnimatedGradientSkeleton(usingGradient: gradient)
        
        KingfisherManager.shared.defaultOptions
            .append( KingfisherOptionsInfoItem.requestModifier(
                AnyModifier(modify: { (request) -> URLRequest? in
                    var req = request
                    req.addValue(App.shared.userToken ?? "", forHTTPHeaderField: "shop-token")
                    req.addValue("shoptoken=\(App.shared.userToken ?? "")",
                        forHTTPHeaderField: "Cookie")
                    return req
                })))
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        self.indicator.center = self.center
    }
    
    public func setImage(url:String,onComplete:((Image?, NSError?, CacheType,URL?) -> Void)? = nil){
        
        if let urlObj = URL(string:url) {
            self.indicator.isHidden = false
            self.indicator.startAnimating()
            KingfisherManager.shared.defaultOptions
                .append( KingfisherOptionsInfoItem.requestModifier(
                    AnyModifier(modify: { (request) -> URLRequest? in
                        var req = request
                        req.addValue(App.shared.userToken ?? "", forHTTPHeaderField: "shop-token")
                        req.addValue("shoptoken=\(App.shared.userToken ?? "")",
                            forHTTPHeaderField: "Cookie")
                        return req
                    })))
            
            self.kf.setImage(with: urlObj,
                             placeholder: nil,
                             options: nil,
                             progressBlock: nil) { (img:Image?, error:NSError?, cacheType:CacheType, url:URL?) in
                                self.indicator.isHidden = true
                                self.indicator.stopAnimating()
                                //                                self.stopSkeletonAnimation()
                                onComplete?(img,error,cacheType,url)
                                //TODO retry btn
            }
            
        } else {
            print("url is not valid \(url)")
        }
    }
    
    deinit {
        
        self.indicator.isHidden = true
        self.kf.cancelDownloadTask()
        
    }
    
}
