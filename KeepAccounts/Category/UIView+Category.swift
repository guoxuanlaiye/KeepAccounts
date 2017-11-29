//
//  UIView+Category.swift
//  Swift-Network
//
//  Created by cofco on 2017/11/8.
//  Copyright © 2017年 cofco. All rights reserved.
//

import Foundation
import UIKit
extension UIView {
    
    public var x:CGFloat {
        get {
            return self.frame.origin.x
        }
        set {
            var r = self.frame
            r.origin.x = newValue
            self.frame = r
        }
    }
    public var y:CGFloat {
        get {
            return self.frame.origin.y
        }
        set {
            var r = self.frame
            r.origin.y = newValue
            self.frame = r
        }
    }
    // 右边界的x值
    public var rightX:CGFloat {
        get {
            return self.x + self.width
        }
        set {
            var r = self.frame
            r.origin.x = newValue - frame.size.width
            self.frame = r
        }
    }
    // 下边界的y值
    public var bottomY:CGFloat {
        get {
            return self.y + self.height
        }
        set {
            var r = self.frame
            r.origin.y = newValue - frame.size.height
            self.frame = r
        }
    }
    public var centerX:CGFloat {
        get {
            return self.center.x
        }
        set {
            self.center = CGPoint(x: newValue, y: self.center.y)
        }
    }
    public var centerY:CGFloat {
        get {
            return self.center.y
        }
        set {
            self.center = CGPoint(x: self.center.y, y: newValue)
        }
    }
    public var width:CGFloat {
        get {
            return self.frame.size.width
        }
        set {
            var r = self.frame
            r.size.width = newValue
            self.frame = r
        }
    }
    public var height:CGFloat {
        get {
            return self.frame.size.height
        }
        set {
            var r = self.frame
            r.size.height = newValue
            self.frame = r
        }
    }
    public var origin:CGPoint {
        get {
            return self.frame.origin
        }
        set {
            self.x = newValue.x
            self.y = newValue.y
        }
    }
    public var size:CGSize {
        get {
            return self.frame.size
        }
        set {
            self.width = newValue.width
            self.height = newValue.height
        }
    }
    
    // 是否显示在keyWindow上
    public func isShowingOnKeyWindow() -> Bool {
        
        guard let keyWindow = UIApplication.shared.keyWindow else {
            return false
        }
        // 以主窗口的左上角为原点，计算self的矩形框
        let newFrame = keyWindow.convert(self.frame, from: self.superview)
        let windowBounds = keyWindow.bounds
        // 主窗口的bounds和self的矩形框是否有重叠
        let isIntersects = newFrame.intersects(windowBounds)
        
        return isIntersects && (self.isHidden == false) && (self.alpha > 0.01) && (self.window == keyWindow)
    }
}
