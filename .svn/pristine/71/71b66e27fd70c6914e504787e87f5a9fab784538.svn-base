//
//  LGP_ChangePwdViewController.swift
//  LittleGoldenPig
//
//  Created by 方加会 on 2018/6/18.
//  Copyright © 2018年 方加会. All rights reserved.
//


import UIKit

class LVChangePwdViewController: BaseViewController,UITextFieldDelegate {
    /**
     修改密码的业务model
     */
    private lazy var changePwdModel:LVUpdatePwdModel = {
        let model = LVUpdatePwdModel()
        
        return model
    }()
    //显示旧密码不一致的lable
    private lazy var oldPwdStatusLabel:UILabel = {
        let lab = UILabel.init()
        lab.font = UIFont(font: XDFont.pingFangSCRegular, size: 16)
        lab.textColor = UIColor(hexString: "#EA3A3A")
        lab.sizeToFit()
        lab.text = "旧密码错误"
        lab.isHidden = true
        return lab
    }()
    //显示新密码和确认密码不一致的label
    private lazy var newPwdStatusLabel:UILabel = {
        let lab = UILabel.init()
        lab.font = UIFont(font: XDFont.pingFangSCRegular, size: 16)
        lab.textColor = UIColor(hexString: "#EA3A3A")
        lab.sizeToFit()
        lab.text = "密码不一致"
        lab.isHidden = true
        return lab
    }()
    var oldPwdTextField = UITextField();
    private lazy var showOldPwdButton:ExtendButton = {
        let btn = ExtendButton()
        btn.tag = 0
        btn.setImage(UIImage(named: "闭眼"), for: .normal)
        btn.setImage(UIImage(named: "睁眼"), for: .selected)
        btn.addTarget(self, action: #selector(showOrHideTextContent(sender:)), for: .touchUpInside)
        return btn
    }()
    var newPwdTextField = UITextField();
    private lazy var showNewPwdButton:ExtendButton = {
        let btn = ExtendButton()
        btn.tag = 1
        btn.setImage(UIImage(named: "闭眼"), for: .normal)
        btn.setImage(UIImage(named: "睁眼"), for: .selected)
        btn.addTarget(self, action: #selector(showOrHideTextContent(sender:)), for: .touchUpInside)
        return btn
    }()
    var okPwdTextField = UITextField();
    private lazy var showOkPwdButton:ExtendButton = {
        let btn = ExtendButton()
        btn.tag = 2
        btn.setImage(UIImage(named: "闭眼"), for: .normal)
        btn.setImage(UIImage(named: "睁眼"), for: .selected)
        btn.addTarget(self, action: #selector(showOrHideTextContent(sender:)), for: .touchUpInside)
        return btn
    }()
    @objc func showOrHideTextContent(sender:ExtendButton){
        sender.isSelected = !sender.isSelected
        self.textFilds[sender.tag].isSecureTextEntry = !sender.isSelected
    }
    var nameLabel = UILabel();
    var lineBottomImageView = UIImageView()
    var lineTopImageView = UIImageView()
    var lineMidImageView = UIImageView()
    var sendButton = UIButton()
    private lazy var textFilds:[UITextField] = {
        return [self.oldPwdTextField,self.newPwdTextField,self.okPwdTextField]
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem = nil
        
        self.view.backgroundColor = UIColor.white;
        
        self.view.addSubview(self.oldPwdTextField);
        self.view.addSubview(self.nameLabel);
        
        self.view.addSubview(self.newPwdTextField);
        self.view.addSubview(self.okPwdTextField);
        self.view.addSubview(self.lineTopImageView);
        self.view.addSubview(self.lineMidImageView);
        self.view.addSubview(self.lineBottomImageView);
        self.view.addSubview(self.sendButton);
        self.view.addSubview(self.showOkPwdButton)
        self.view.addSubview(self.showOldPwdButton)
        self.view.addSubview(self.showNewPwdButton)
        self.view.addSubview(self.oldPwdStatusLabel)
        self.view.addSubview(self.newPwdStatusLabel)
        self.nameLabel.text = "修改密码";
        self.nameLabel.font = UIFont.systemFont(ofSize: 28);
        self.nameLabel.frame = CGRect(x: 10*2, y: 20, width: self.view.width - 20*2, height: 34);
        self.oldPwdTextField.addTarget(self, action: #selector(vailedOkPwd(textField:)), for: .editingDidEnd)//添加结束编辑事件
        self.oldPwdTextField.placeholder = "请输入旧密码"
        self.oldPwdTextField.font = UIFont.systemFont(ofSize: 16);
        self.oldPwdTextField.frame = CGRect(x: 10*2, y: nameLabel.bottom+20, width: self.view.width - 150, height: 34);
        self.oldPwdTextField.clearButtonMode = UITextField.ViewMode.whileEditing // 清除按钮模式
        self.oldPwdTextField.borderStyle = UITextField.BorderStyle.none // 边框样式
        //设置placeholder的字体颜色
        self.oldPwdTextField.setValue(UIColor(hexString: "#999999"), forKeyPath: "placeholderLabel.textColor")
        self.oldPwdTextField.delegate = self // 关联代理
        self.oldPwdTextField.returnKeyType = UIReturnKeyType.done  // 键盘右下角按钮类型
        self.oldPwdTextField.keyboardType = UIKeyboardType.namePhonePad // 键盘类型
        oldPwdTextField.isSecureTextEntry = true
        
        self.lineTopImageView.frame = CGRect(x: 10*2, y:oldPwdTextField.bottom+20, width:self.view.width-20*2, height: 1)
        self.lineTopImageView.backgroundColor = UIColor(hexString: "#F2F2F2")
        self.oldPwdStatusLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.oldPwdTextField.snp.centerY)
            make.left.equalTo(self.oldPwdTextField.snp.right).offset(3)
        }
        
        self.showOldPwdButton.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize(width: 20, height: 20))
            make.centerY.equalTo(self.oldPwdTextField.snp.centerY)
            make.right.equalTo(self.lineTopImageView.snp.right)
        }
        
        self.newPwdTextField.placeholder = "请输入新密码"
        self.newPwdTextField.font = UIFont.systemFont(ofSize: 16);
        self.newPwdTextField.frame = CGRect(x: 10*2, y: lineTopImageView.bottom+20, width: self.view.width - 150, height: 34);
        self.newPwdTextField.clearButtonMode = UITextField.ViewMode.whileEditing // 清除按钮模式
        self.newPwdTextField.borderStyle = UITextField.BorderStyle.none // 边框样式
        //设置placeholder的字体颜色
        self.newPwdTextField.setValue(UIColor(hexString: "#999999"), forKeyPath: "placeholderLabel.textColor")
        self.newPwdTextField.delegate = self // 关联代理
        self.newPwdTextField.returnKeyType = UIReturnKeyType.done  // 键盘右下角按钮类型
        self.newPwdTextField.keyboardType = UIKeyboardType.namePhonePad // 键盘类型
        newPwdTextField.isSecureTextEntry = true
        self.newPwdTextField.addTarget(self, action: #selector(vailedOkPwd(textField:)), for: .editingChanged)
        self.lineMidImageView.frame = CGRect(x: 10*2, y: newPwdTextField.bottom+20, width:self.view.width-20*2, height: 1)
        self.lineMidImageView.backgroundColor = UIColor(hexString: "#F2F2F2")
        self.showNewPwdButton.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize(width: 20, height: 20))
            make.centerY.equalTo(self.newPwdTextField.snp.centerY)
            make.right.equalTo(self.lineMidImageView.snp.right)
        }
        
        self.okPwdTextField.placeholder = "请输入新密码"
        self.okPwdTextField.font = UIFont.systemFont(ofSize: 16);
        self.okPwdTextField.frame = CGRect(x: 10*2, y: lineMidImageView.bottom+20, width: self.view.width - 150, height: 34);
        self.okPwdTextField.clearButtonMode = UITextField.ViewMode.whileEditing // 清除按钮模式
        self.okPwdTextField.borderStyle = UITextField.BorderStyle.none // 边框样式
        self.okPwdTextField.addTarget(self, action: #selector(vailedOkPwd(textField:)), for: .editingChanged)
        //设置placeholder的字体颜色
        self.okPwdTextField.setValue(UIColor(hexString: "#999999"), forKeyPath: "placeholderLabel.textColor")
        self.okPwdTextField.delegate = self // 关联代理
        self.okPwdTextField.returnKeyType = UIReturnKeyType.done  // 键盘右下角按钮类型
        self.okPwdTextField.keyboardType = UIKeyboardType.namePhonePad // 键盘类型
        okPwdTextField.isSecureTextEntry = true
        self.newPwdStatusLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.okPwdTextField.snp.centerY)
            make.left.equalTo(self.okPwdTextField.snp.right).offset(3)
        }
        self.lineBottomImageView.frame = CGRect(x: 10*2, y: okPwdTextField.bottom+20, width:self.view.width-20*2, height: 1)
        self.lineBottomImageView.backgroundColor = UIColor(hexString: "#F2F2F2")
        
        self.showOkPwdButton.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize(width: 20, height: 20))
            make.centerY.equalTo(self.okPwdTextField.snp.centerY)
            make.right.equalTo(self.lineBottomImageView.snp.right)
        }
        
        
        self.sendButton.frame = CGRect(x: 10*2, y: lineBottomImageView.bottom+20, width:self.view.width-20*2, height: 25*2)
        self.sendButton.layer.cornerRadius = 25
        self.sendButton.backgroundColor = UIColor(hexString: "#41BEFE")
        self.sendButton.setTitle("保存", for: .normal)
        self.sendButton.setTitleColor(UIColor(hexString: "#FFFFFF"), for: .normal)
        self.sendButton.addTarget(self, action: #selector(didChangePwd), for: .touchUpInside);
    }
    /**
     发起修改密码的请求
     */
    @objc func didChangePwd(){
        //验证旧密码是否有效
        self.oldPwdStatusLabel.isHidden = (self.oldPwdTextField.text?.validatePassWord())!
        if self.oldPwdStatusLabel.isHidden == true {
            TBTHUD.showLoadingWithText(message: "正在修改密码")
            //修改密码
            self.changePwdModel.oldPassword = self.oldPwdTextField.text!
            self.changePwdModel.password = self.newPwdTextField.text!
            self.changePwdModel.checkPassword = self.okPwdTextField.text!
            self.changePwdModel.startBeenRequest(successionHandler: { (response:User) in
                TBTHUD.showMessage(message: "密码修改成功")
                
                self.navigationController?.popViewController(animated: true)
            }) {
                
            }
        }
    }
    /**
     旧密码输入框失去编辑状态,就去验证旧密码的正确性
     */
    @objc func vailedOldPwd(textField:UITextField){
        debugPrint("旧密码输入内容为:\(String(describing: textField.text))")
    }
    /**
     确认密码的输入框编辑状态状态发生变化，就验证是否相同
     */
    @objc func vailedOkPwd(textField:UITextField){
        debugPrint("OK密码的输入内容为:\(String(describing: textField.text))")
        self.newPwdStatusLabel.isHidden = self.okPwdTextField.text! == self.newPwdTextField.text!
        self.sendButton.isEnabled = self.okPwdTextField.text! == self.newPwdTextField.text!
    }
}
