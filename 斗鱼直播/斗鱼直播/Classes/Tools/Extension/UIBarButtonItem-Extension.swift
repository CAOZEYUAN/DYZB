//
//  UIBarButtonItem-Extension.swift
//  斗鱼直播
//
//  Created by apple on 2018/1/2.
//  Copyright © 2018年 apple. All rights reserved.
//

import UIKit
extension UIBarButtonItem {
    
     class func createItem(imageName : String, highImageName : String, size : CGSize) -> UIBarButtonItem {
     let btn = UIButton()
     
     btn.setImage(UIImage(named: imageName), for: .normal)
        btn.setImage(UIImage(named: highImageName), for: .highlighted)
     
     btn.frame = CGRect(origin: CGPoint(x:0, y:0), size: size)
     
     return UIBarButtonItem(customView: btn)
     }
    
}
