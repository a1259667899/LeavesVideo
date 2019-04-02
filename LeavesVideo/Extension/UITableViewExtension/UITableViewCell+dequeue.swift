//
//  UITableViewCell+dequeue.swift
//  Investment
//
//  Created by XD on 2018/9/17.
//  Copyright © 2018年 方加会. All rights reserved.
//

import Foundation
import UIKit

extension UITableViewCell{
    class func cellWithTableView(tableView:UITableView)->(UITableViewCell){
        let identifer = String(describing: type(of:self.init()))
        var cell = tableView.dequeueReusableCell(withIdentifier: identifer)
        if cell == nil {
            cell = self.init(style: .default, reuseIdentifier: identifer)
        }
        return cell!
    }
   class func getCellIdentifer()->(String){
        return String(describing: self)
    }
    /**
     添加底部横线
     */
    func addSepareterLine(){
        let bottomLine = UIView.init()
        bottomLine.backgroundColor = UIColor(hexString: "#EBEBEB")
        self.addSubview(bottomLine)
        
        bottomLine.snp.makeConstraints { (make) in
            make.height.equalTo(1)
            make.left.equalTo(self.snp.left).offset(12)
            make.right.equalTo(self.snp.right).offset(-12)
            make.bottom.equalTo(self.snp.bottom).offset(0)
        }
    }
}
