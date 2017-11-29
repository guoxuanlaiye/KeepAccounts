//
//  DiscoveryViewController.swift
//  KeepAccounts
//
//  Created by cofco on 2017/11/27.
//  Copyright © 2017年 cofco. All rights reserved.
//

import UIKit

class DiscoveryViewController: UIViewController {

    fileprivate let cellIdentifier = "cell"
    // 平台类型选项视图
    var platformItemView:PlatformItemView!
    // 平台列表
    var listTableView:UITableView!
    // 底部scrollview
    var discoveryScrollView:UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)

        setupDiscoveryView()
    }
    
    private func setupDiscoveryView(){
        
        let width = UIScreen.main.bounds.width
        let height = UIScreen.main.bounds.height-49.0
        
        discoveryScrollView = UIScrollView(frame: CGRect(x: 0.0, y: 0.0, width: width, height: height))
        discoveryScrollView.contentSize = CGSize(width: width, height: height+160.0)
        discoveryScrollView.delegate = self
        
        // 平台列表视图
        listTableView = UITableView(frame: CGRect.init(x: 0, y: 210.0, width:width, height: height-45), style: .plain)
        listTableView.delegate = self
        listTableView.dataSource = self
        listTableView.register(UINib.init(nibName: "PlatformListCell", bundle: nil), forCellReuseIdentifier: cellIdentifier)
        discoveryScrollView.addSubview(listTableView)
        
        // 头部视图
        let headerView = DiscoveryHeaderView.createDiscoveryHeaderView()
        headerView.frame = CGRect(x: 0.0, y: 0.0, width: width, height: 160.0)
        discoveryScrollView.addSubview(headerView)
        
        // 选项按钮视图
        platformItemView = PlatformItemView.init(frame: CGRect(x: 0, y: 165.0, width: width, height: 40.0))
        platformItemView.setupItems(items: [["title":"组团专区","img":""],["title":"全部","img":""],["title":"新手入门","img":""],["title":"复投专区","img":""],["title":"我的","img":""]])
        discoveryScrollView.addSubview(platformItemView!)

        view.addSubview(discoveryScrollView)
    }
}

extension DiscoveryViewController:UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let offset_y = scrollView.contentOffset.y
        if scrollView.isEqual(discoveryScrollView)  {
//            print("----\(offset_y,type(of: scrollView))")
            if offset_y > 100.0 {
                platformItemView.y = 165.0+(offset_y-100.0)
            } else {
                platformItemView.y = 165.0
            }
        } else {
//            print("----\(offset_y,type(of: scrollView))")
//
//            if offset_y > 100.0 {
//
//            } else {
//
//            }
        }
    }
}

extension DiscoveryViewController:UITableViewDelegate,UITableViewDataSource {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
        if cell == nil {
            cell = Bundle.main.loadNibNamed("PlatformListCell", owner: nil, options: [:])?.first as! PlatformListCell
        }
        cell?.textLabel?.text = "行号 === \(indexPath.row)"
        return cell!
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55.0
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
}

