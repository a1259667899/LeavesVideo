//
//  LVTableViewNormalHeader.swift
//  LeavesVideo
//
//  Created by Sinder on 2018/10/22.
//  Copyright © 2018 Sinder. All rights reserved.
//

import UIKit

class LVTableViewNormalHeader: UIView {
    var moreActionClick:noneAttributeClosure?
    init(frame: CGRect ,title: String ,subTitle: String, isShowArrow: Bool, moreActionHandler:@escaping noneAttributeClosure) {
        super.init(frame: frame)
        self.moreActionClick = moreActionHandler
        self.backgroundColor = UIColor.white
        let titleLable = UILabel.init()
        titleLable.text = title
        titleLable.sizeToFit()
        titleLable.font = XDFont.pingFangSCRegular.ofSize(size: 16.0)
        self.addSubview(titleLable)
        titleLable.snp.makeConstraints { (make) in
            make.left.equalTo(self.snp.left).offset(15)
            make.centerY.equalTo(self.snp.centerY)
        }
        if isShowArrow {
            let arrow = UIImageView.init()
            self.addSubview(arrow)
            arrow.image = UIImage(named: "mine_cellRightArrow")
            arrow.snp.makeConstraints { (make) in
                make.centerY.equalTo(self.snp.centerY)
                make.right.equalTo(self.snp.right).offset(-15)
                make.size.equalTo(CGSize(width: 12, height: 20))
            }
        }
        if subTitle.isEmpty == false {
            let subtitleLab = ExtendButton.init()
            subtitleLab.setAttributedTitle(NSAttributedString.init(string: subTitle, attributes: [NSAttributedString.Key.font: XDFont.pingFangSCRegular.ofSize(size: 14.0)!, NSAttributedString.Key.foregroundColor: UIColor(hex: "#666666")!]), for: .normal)
            subtitleLab.sizeToFit()
            subtitleLab.addTarget(self, action: #selector(buttonClick), for: .touchUpInside)
            self.addSubview(subtitleLab)
            subtitleLab.snp.makeConstraints { (make) in
                make.right.equalTo(self.snp.right).offset(-15)
                make.centerY.equalTo(self.snp.centerY)
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func buttonClick(){
        if self.moreActionClick != nil {
            self.moreActionClick!()
        }
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
