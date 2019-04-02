//
//  LVTaskListTableViewCell.swift
//  LeavesVideo
//
//  Created by Sinder on 2018/10/19.
//  Copyright © 2018 Sinder. All rights reserved.
//

import UIKit

class LVTaskListTableViewCell: UITableViewCell ,TableViewCellSeparaLineProtocal{
    private var taskItem:LVMineTaskItem?
    var buttonClickedClouser:noneAttributeClosure?
    private lazy var iconImage:UIImageView = {
        let imageView = UIImageView.init()
        imageView.layer.cornerRadius = 22
        imageView.layer.masksToBounds = true
        imageView.backgroundColor = textLightGrayColor
        return imageView
    }()
    private lazy var titleLable:UILabel = {
        let label = UILabel.init()
        label.font = XDFont.pingFangSCRegular.ofSize(size: 14.0)
        label.textColor = textBlackColor
        label.sizeToFit()
        label.text = "每日登录"
        return label
    }()
    private lazy var subTitleLable:UILabel = {
        let label = UILabel.init()
        label.font = XDFont.pingFangSCRegular.ofSize(size: 12.0)
        label.textColor = textLightGrayColor
        label.sizeToFit()
        label.text = "观看次数+10  观看次数+10"
        return label
    }()
    private lazy var button:ExtendButton = {
        let button = ExtendButton()
        button.layer.cornerRadius = 15
        button.layer.masksToBounds = true
        button.setBackgroundImage(UIImage(named: "task_buttonbg"), for: .normal)
        button.setBackgroundImage(UIImage.createImageWithColor(color: UIColor(hexString: "#E5E5E5")!), for: .disabled)
        button.setAttributedTitle(NSAttributedString.init(string: "做任务", attributes: [NSAttributedString.Key.font:XDFont.pingFangSCRegular.ofSize(size: 14.0)! , NSAttributedString.Key.foregroundColor:UIColor.white]), for: .normal)
        button.setAttributedTitle(NSAttributedString.init(string: "已完成", attributes: [NSAttributedString.Key.font:XDFont.pingFangSCRegular.ofSize(size: 14.0)! , NSAttributedString.Key.foregroundColor:UIColor.white]), for: .disabled)
        button.addTarget(self, action: #selector(buttonClicked(sendr:)), for: .touchUpInside)
        return button
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addViews()
        self.addSepareterLine()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func  addViews(){
        self.addSubview(self.iconImage)
        self.addSubview(self.titleLable)
        self.addSubview(self.subTitleLable)
        self.addSubview(self.button)
        self.iconImage.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize(width: 44, height: 44))
            make.left.equalTo(self.snp.left).offset(15)
            make.top.equalTo(self.snp.top).offset(15)
            make.bottom.equalTo(self.snp.bottom).offset(-15)
        }
        self.titleLable.snp.makeConstraints { (make) in
            make.left.equalTo(self.iconImage.snp.right).offset(15)
            make.top.equalTo(self.snp.top).offset(17)
        }
        self.subTitleLable.snp.makeConstraints { (make) in
            make.left.equalTo(self.titleLable.snp.left)
            make.top.equalTo(self.titleLable.snp.bottom).offset(2)
        }
        self.button.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.snp.centerY)
            make.right.equalTo(self.snp.right).offset(-15)
            make.size.equalTo(CGSize(width: 70, height: 30))
        }
    }
    func setTaskItem(task:LVMineTaskItem){
        self.taskItem = task
        self.iconImage.setImageby_kf(imageUrl: (self.taskItem?.taskIcon)!)
        self.titleLable.text = self.taskItem?.taskName
        self.subTitleLable.text = (self.taskItem?.rewardName)! + "+\(self.taskItem?.rewardValue ?? 2)"
//        self.button.isSelected = (self.taskItem?.completed)!
        self.button.isEnabled = !(self.taskItem?.completed)!
    }
    @objc private func buttonClicked(sendr: UIButton){
        if self.buttonClickedClouser != nil {
            self.buttonClickedClouser!()
        }
    }
}
