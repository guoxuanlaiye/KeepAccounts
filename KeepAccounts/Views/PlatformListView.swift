//
//  PlatformListView.swift
//  KeepAccounts
//
//  Created by cofco on 2017/11/29.
//  Copyright © 2017年 cofco. All rights reserved.
//

import UIKit

class PlatformListView: UIView {
    // 容器ScrollView
    var containerScrollView:UIScrollView!
    // 滚动指示条
    var scrollBar:UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupContainerView()
    }
    private func setupContainerView(){
        backgroundColor = #colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1)
        containerScrollView = UIScrollView.init(frame: CGRect(x: 0.0, y: 50.0, width: self.width, height: self.height-50.0))
        containerScrollView.isPagingEnabled = true
        containerScrollView.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
        containerScrollView.addObserver(self, forKeyPath: "contentOffset", options: .old, context: nil)
        addSubview(containerScrollView)
    }
    public func setupListView(items:Array<[String:Any]>){
        // 滚动指示条
        scrollBar = UIView.init(frame: CGRect.init(x: 0.0, y: 45.0, width: self.width/CGFloat(items.count), height: 5.0))
        scrollBar.backgroundColor = #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 1)
        addSubview(scrollBar)
        
        // 设置scrollView滚动范围
        let listWidth  = self.width
        let listHeight = self.height-50.0
        containerScrollView.contentSize = CGSize(width:listWidth * CGFloat(items.count), height:listHeight)
        
        let buttonWidth = (self.width - CGFloat((items.count + 1) * 5)) / CGFloat(items.count)
        var index = 0
        for itemDict in items {
            
            let title = itemDict["title"] as! String
            let btn_x = CGFloat(buttonWidth * CGFloat(index)+CGFloat((index + 1) * 5))
            
            let btn = UIButton.init(type: .custom)
            btn.frame = CGRect.init(x: btn_x, y: 0, width: buttonWidth, height: 40)
            btn.setTitle(title, for: .normal)
            btn.addTarget(self, action: #selector(btnClick(_:)), for: .touchUpInside)
            btn.tag = index+1
            btn.backgroundColor=#colorLiteral(red: 0.4392156899, green: 0.01176470611, blue: 0.1921568662, alpha: 1)
            addSubview(btn)
            
            let listTabViewView = UITableView.init(frame: CGRect.init(x: listWidth*CGFloat(index), y: 0, width: listWidth, height: listHeight), style: .plain)
            listTabViewView.delegate = self
            listTabViewView.dataSource = self
            containerScrollView.addSubview(listTabViewView)
            
            index += 1
        }
    }
    @objc private func btnClick(_ sender:UIButton){
        print(sender.tag-1)
        containerScrollView.setContentOffset(CGPoint(x: CGFloat(sender.tag-1) * self.width, y: 0), animated: true)
    }
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
        let point = change?[NSKeyValueChangeKey.oldKey] as! CGPoint
        var contentOffset_x = point.x
        if contentOffset_x < 0 {
            contentOffset_x = 0
        }
        let pageIndex = contentOffset_x / self.width
        
        scrollBar.x = pageIndex * scrollBar.width
        print("0000000 >> \(Int(pageIndex))")
    }
    
    deinit {
        containerScrollView.removeObserver(self, forKeyPath: "contentOffset")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension PlatformListView:UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if cell == nil {
            cell = UITableViewCell.init(style: .value1, reuseIdentifier: "cell")
        }
        cell?.textLabel?.text = "---行数---\(indexPath.row)"
        return cell!
    }
    
}
