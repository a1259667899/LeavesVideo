//
//  BaseTableViewCell.swift
//  Investment
//
//  Created by Sinder on 2018/10/12.
//  Copyright © 2018 方加会. All rights reserved.
//

import UIKit
import SnapKit
import SwiftHEXColors
import Alamofire
class BaseTableViewCell: UITableViewCell {
    private lazy var bottomLine:UIView = {
        let line = UIView.init()
        line.backgroundColor = UIColor(hexString: "#F3F3F3")
        return line
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addBottomLine()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func addBottomLine(){
        self.addSubview(bottomLine)
        
        bottomLine.snp.makeConstraints { (make) in
            make.height.equalTo(1)
            make.left.equalTo(self.snp.left).offset(15)
            make.right.equalTo(self.snp.right).offset(-15)
            make.bottom.equalTo(self.snp.bottom).offset(0)
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
