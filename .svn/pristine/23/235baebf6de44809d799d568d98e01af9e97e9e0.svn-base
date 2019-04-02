//
//  LVMineLogOutTableViewCell.swift
//  LeavesVideo
//
//  Created by Sinder on 2018/10/19.
//  Copyright © 2018 Sinder. All rights reserved.
//

import UIKit

class LVMineLogOutTableViewCell: UITableViewCell,TableViewCellSeparaLineProtocal {
    //
    private lazy var centerLabel:UILabel = {
        let label = UILabel.init()
        label.font = XDFont.pingFangSCRegular.ofSize(size: 14.0)
        label.textColor = UIColor(hexString: "#B9B9B9")
        label.text = "退出"
        label.sizeToFit()
        return label
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addViews()
        self.addSepareterLine()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func addViews(){
        self.addSubview(self.centerLabel)
        self.centerLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.snp.top).offset(15)
            make.centerX.equalTo(self.snp.centerX)
            make.bottom.equalTo(self.snp.bottom).offset(-15)
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
