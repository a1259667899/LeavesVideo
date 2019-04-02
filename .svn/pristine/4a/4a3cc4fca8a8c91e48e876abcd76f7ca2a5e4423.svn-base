//
//  UIView+DashLine.swift
//  LeavesVideo
//
//  Created by Sinder on 2018/10/22.
//  Copyright © 2018 Sinder. All rights reserved.
//

import Foundation
extension UIView{
    /**
     *  通过 CAShapeLayer 方式绘制虚线
     *
     *  param lineView:       需要绘制成虚线的view
     *  param lineLength:     虚线的宽度
     *  param lineSpacing:    虚线的间距
     *  param lineColor:      虚线的颜色
     *  param lineDirection   虚线的方向  YES 为水平方向， NO 为垂直方向
     **/
    func drawLineOfDash(lineLength: Float , lineSpecing: Float , lingColor: UIColor , isHorizonal: Bool){
        let shapeLayer = CAShapeLayer()
        shapeLayer.bounds = self.bounds
        if isHorizonal {
            shapeLayer.position = CGPoint(x: self.bounds.width / 2, y: self.bounds.height)
        }else{
            shapeLayer.position = CGPoint(x: self.bounds.width / 2, y: self.bounds.height / 2)
        }
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = lingColor.cgColor
        if isHorizonal {
            shapeLayer.lineWidth = self.frame.height
        }else{
            shapeLayer.lineWidth = self.frame.width
        }
        shapeLayer.lineJoin = CAShapeLayerLineJoin.round
        shapeLayer.lineDashPattern = [NSNumber.init(value: lineLength) , NSNumber.init(value: lineSpecing)]
        let path = CGMutablePath()
        path.move(to: CGPoint(x: 0, y: 0))
        if isHorizonal {
            path.addLine(to: CGPoint(x: self.frame.width, y: 0))
        }else{
            path.addLine(to: CGPoint(x: 0, y: self.frame.height))
        }
        shapeLayer.path = path
        //    CGPathRelease(path);
        self.layer.addSublayer(shapeLayer)
    }

}
