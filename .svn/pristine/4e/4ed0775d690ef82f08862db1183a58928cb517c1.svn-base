//
//  UIView+Corner.swift
//  RxXMLY
//
//  Created by sessionCh on 2017/12/15.
//  Copyright © 2017年 sessionCh. All rights reserved.
//

import UIKit

extension UIView {
    
    // MARK:- 裁剪圆角
    func clipCorner(direction: UIRectCorner, radius: CGFloat) {
        let cornerSize = CGSize(width: radius, height: radius)
        let maskPath = UIBezierPath(roundedRect: bounds, byRoundingCorners: direction, cornerRadii: cornerSize)
        let maskLayer = CAShapeLayer()
        maskLayer.frame = bounds
        maskLayer.path = maskPath.cgPath
        layer.addSublayer(maskLayer)
        layer.mask = maskLayer
    }
    //MARK:-设置渐变背景色
    func setBackGradualChangingColor(bounds:CGRect , fromColor:String , toColor:String){
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [UIColor(hexString: fromColor)?.cgColor as Any , UIColor(hexString: toColor)?.cgColor as Any]
        //设置渐变方向,左上点为(0,0), 右下点为(1,1)
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        //  设置颜色变化点，取值范围 0.0~1.0
        gradientLayer.locations = [0 , 1]
        self.layer.addSublayer(gradientLayer)
    }
}
