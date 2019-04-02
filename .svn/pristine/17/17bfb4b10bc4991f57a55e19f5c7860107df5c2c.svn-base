//
//  LVClassfyCollectionViewCell.swift
//  LeavesVideo
//
//  Created by Sinder on 2018/10/23.
//  Copyright © 2018 Sinder. All rights reserved.
//

import UIKit

class LVClassfyCollectionViewCell: UICollectionViewCell {
    private var item:LVCatagrayItem?
    private lazy var titleLable:UILabel = {
        let lable = UILabel.init()
        lable.font = XDFont.pingFangSCRegular.ofSize(size: 14.0)
        lable.textColor = textBlackColor
        lable.textAlignment = .center
        return lable
    }()
    private lazy var backGroudImageView:UIImageView = {
        let layer = UIImageView()
        layer.image = UIImage(named: "RectCircle_buttonBg")
        return layer
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func addViews(){
        self.layer.borderColor = UIColor(hexString: "#181818")?.cgColor
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 8
        self.clipCorner(direction: .allCorners, radius: 8)
        self.addSubview(self.backGroudImageView)
        self.backGroudImageView.isHidden = true
        self.backGroudImageView.snp.makeConstraints { (make) in
            make.edges.equalTo(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        }
        
        self.addSubview(self.titleLable)
        self.titleLable.snp.makeConstraints { (make) in
            make.edges.equalTo(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        }
    }
    func setItem(item:LVCatagrayItem){
        self.titleLable.text = item.categoryName
        self.item = item
    }
    func setSelected(selected:Bool){
        self.isSelected = selected
        if selected {
            self.layer.borderWidth = 0
            self.titleLable.textColor = UIColor.white
            self.backGroudImageView.isHidden = false
        }else{
            self.layer.borderWidth = 1
            self.titleLable.textColor = textBlackColor
            self.backGroudImageView.isHidden = true
        }
    }
}
