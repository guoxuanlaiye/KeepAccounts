//
//  MainTabBarController.swift
//  KeepAccounts
//
//  Created by cofco on 2017/11/27.
//  Copyright © 2017年 cofco. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let homeVC = HomeViewController()
        addSubVC(vc: homeVC, title: "首页", tabbarImg: "tabbar_home_s", tabbarSelectedImg: "tabbar_home_s")
        let statisVC = StatisticsViewController()
        addSubVC(vc: statisVC, title: "统计", tabbarImg: "tabbar_home_s", tabbarSelectedImg: "tabbar_home_s")
        let discoveryVC = DiscoveryViewController()
        addSubVC(vc: discoveryVC, title: "发现", tabbarImg: "tabbar_home_s", tabbarSelectedImg: "tabbar_home_s")
        let communityVC = CommunityViewController()
        addSubVC(vc: communityVC, title: "社区", tabbarImg: "tabbar_home_s", tabbarSelectedImg: "tabbar_home_s")
    }
//    private func addSubVC(vc:UIViewController, title:String, iconUniCode:String) {
    private func addSubVC(vc:UIViewController, title:String, tabbarImg:String, tabbarSelectedImg:String) {
        vc.tabBarItem.title = title
        vc.tabBarItem.image = UIImage.init(named: tabbarImg)
        vc.tabBarItem.selectedImage = UIImage.init(named: tabbarSelectedImg)?.withRenderingMode(.alwaysOriginal)
        let nav = MainNavController.init(rootViewController: vc)
        addChildViewController(nav)
    }
}
