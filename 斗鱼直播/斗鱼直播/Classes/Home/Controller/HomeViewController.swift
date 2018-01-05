//
//  HomeViewController.swift
//  斗鱼直播
//
//  Created by apple on 2018/1/2.
//  Copyright © 2018年 apple. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    // MARK:- 懒加载属性
    private lazy var pageTitleView : PageTitleView = {[weak self] in
        let titleFrame = CGRect(x: 0, y: kStatusBarH + kNavigationBarH, width: kScreenW, height: kTitleViewH)
        let titles = ["推荐", "游戏", "娱乐", "趣玩"]
        let titleView = PageTitleView(frame: titleFrame, titles: titles)
        titleView.delegate = self
        return titleView
        }()
    
    fileprivate lazy var pageContentView : PageContentView = {[weak self] in
        
        // 1.确定内容的frame
        let contentH = kScreenH - kStatusBarH - kNavigationBarH - kTitleViewH
        let contentFrame = CGRect(x: 0, y: kStatusBarH + kNavigationBarH + kTitleViewH, width: kScreenW, height: contentH)
        
        // 2.确定所有的子控制器
        var childVcs = [UIViewController]()
        for _ in 0..<4{
            let vc = UIViewController()
            vc.view.backgroundColor = UIColor(r: CGFloat(arc4random_uniform(255)),g: CGFloat(arc4random_uniform(255)), b: CGFloat(arc4random_uniform(255)))
            childVcs.append(vc)
        }
        
        let contentView = PageContentView(frame: contentFrame, childVcs: childVcs, parentViewController: self!)
        contentView.delegate = self
        return contentView
        }()
    

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
        // 2.添加TitleView
        view.addSubview(pageTitleView)
        //3.添加ContentView
        view.addSubview(pageContentView)
        pageContentView.backgroundColor = UIColor.purple
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

// MARK:- 遵守PageTitleViewDelegate协议
extension HomeViewController : PageTitleViewDelegate {
    func pageTitleView(_ titleView: PageTitleView, selectedIndex index: Int) {
     pageContentView.setCurrentIndex(index)
    }
}
// MARK:- 遵守PageContentViewDelegate协议
extension HomeViewController : PageContentViewDelegate {
    func pageContentView(_ contentView: PageContentView, progress: CGFloat, sourceIndex: Int, targetIndex: Int) {
        pageTitleView.setTitleWithProgress(progress, sourceIndex: sourceIndex, targetIndex: targetIndex)
    }
}










