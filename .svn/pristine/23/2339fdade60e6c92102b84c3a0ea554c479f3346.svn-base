//
//  UILable+fitSize.swift
//  Investment
//
//  Created by XD on 2018/8/24.
//  Copyright © 2018年 方加会. All rights reserved.
//

import Foundation
extension UILabel{
    /**
     固定宽度，高度自适应
     */
    func fitHeight(){
        var originalRect = self.frame.size
        let height = self.text?.caculateHeight(font: self.font, width: self.bounds.width)
        originalRect.height = height!
        self.frame.size = originalRect
    }
}
