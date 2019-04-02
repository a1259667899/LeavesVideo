//
//  LVVideoIGenfoView.swift
//  LeavesVideo
//
//  Created by Sinder on 2018/10/22.
//  Copyright © 2018 Sinder. All rights reserved.
//

import UIKit

class LVVideoIGenfoView: UIView {
    //
    private lazy var contetLabel:UILabel = {
        let lable = UILabel.init()
        lable.textAlignment = .center
        lable.font = XDFont.pingFangSCRegular.ofSize(size: 12.0)
        lable.textColor = UIColor.white
        return lable
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        
        self.addViews()
    }
    private func addViews(){
        self.addSubview(self.contetLabel)
        self.contetLabel.snp.makeConstraints { (make) in
            make.edges.equalTo(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        }
        self.layer.cornerRadius = 11
        self.layer.masksToBounds = true
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setVideo(video:LVVideoListModel){
        var count = video.playNum
        var len:Int64 = 123456
        self.contetLabel.text = count.formatUnit() + "次播放" + "  " + len.formatSeconds()
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
