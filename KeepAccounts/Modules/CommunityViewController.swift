//
//  CommunityViewController.swift
//  KeepAccounts
//
//  Created by cofco on 2017/11/27.
//  Copyright © 2017年 cofco. All rights reserved.
//

import UIKit

class CommunityViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
        setupView()
    }
    private func setupView(){
        let listV = PlatformListView.init(frame: CGRect(x: 0.0, y: 64.0, width: view.width, height: view.height-64.0-49.0))
        listV.setupListView(items: [["title":"热门"],["title":"最新"],["title":"推荐"],["title":"我的"]])
        view.addSubview(listV)
    }
}
