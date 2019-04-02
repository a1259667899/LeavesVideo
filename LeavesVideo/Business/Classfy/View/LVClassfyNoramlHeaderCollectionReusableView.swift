//
//  LVClassfyNoramlHeaderCollectionReusableView.swift
//  LeavesVideo
//
//  Created by Sinder on 2018/10/23.
//  Copyright © 2018 Sinder. All rights reserved.
//

import UIKit

class LVClassfyNoramlHeaderCollectionReusableView: UICollectionReusableView {
    private lazy var titleLabel:UILabel = {
        let lable = UILabel.init()
        lable.sizeToFit()
        lable.font = XDFont.pingFangSCRegular.ofSize(size: 18.0)
        lable.textColor = textBlackColor
        return lable
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func addViews(){
        self.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.snp.left).offset(15)
            make.centerY.equalTo(self.snp.centerY)
        }
        
    }
    func setTitle(title:String){
        self.titleLabel.text = title
    }
}
