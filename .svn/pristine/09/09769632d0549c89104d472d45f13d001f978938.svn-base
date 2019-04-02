//
//  LVRecommandVideoTableViewCell.swift
//  LeavesVideo
//
//  Created by Sinder on 2018/10/24.
//  Copyright © 2018 Sinder. All rights reserved.
//

import UIKit

class LVRecommandVideoTableViewCell: UITableViewCell {
    private lazy var coverImageView:UIImageView = {
        let imageView = UIImageView.init()
        imageView.backgroundColor = textLightGrayColor
        return imageView
    }()
    private lazy var titleLabel:UILabel = {
        let lab = UILabel.init()
        lab.font = XDFont.pingFangSCRegular.ofSize(size: 14.0)
        lab.textColor = textBlackColor
        lab.sizeToFit()
        lab.numberOfLines = 0
        lab.text = "12奥斯卡大家卡萨丁快乐撒哦IPOIOP啥快递即可拉伸"
        return lab
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func addViews(){
        self.addSubview(self.coverImageView)
        self.addSubview(self.titleLabel)
        self.coverImageView.snp.makeConstraints { (make) in
            make.left.equalTo(self.snp.left).offset(15)
            make.top.equalTo(self.snp.top).offset(7)
            make.height.equalTo(90 * kWidthMultiper).priority(.high)
            make.width.equalTo(160 * kWidthMultiper)
            make.bottom.equalTo(self.snp.bottom).offset(-7)
        }
        self.titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.coverImageView.snp.right).offset(15)
            make.right.equalTo(self.snp.right).offset(-15)
            make.centerY.equalTo(self.snp.centerY)
        }
    }
    func setVideoItem(item:LVVideoListModel){
        self.titleLabel.text = item.videoTitle
        self.coverImageView.setImageby_kf(imageUrl: item.videoIcon)
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
