//
//  ExtendButton.swift
//  Investment
//
//  Created by XD on 2018/9/4.
//  Copyright © 2018年 方加会. All rights reserved.
//

import Foundation

class ExtendButton: UIButton {
    
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        let margin: CGFloat = 10
        let area = self.bounds.insetBy(dx: -margin, dy: -margin) //负值是方法响应范围
        return area.contains(point)
    }
}

