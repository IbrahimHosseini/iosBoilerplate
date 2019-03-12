//
//  MainTabbarVC.swift
//  baseproject
//
//  Created by Pazandish on 3/12/19.
//  Copyright © 2019 sehosseini. All rights reserved.
//

import Foundation
import RAMAnimatedTabBarController
import Localize_Swift
//import Jelly

class MainTabbarVC: RAMAnimatedTabBarController {
//    var jellyAnimator: JellyAnimator?
    
    override func viewDidLoad() {
        App.shared.mainTabbarController =  self
        
        self.tabBar.items!.forEach({ (item: UITabBarItem) in
            let i = item as! RAMAnimatedTabBarItem
            i.animation = RAMBounceAnimation()
            i.animation.duration = 0.8
            i.animation.iconSelectedColor = Colors.blue
            i.animation.textSelectedColor = Colors.blue
        })
        
        self.tabBar.tintColor = Colors.gray.withAlphaComponent(0.8)
        
        //item1
        let i1 = self.tabBar.items![0] as!  RAMAnimatedTabBarItem
        i1.image = UIImage(named: "tabbar-icn-item1")!.resizeImage(to: CGSize(width: 25, height: 25))
        i1.title = NVLocalized(item1)
        
        //item2
        let i2 = self.tabBar.items![1] as!  RAMAnimatedTabBarItem
        i2.image = UIImage(named: "tabbar-icn-item2")!.resizeImage(to: CGSize(width: 25, height: 25))
        i2.title = NVLocalized(item2)

        //item3
        let i3 = self.tabBar.items![2] as!  RAMAnimatedTabBarItem
        i3.image = UIImage(named: "tabbar-icn-item3")!.resizeImage(to: CGSize(width: 25, height: 25))
        i3.title = NVLocalized(item3)

        //item4
        let i4 = self.tabBar.items![3] as!  RAMAnimatedTabBarItem
        i4.image = UIImage(named: "tabbar-icn-item4")!.resizeImage(to: CGSize(width: 25, height: 25))
        i4.title = NVLocalized(item4)

        //item3
        let i5 = self.tabBar.items![4] as!  RAMAnimatedTabBarItem
        i5.image = UIImage(named: "tabbar-icn-item5")!.resizeImage(to: CGSize(width: 25, height: 25))
        i5.title = NVLocalized(item5)

        
        ([i1,
          i2,
          i3,
          i4,
          i5] as [RAMAnimatedTabBarItem]).forEach { (item) in

            item.iconColor = Colors.gray
            item.textColor = Colors.gray
            item.textFontSize = 11

        }
        
        super.viewDidLoad()
        self.tabBar.tintColor = Colors.gray
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}

