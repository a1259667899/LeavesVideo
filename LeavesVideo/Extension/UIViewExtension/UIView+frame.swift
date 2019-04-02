//
//  UIView+frame.swift
//  LittleGoldenPig
//
//  Created by 方加会 on 2018/6/9.
//  Copyright © 2018年 方加会. All rights reserved.
//
import UIKit

private weak var lb_currentFirstResponder: UIView?
extension UIView {
    var top:CGFloat {
        get {
            return self.frame.origin.y;
        }
        set {
            var frame = self.frame;
            frame.origin.y = newValue;
            self.frame = frame;
        }
    }
    var left:CGFloat {
        get {
            return self.frame.origin.x;
        }
        set {
            var frame = self.frame;
            frame.origin.x = newValue;
            self.frame = frame;
        }
    }
    var right:CGFloat {
        get {
            return self.frame.origin.x + self.frame.size.width;
        }
        set {
            var frame = self.frame;
            frame.origin.x = newValue - frame.size.width;
            self.frame = frame;
        }
    }
    var bottom:CGFloat {
        get {
            return self.frame.origin.y + self.frame.size.height;
        }
        set {
            var frame = self.frame;
            frame.origin.y = newValue - self.frame.size.height;
            self.frame = frame;
        }
    }
    var width:CGFloat {
        get {
            return self.frame.size.width;
        }
        set {
            var frame = self.frame;
            frame.size.width = newValue;
            self.frame = frame;
        }
    }
    var height:CGFloat {
        get {
            return self.frame.size.height;
        }
        set {
            var frame = self.frame;
            frame.size.height = newValue;
            self.frame = frame;
        }
    }
    var centerX:CGFloat {
        get {
            return self.center.x;
        }
        set {
            self.center.x = newValue;
        }
    }
    var centerY:CGFloat {
        get {
            return self.center.y;
        }
        set {
            self.center.y = newValue;
        }
    }
    var size:CGSize {
        get {
            return self.bounds.size;
        }
        set {
            var frame = self.frame;
            frame.size = newValue;
            self.frame = frame;
        }
    }
    var origin:CGPoint {
        get {
            return self.frame.origin;
        }
        set {
            var frame = self.frame;
            frame.origin = newValue;
            self.frame = frame;
        }
    }
    func removeAllSubviews () {
        for view in self.subviews {
            //            if view is UIView {
            view.removeFromSuperview();
            //            }
        }
    }
    func removeAllSubLayers () {
        guard self.layer.sublayers != nil else {
            return;
        }
        for layer in self.layer.sublayers! {
            layer.removeFromSuperlayer();
        }
    }
    func addBorders(top:Bool, right:Bool, bottom:Bool, left:Bool, color:UIColor, width:CGFloat) {
        for view in self.subviews {
            if view.tag == -111 {
                view.removeFromSuperview();
            }
        }
        if top {
            let line = UIView.init(frame:CGRect(x: 0, y: 0, width: self.width, height: width));
            line.backgroundColor = color;
            line.tag = -111;
            self.addSubview(line);
        }
        if right {
            let line = UIView.init(frame:CGRect(x: self.width - width, y: 0, width: width, height: self.height));
            line.backgroundColor = color;
            line.tag = -111;
            self.addSubview(line);
        }
        if bottom {
            let line = UIView.init(frame:CGRect(x: 0, y: self.height - width, width: self.width, height: width));
            line.backgroundColor = color;
            line.tag = -111;
            self.addSubview(line);
        }
        if left {
            let line = UIView.init(frame:CGRect(x: 0, y: 0, width: width, height: self.height));
            line.backgroundColor = color;
            line.tag = -111;
            self.addSubview(line);
        }
    }
    func getFirstResponder () -> UIView? {
        UIApplication.shared.sendAction(#selector(didFindFirstResponder), to: nil, from: nil, for: nil);
        return lb_currentFirstResponder;
    }
    @objc private func didFindFirstResponder () {
        lb_currentFirstResponder = self;
    }
}
