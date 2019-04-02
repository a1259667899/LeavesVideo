//
//  LVNormalTextTableViewCell.swift
//  LeavesVideo
//
//  Created by Sinder on 2018/10/24.
//  Copyright © 2018 Sinder. All rights reserved.
//

import UIKit

class LVNormalTextTableViewCell: UITableViewCell {

    //
    private lazy var titleLabel:UILabel = {
        let lab = UILabel.init()
        lab.sizeToFit()
        lab.font = XDFont.pingFangSCRegular.ofSize(size: 14.0)
        lab.textColor = textBlackColor
        lab.sizeToFit()
        lab.text = "为你推荐"
        return lab
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addViews()
        self.selectionStyle = .none
    }
    private func addViews(){
        self.backgroundColor = UIColor.white
        self.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.snp.left).offset(15)
            make.top.equalTo(self.snp.top).offset(12)
            make.height.equalTo(14)
            make.bottom.equalTo(self.snp.bottom).offset(-12)
        }
//        if isShowArrow {
//            let arrow = UIImageView.init()
//            self.addSubview(arrow)
//            arrow.image = UIImage(named: "mine_cellRightArrow")
//            arrow.snp.makeConstraints { (make) in
//                make.centerY.equalTo(self.snp.centerY)
//                make.right.equalTo(self.snp.right).offset(-15)
//                make.size.equalTo(CGSize(width: 12, height: 20))
//            }
//        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
