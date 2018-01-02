//
//  HomeViewController.swift
//  斗鱼直播
//
//  Created by apple on 2018/1/2.
//  Copyright © 2018年 apple. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // 设置UI界面
        setupUI()
    }
}

extension HomeViewController{
    private func setupUI() {
      
        // 1.设置导航栏
        setupNavigationBar()
    }
    
   private func setupNavigationBar() {
        // 1.设置左侧的Item
    let btn = UIButton()
    btn.setImage(UIImage(named:"logo"), for: .normal)
    btn.sizeToFit()
    navigationItem.leftBarButtonItem = UIBarButtonItem(customView:btn)
    
    // 2.设置右侧的Item
    let size = CGSize(width: 40, height: 40)
    let historyItem = UIBarButtonItem.createItem(imageName: "image_my_history", highImageName: "Image_my_history_click", size: size)
    let searchItem = UIBarButtonItem.createItem(imageName: "btn_search", highImageName: "btn_search_clicked", size: size)
    let qrcodeItem = UIBarButtonItem.createItem(imageName: "Image_scan", highImageName: "Image_scan_click", size: size)
    navigationItem.rightBarButtonItems = [historyItem, searchItem, qrcodeItem]
  }
}
