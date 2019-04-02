//
//  LVVideoListTableViewCell.swift
//  LeavesVideo
//
//  Created by Sinder on 2018/10/22.
//  Copyright © 2018 Sinder. All rights reserved.
//

import UIKit

class LVVideoListTableViewCell: UITableViewCell {
    private lazy var coverImageView:UIImageView = {
        let imageView = UIImageView.init()
        imageView.backgroundColor = textLightGrayColor
        return imageView
    }()
    private lazy var infoView:LVVideoIGenfoView = {
        let view = LVVideoIGenfoView.init(frame: CGRect(x: 0, y: 0, width: 140, height: 22))
        return view
    }()
    private lazy var descriptLable:UILabel = {
        let lable = UILabel.init()
        lable.font = XDFont.pingFangSCRegular.ofSize(size: 14.0)
        lable.textColor = textBlackColor
        lable.numberOfLines = 0
        lable.sizeToFit()
        lable.text = "我说绿巨人是最牛逼的，我说绿巨人是最牛逼的，你相信吗？我说绿巨人是最牛逼的"
        return lable
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        addViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func addViews(){
        self.addSubview(self.coverImageView)
        self.addSubview(self.infoView)
        self.coverImageView.addSubview(self.descriptLable)
        self.coverImageView.snp.makeConstraints { (make) in
            make.height.equalTo(210 * kWidthMultiper)
            make.left.equalTo(self.snp.left)
            make.right.equalTo(self.snp.right)
            make.top.equalTo(self.snp.top)
        }
        self.infoView.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize(width: 140, height: 22))
            make.right.equalTo(self.coverImageView.snp.right).offset(0)
            make.bottom.equalTo(self.coverImageView.snp.bottom).offset(-15 * kWidthMultiper)
        }
        self.descriptLable.snp.makeConstraints { (make) in
            make.left.equalTo(self.snp.left).offset(15)
            make.right.equalTo(self.snp.right).offset(-15)
            make.top.equalTo(self.coverImageView.snp.bottom).offset(10)
            make.bottom.equalTo(self.snp.bottom).offset(-10)
        }
    }
    func setVideo(video:LVVideoListModel){
        self.coverImageView.setImageby_kf(imageUrl: video.videoIcon)
        self.infoView.setVideo(video: video)
        self.descriptLable.text = video.videoTitle
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
