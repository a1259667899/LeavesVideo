//
//  UITableViewCell+Protocol.swift
//  Investment
//
//  Created by XD on 2018/9/4.
//  Copyright © 2018年 方加会. All rights reserved.
//

import Foundation
import UIKit
protocol UITableViewCellIdentifer {
     func identifer()->(String)
}
protocol TableViewCellSeparaLineProtocal {
    func addFullSepareLine()
}
protocol UITableViewBindingCell {
    func bindingCell(withCellClass:UITableViewCell)
}
extension UITableViewCellIdentifer where Self:UITableViewCell{
    func identifer()->(String){
        return String(describing: type(of:self))
    }
}
extension UITableViewBindingCell where Self:UITableView{
    func bindingCellWith(cellClass:UITableViewCell){
        
    }
}
extension TableViewCellSeparaLineProtocal where Self:UITableViewCell{
    func addFullSepareLine(){
        let line = UIView.init()
        self.addSubview(line)
        line.snp.makeConstraints { (make) in
            make.height.equalTo(1)
            make.left.equalTo(self.snp.left).offset(0)
            make.right.equalTo(self.snp.right).offset(0)
            make.bottom.equalTo(self.snp.bottom)
        }
        line.backgroundColor = UIColor(hexString: "#F2F2F2")
    }
}
