//
//  LVHomeClassfyCollectionViewCell.swift
//  LeavesVideo
//
//  Created by Sinder on 2018/10/22.
//  Copyright © 2018 Sinder. All rights reserved.
//

import UIKit

class LVHomeClassfyCollectionViewCell: UICollectionViewCell {
    private lazy var iconImageView:UIImageView = {
        let image = UIImageView.init()
        return image
    }()
    private lazy var tipLable:UILabel = {
        let lable = UILabel.init()
        lable.font = XDFont.pingFangSCRegular.ofSize(size: 14.0)
        lable.textAlignment = .center
        lable.text = "Sinder"
        return lable
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addViews()
        self.backgroundColor = UIColor.white
    }
    private func addViews(){
        self.addSubview(self.iconImageView)
        self.addSubview(self.tipLable)
        self.iconImageView.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize(width: 48 * kWidthMultiper, height: 48 * kWidthMultiper))
            make.top.equalTo(self.snp.top)
            make.centerX.equalTo(self.snp.centerX)
        }
        self.tipLable.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.snp.centerX)
            make.bottom.equalTo(self.snp.bottom)
            make.left.equalTo(self.snp.left)
            make.right.equalTo(self.snp.right)
        }
    }
    func setItem(item:LVCatagrayItem){
//        self.iconImageView.setImageby_kf(imageUrl: item.categoryIcon)
        self.iconImageView.setImageby_kf(imageUrl:item.categoryIcon ,placeHolderName:"home_button_placeHolder")
        self.tipLable.text = item.categoryName
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
