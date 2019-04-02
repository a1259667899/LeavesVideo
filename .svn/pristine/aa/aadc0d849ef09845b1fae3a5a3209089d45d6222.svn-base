//
//  LVMindownloadSegmentHeader.swift
//  LeavesVideo
//
//  Created by Sinder on 2018/11/1.
//  Copyright © 2018 Sinder. All rights reserved.
//

import UIKit
protocol LVMindownloadSegmentHeaderDelegate {
    func LVMindownloadSegmentHeaderDidSelectIndex(index: Int)
}
class LVMindownloadSegmentHeader: UIView {
    //内部index改变，回调给外部
    var delegate: LVMindownloadSegmentHeaderDelegate?
    //外部index改变，调用这个方法刷新UI
    var selectedIndexChangedClouser: intAttributeClosuer?
    
    private lazy var allCheckButton:ExtendButton = {
        let button = ExtendButton()
        button.setAttributedTitle(NSAttributedString.init(string: "正在下载", attributes: [NSAttributedString.Key.font: XDFont.pingFangSCRegular.ofSize(size: 14.0)!, NSAttributedString.Key.foregroundColor: textBlackColor!]), for: .normal)
        button.addTarget(self, action: #selector(buttonClicked(sender:)), for: .touchUpInside)
        button.tag = 0
        return button
    }()
    private lazy var deleteButton:ExtendButton = {
        let button = ExtendButton()
        button.setAttributedTitle(NSAttributedString.init(string: "已完成", attributes: [NSAttributedString.Key.font: XDFont.pingFangSCRegular.ofSize(size: 14.0)!, NSAttributedString.Key.foregroundColor: UIColor(hex: "#FB1515")!]), for: .normal)
        button.addTarget(self, action: #selector(buttonClicked(sender:)), for: .touchUpInside)
        button.tag = 1
        return button
    }()
    private var buttons: [ExtendButton] = []
    private var titles: [String] = []
    private var lastSelectButton: ExtendButton?
    init(frame: CGRect, titles: [String]) {
        super.init(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: 44))
        self.backgroundColor = UIColor.white
        self.titles = titles
        self.addViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func addViews(){
        self.backgroundColor = UIColor.white
        self.setButtonTitles()
        self.buttons = [self.allCheckButton, self.deleteButton]
        self.lastSelectButton = self.allCheckButton
        self.addSubview(self.allCheckButton)
        self.addSubview(self.deleteButton)
        self.allCheckButton.snp.makeConstraints { (make) in
            make.left.equalTo(self.snp.left)
            make.top.equalTo(self.snp.top)
            make.right.equalTo(self.snp.centerX)
            make.height.equalTo(49)
        }
        self.deleteButton.snp.makeConstraints { (make) in
            make.left.equalTo(self.snp.centerX)
            make.top.equalTo(self.snp.top)
            make.right.equalTo(self.snp.right)
            make.height.equalTo(49)
        }
        self.lastSelectButton?.isSelected = true
        self.selectedIndexChangedClouser = {[weak self](index) in
            let button = self?.buttons[index]
            if button == self?.lastSelectButton {
                return
            }
            button?.isSelected = true
        }
        let line = UIView.init()
        self.addSubview(line)
        line.backgroundColor = UIColor(hex: "#E5E5E5")
        line.snp.makeConstraints { (make) in
            make.bottom.equalTo(self)
            make.left.equalTo(self).offset(15)
            make.right.equalTo(self).offset(-15)
            make.height.equalTo(1)
        }
    }
    /**设置button的title显示*/
    private func setButtonTitles(){
         self.allCheckButton.setAttributedTitle(NSAttributedString.init(string: self.titles[0], attributes: [NSAttributedString.Key.font: XDFont.pingFangSCRegular.ofSize(size: 14.0)!, NSAttributedString.Key.foregroundColor: UIColor(hex: "6E6E6E")!]), for: .normal)
        self.allCheckButton.setAttributedTitle(NSAttributedString.init(string: self.titles[0], attributes: [NSAttributedString.Key.font: XDFont.pingFangSCRegular.ofSize(size: 14.0)!, NSAttributedString.Key.foregroundColor: textBlackColor!]), for: .selected)
        self.deleteButton.setAttributedTitle(NSAttributedString.init(string: self.titles[1], attributes: [NSAttributedString.Key.font: XDFont.pingFangSCRegular.ofSize(size: 14.0)!, NSAttributedString.Key.foregroundColor: UIColor(hex: "6E6E6E")!]), for: .normal)
        self.deleteButton.setAttributedTitle(NSAttributedString.init(string: self.titles[1], attributes: [NSAttributedString.Key.font: XDFont.pingFangSCRegular.ofSize(size: 14.0)!, NSAttributedString.Key.foregroundColor: textBlackColor!]), for: .selected)
    }
    @objc private func buttonClicked(sender: ExtendButton){
        if self.delegate != nil {
            self.delegate?.LVMindownloadSegmentHeaderDidSelectIndex(index: sender.tag)
        }
        self.lastSelectButton?.isSelected = false
        sender.isSelected = true
        self.lastSelectButton = sender
    }
    /**更新title显示*/
    public func updateTiels(titles: [String]){
        self.titles = titles
        self.setButtonTitles()
    }
    /**获取当前选中的序号*/
    public func getCurrentIndex()-> Int{
        return (self.lastSelectButton?.tag)!
    }
}
