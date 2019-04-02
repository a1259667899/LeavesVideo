//
//  LVMineDownloadBottomView.swift
//  LeavesVideo
//
//  Created by Sinder on 2018/10/26.
//  Copyright © 2018 Sinder. All rights reserved.
//

import UIKit

class LVMineDownloadBottomView: UIView {
     var allCheckClouser:noneAttributeClosure?
     var deleteClouser:noneAttributeClosure?
    private lazy var allCheckButton:UIButton = {
        let button = ExtendButton()
        button.setAttributedTitle(NSAttributedString.init(string: "全选", attributes: [NSAttributedString.Key.font: XDFont.pingFangSCRegular.ofSize(size: 14.0)!, NSAttributedString.Key.foregroundColor: textBlackColor!]), for: .normal)
        button.setAttributedTitle(NSAttributedString.init(string: "取消全选", attributes: [NSAttributedString.Key.font: XDFont.pingFangSCRegular.ofSize(size: 14.0)!, NSAttributedString.Key.foregroundColor: textBlackColor!]), for: .selected)
        button.addTarget(self, action: #selector(allCheckButtonClicked), for: .touchUpInside)
        return button
    }()
    private lazy var deleteButton:UIButton = {
        let button = ExtendButton()
        button.setAttributedTitle(NSAttributedString.init(string: "删除", attributes: [NSAttributedString.Key.font: XDFont.pingFangSCRegular.ofSize(size: 14.0)!, NSAttributedString.Key.foregroundColor: UIColor(hex: "#FB1515")!]), for: .normal)
        button.addTarget(self, action: #selector(deleteButtonClicked), for: .touchUpInside)
        return button
    }()
    override init(frame: CGRect) {
        super.init(frame: CGRect.init(x: -1, y: kScreenHeight - kNavibarH, width: kScreenWidth + 2, height: 50))
        self.addViews()
        self.layer.borderColor = UIColor(hex: "#E5E5E5")?.cgColor
        self.layer.borderWidth = 1
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func addViews(){
        self.backgroundColor = UIColor.white
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
    }
   /**显示*/
    func showOn(view: UIView){
        UIView.animate(withDuration: 0.2) {
            self.frame = CGRect(x: -1, y: view.height - 49 - kSafeAreaBottomH, width: kScreenWidth + 2, height: 50 )
        }
    }
    /**隐藏*/
    func hideOn(view: UIView){
        UIView.animate(withDuration: 0.2) {
            self.frame = CGRect.init(x: -1, y: view.height + kSafeAreaBottomH, width: kScreenWidth + 1, height: 50 )
        }
    }
    /**全选*/
    @objc private func allCheckButtonClicked(){
        self.allCheckButton.isSelected = !self.allCheckButton.isSelected
        if self.allCheckClouser != nil {
            self.allCheckClouser!()
        }
    }
    /**删除*/
    @objc private func deleteButtonClicked(){
        if self.deleteClouser != nil {
            self.deleteClouser!()
        }
    }
}
