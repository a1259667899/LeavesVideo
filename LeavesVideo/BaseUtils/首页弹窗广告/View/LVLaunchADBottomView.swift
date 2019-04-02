//
//  LVLaunchADBottomView.swift
//  LeavesVideo
//
//  Created by Sinder on 2018/10/31.
//  Copyright © 2018 Sinder. All rights reserved.
//

import UIKit

class LVLaunchADBottomView: UIView {
    override init(frame: CGRect) {
        super.init(frame: CGRect(x: 0, y: kScreenHeight - (is_iPhoneX ? 107 + 34 : 107), width: kScreenWidth, height: is_iPhoneX ? 107 + 34 : 107))
        self.backgroundColor = UIColor.white
        self.addViews()
    }
    private func addViews(){
        let imageView = UIImageView.init(frame: CGRect(x: kScreenWidth/2 - 49, y: 34, width: 61, height: 64))
        self.addSubview(imageView)
        imageView.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize(width: 61, height: 64))
            make.centerX.equalTo(self.snp.centerX)
            make.bottom.equalTo(self.snp.bottom).offset(is_iPhoneX ? -55 : -21)
        }
        imageView.image = UIImage(named: "launch_bottom_icon")
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
}
