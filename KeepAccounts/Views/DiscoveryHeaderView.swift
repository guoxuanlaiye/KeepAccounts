//
//  DiscoveryHeaderView.swift
//  KeepAccounts
//
//  Created by cofco on 2017/11/27.
//  Copyright © 2017年 cofco. All rights reserved.
//

import UIKit

class DiscoveryHeaderView: UIView {

    public class func createDiscoveryHeaderView()->DiscoveryHeaderView{
        let discoveryView = Bundle.main.loadNibNamed("DiscoveryHeaderView", owner: nil, options: [:])?.first as? DiscoveryHeaderView
        return discoveryView!
    }
}
