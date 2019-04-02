//
//  UIView+Shadow.swift
//  Investment
//
//  Created by XD on 2018/9/28.
//  Copyright © 2018 方加会. All rights reserved.
//

import Foundation

extension UIView{
    /**
     添加默认阴影
     */
    func showShadow(){
        self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.shadowOffset = CGSize.init(width: 1, height: 1)
        self.layer.shadowOpacity=0.5;
    }
    /**
     添加自定义阴影
     */
    func showCustomShadow(shadowColor: UIColor , shadowOffset :CGSize , shadowOpacity:Float){
        self.layer.shadowColor = shadowColor.cgColor
        self.layer.shadowOffset = shadowOffset
        self.layer.shadowOpacity = shadowOpacity
    }
}
