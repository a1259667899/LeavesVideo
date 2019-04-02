//
//  UIView+ScreenShots.swift
//  Investment
//
//  Created by Sinder on 2018/10/9.
//  Copyright © 2018 方加会. All rights reserved.
//

import Foundation
extension UIView{
    /**
     view生成图片
     */
    func snapshotSingleView()->UIImage{
        // 下面方法，第一个参数表示区域大小。第二个参数表示是否是非透明的。如果需要显示半透明效果，需要传true，否则传false。第三个参数就是屏幕密度了，关键就是第三个参数 [UIScreen mainScreen].scale。
        UIGraphicsBeginImageContextWithOptions(CGSize.init(width: self.bounds.width, height: self.bounds.height), true, UIScreen.main.scale)
        let currentContext = UIGraphicsGetCurrentContext()
        currentContext?.translateBy(x: -self.bounds.minX, y: -self.bounds.minY)
        self.layer.render(in: currentContext!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext();
        return image!
    }
}

