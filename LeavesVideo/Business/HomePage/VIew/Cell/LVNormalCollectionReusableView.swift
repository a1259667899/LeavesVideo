//
//  LVNormalCollectionReusableView.swift
//  LeavesVideo
//
//  Created by Sinder on 2018/11/12.
//  Copyright © 2018 Sinder. All rights reserved.
//

import UIKit

class LVNormalCollectionReusableView: UICollectionReusableView {
    
    var subButtonHandler: noneAttributeClosure?
    
    private lazy var titleLabel:UILabel = {
        let lable = UILabel.init()
        lable.sizeToFit()
        lable.font = XDFont.pingFangSCMedium.ofSize(size: 16.0)
        lable.textColor = textBlackColor
        return lable
    }()
    
    private lazy var subTitleButton: ExtendButton = {
        let button = ExtendButton.init()
        button.addTarget(self, action: #selector(subButtonClicked), for: .touchUpInside)
        return button
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
        self.addSubview(subTitleButton)
        titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.snp.left).offset(15)
            make.centerY.equalTo(self.snp.centerY)
        }
        
        subTitleButton.snp.makeConstraints { (make) in
            make.right.equalTo(self.snp.right).offset(-15)
            make.centerY.equalTo(self.snp.centerY)
        }
        
    }
    
    func setTitle(title:String){
        self.titleLabel.text = title
    }
    func setSubTile(title: String){
        self.subTitleButton.setAttributedTitle(NSAttributedString.init(string: title, attributes: [NSAttributedString.Key.font: XDFont.pingFangSCRegular.ofSize(size: 14.0)!, NSAttributedString.Key.foregroundColor: UIColor(hex: "#666666")!]), for: .normal)
    }
    @objc private func subButtonClicked(){
        if self.subButtonHandler != nil {
            self.subButtonHandler!()
        }
    }
}
