//
//  LVMineDownloadingHeaderView.swift
//  LeavesVideo
//
//  Created by Sinder on 2018/10/26.
//  Copyright © 2018 Sinder. All rights reserved.
//

import UIKit

class LVMineDownloadingHeaderView: UIView {
    private lazy var button:ExtendButton = {
        let but = ExtendButton()
        but.setBackgroundImage(UIImage(named: "task_buttonbg"), for: .normal)
        but.setBackgroundImage(UIImage(named: "task_buttonbg"), for: .selected)
        but.setAttributedTitle(NSAttributedString.init(string: "全部开始", attributes: [NSAttributedString.Key.font:XDFont.pingFangSCRegular.ofSize(size: 12.0)!, NSAttributedString.Key.foregroundColor:UIColor.white]), for: .selected)
        but.setAttributedTitle(NSAttributedString.init(string: "全部暂停", attributes: [NSAttributedString.Key.font:XDFont.pingFangSCRegular.ofSize(size: 12.0)!, NSAttributedString.Key.foregroundColor:UIColor.white]), for: .normal)
        but.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
        return but
    }()
    var resumeClouser:noneAttributeClosure?
    var pauseClouser:noneAttributeClosure?
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func addViews(){
        self.backgroundColor = UIColor.white
        self.addSubview(self.button)
        self.button.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.snp.centerY)
            make.size.equalTo(CGSize(width: 62, height: 19))
            make.left.equalTo(self.snp.left).offset(15)
        }
    }
    @objc private func buttonClicked(){
        self.button.isSelected = !self.button.isSelected
        if  self.button.isSelected{
            self.pauseClouser!()
        }else{
            self.resumeClouser!()
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
