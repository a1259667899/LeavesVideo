//
//  LVMineNormalTableViewCell.swift
//  LeavesVideo
//
//  Created by Sinder on 2018/10/18.
//  Copyright © 2018 Sinder. All rights reserved.
//

import UIKit

class LVMineNormalTableViewCell: UITableViewCell,TableViewCellSeparaLineProtocal {
    private lazy var icon:UIImageView = {
        let imageView = UIImageView.init()
        return imageView
    }()
    private lazy var titleLable:UILabel = {
        let label = UILabel.init()
        label.font = XDFont.pingFangSCRegular.ofSize(size: 14.0)
        label.textColor = UIColor(hexString: "#181818")
        label.sizeToFit()
        return label
    }()
    private lazy var subTitleLable:UILabel = {
        let label = UILabel.init()
        label.font = XDFont.pingFangSCRegular.ofSize(size: 12.0)
        label.textColor = UIColor(hexString: "#8B8B8B")
        label.sizeToFit()
        return label
    }()
    private lazy var arrownIcon:UIImageView = {
        let imageView = UIImageView.init()
       imageView.image = UIImage(named: "mine_cellRightArrow")
        return imageView
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubViews()
        addSepareterLine()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func addSubViews(){
        self.addSubview(self.icon)
        self.addSubview(self.arrownIcon)
        self.addSubview(self.titleLable)
        self.addSubview(self.subTitleLable)
        self.icon.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize(width: 21, height: 21))
            make.centerY.equalTo(self.snp.centerY)
            make.left.equalTo(self.snp.left).offset(15)
        }
        self.titleLable.snp.makeConstraints { (make) in
            make.left.equalTo(self.snp.left).offset(51)
            make.top.equalTo(self.snp.top).offset(15)
            make.bottom.equalTo(self.snp.bottom).offset(-15)
        }
        self.arrownIcon.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize(width: 6, height: 10))
            make.centerY.equalTo(self.snp.centerY)
            make.right.equalTo(self.snp.right).offset(-15)
        }
        self.subTitleLable.snp.makeConstraints { (make) in
            make.right.equalTo(self.snp.right).offset(-44)
            make.centerY.equalTo(self.snp.centerY)
        }
    }
    func set(title:String , icon:String , subTitle:String){
        self.icon.image = UIImage(named: icon)
        self.titleLable.text = title
        self.subTitleLable.text = subTitle
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
