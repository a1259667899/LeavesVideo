//
//  UITableView+dequeueCell.swift
//  Investment
//
//  Created by XD on 2018/9/18.
//  Copyright © 2018年 方加会. All rights reserved.
//

import Foundation
import UIKit
extension UITableView {
    /**
     注册cell
     */
    func registerCellWith(cellClazz: UITableViewCell.Type){
        self.register(cellClazz.classForCoder(), forCellReuseIdentifier:  cellClazz.getCellIdentifer())
    }
    /**
     dequeue复用cell
     */
    func dequeueCell(with cellClazz: UITableViewCell.Type)-> UITableViewCell{
        let identifer = String(describing: cellClazz.self)
        var cell = self.dequeueReusableCell(withIdentifier: identifer)
        if cell == nil {
            cell = cellClazz.init(style: .default, reuseIdentifier: identifer)
        }
        return cell!
    }
    
}
extension UIScrollView{
    /**
     scrollView截图
     */
    func getScreenShoot()->UIImage{
        var image = UIImage.init()
        UIGraphicsBeginImageContextWithOptions(self.contentSize, true, UIScreen.main.scale)
        let savedContentOffset = self.contentOffset
        let savedFrame = self.frame
        self.contentOffset = CGPoint.zero
        self.frame = CGRect(x: 0, y: 0, width: self.contentSize.width, height: self.contentSize.height)
        self.layer.render(in: UIGraphicsGetCurrentContext()!)
        image = UIGraphicsGetImageFromCurrentImageContext()!
        self.contentOffset = savedContentOffset
        self.frame = savedFrame
        UIGraphicsEndImageContext();
        return image
    }
}
