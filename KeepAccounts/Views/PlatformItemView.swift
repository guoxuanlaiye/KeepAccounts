//
//  PlatformItemView.swift
//  KeepAccounts
//
//  Created by cofco on 2017/11/27.
//  Copyright © 2017年 cofco. All rights reserved.
//

import UIKit

class PlatformItemView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
    }
    
    public func setupItems(items:Array<[String:Any]>){
        
        for itemDict in items {
            let title = itemDict["title"] as! String
            let btn = UIButton.init(type: .custom)
            btn.setTitle(title, for: .normal)
            btn.backgroundColor=#colorLiteral(red: 0.4392156899, green: 0.01176470611, blue: 0.1921568662, alpha: 1)
            addSubview(btn)
        }
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        if self.subviews.count == 0 {
            return
        }
        var i = 0
        let itemWidth = (self.width - CGFloat((self.subviews.count + 1) * 5)) / CGFloat(self.subviews.count)
        
        for item in self.subviews {
            
            let vi = item as! UIButton
            vi.x = CGFloat(itemWidth * CGFloat(i)+CGFloat((i + 1) * 5))
            vi.y = 0.0
            vi.width = itemWidth
            vi.height = self.height
            i += 1
        }
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
