//
//  LGP_LoginViewController.swift
//  LittleGoldenPig
//
//  Created by 方加会 on 2018/6/18.
//  Copyright © 2018年 方加会. All rights reserved.
//

import UIKit

class LVLoginViewController: BaseViewController,UITextFieldDelegate {

    var userNameImageView = UIImageView();
    var userNameTextField = UITextField();
    var userPwdTextField = UITextField();
    var userPwdImageView = UIImageView();
    var lineTopImageView = UIImageView()
    var lineMidImageView = UIImageView()
    var quickButton = UIButton()
    var forgotButton = UIButton()
    var sendButton = UIButton()
    var iconImageView = UIImageView()
    
    var tbtLoginModel = LVLoginModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem = nil
        self.titleStr = "登录"
        self.backBtnCallBack = {[weak self]in
            self?.dismiss(animated: true, completion: nil)
        }
        self.view.backgroundColor = UIColor.white;
        
        self.view.addSubview(self.iconImageView);
        self.view.addSubview(self.userNameTextField);
        self.view.addSubview(self.userPwdTextField);
        self.view.addSubview(self.lineTopImageView);
        self.view.addSubview(self.lineMidImageView);
        self.view.addSubview(self.quickButton);
        self.view.addSubview(self.forgotButton);
        self.view.addSubview(self.userNameImageView);
        self.view.addSubview(self.userPwdImageView);
        
        
        self.view.addSubview(self.sendButton);
        
        self.iconImageView.frame = CGRect(x: (self.view.width-30*2)/2, y: 15, width: 30*2, height: 60);
        self.iconImageView.image = UIImage(named: "login_icon")
        self.iconImageView.layer.cornerRadius = 10
        self.iconImageView.layer.masksToBounds = true
        self.iconImageView.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize(width: 60, height: 60))
            make.centerX.equalTo(self.view.snp.centerX)
            make.top.equalTo(self.view.snp.top).offset(15)
        }
        
        self.userNameImageView.frame = CGRect(x: 30, y: iconImageView.bottom+50, width: 20, height: 15);
        self.userNameImageView.image = UIImage(named: "login_email")
        self.userNameTextField.placeholder = "请输入邮箱"
        self.userNameTextField.font = UIFont.systemFont(ofSize: 16);
        self.userNameTextField.frame = CGRect(x: userNameImageView.right+10*2, y: iconImageView.bottom+50, width: self.view.width - 29*2*2, height: 20);
        self.userNameTextField.clearButtonMode = UITextField.ViewMode.whileEditing // 清除按钮模式
        self.userNameTextField.borderStyle = UITextField.BorderStyle.none // 边框样式
        //设置placeholder的字体颜色
        self.userNameTextField.setValue(UIColor(hexString: "#999999"), forKeyPath: "placeholderLabel.textColor")
        self.userNameTextField.delegate = self // 关联代理
        self.userNameTextField.returnKeyType = UIReturnKeyType.done  // 键盘右下角按钮类型
        self.userNameTextField.keyboardType = UIKeyboardType.emailAddress // 键盘类型
        
        self.lineTopImageView.frame = CGRect(x: 10*2, y:userNameImageView.bottom+14, width:self.view.width-20*2, height: 1)
        self.lineTopImageView.backgroundColor = UIColor(hexString: "#EBEBEB")
        
        self.userPwdImageView.frame = CGRect(x: 30, y: lineTopImageView.bottom+28, width: 15, height: 18);
        self.userPwdImageView.image = UIImage(named: "login_lock")
        
        self.userPwdTextField.placeholder = "请输入密码"
        self.userPwdTextField.font = UIFont.systemFont(ofSize: 16);
        self.userPwdTextField.frame = CGRect(x: userPwdImageView.right+20, y: lineTopImageView.bottom+20, width: self.view.width - 20*2, height: 34);
        self.userPwdTextField.clearButtonMode = UITextField.ViewMode.whileEditing // 清除按钮模式
        self.userPwdTextField.borderStyle = UITextField.BorderStyle.none // 边框样式
        //设置placeholder的字体颜色
        self.userPwdTextField.setValue(UIColor(hexString: "#999999"), forKeyPath: "placeholderLabel.textColor")
        self.userPwdTextField.delegate = self // 关联代理
        self.userPwdTextField.returnKeyType = UIReturnKeyType.done  // 键盘右下角按钮类型
        self.userPwdTextField.keyboardType = UIKeyboardType.namePhonePad // 键盘类型
        userPwdTextField.isSecureTextEntry = true
        
        self.lineMidImageView.frame = CGRect(x: 10*2, y: userPwdImageView.bottom+14, width:self.view.width-20*2, height: 1)
        self.lineMidImageView.backgroundColor = UIColor(hexString: "#EBEBEB")
        
        self.quickButton.frame = CGRect(x: 20, y:lineMidImageView.bottom+97, width:self.view.width/3, height: 8*2)
        self.quickButton.setTitle("注册账号", for: .normal)
        self.quickButton.setTitleColor(UIColor(hexString: "#4481EB"), for: .normal)
        self.quickButton.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        self.quickButton.addTarget(self, action: #selector(quickLogin), for: .touchUpInside);
        
        self.forgotButton.frame = CGRect(x: self.view.width/6-10, y: lineMidImageView.bottom+97, width:self.view.width/3, height: 8*2)
        self.forgotButton.setTitle("忘记密码", for: .normal)
        self.forgotButton.setTitleColor(UIColor(hexString: "#4481EB"), for: .normal)
        self.forgotButton.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        self.forgotButton.addTarget(self, action: #selector(didChangePwd), for: .touchUpInside);
        
        self.sendButton.frame = CGRect(x: 10*2, y: lineMidImageView.bottom+25, width:self.view.width-20*2, height: 25*2)
        self.sendButton.layer.cornerRadius = 25
        self.sendButton.backgroundColor = UIColor(hexString: "#41BEFE")
        self.sendButton.setTitle("登录", for: .normal)
        self.sendButton.setTitleColor(UIColor(hexString: "#FFFFFF"), for: .normal)
        self.sendButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        self.sendButton.addTarget(self, action: #selector(didLogin), for: .touchUpInside);
        
        self.quickButton.snp.makeConstraints { (make) in
            make.left.equalTo(self.view.snp.left).offset(20)
            make.top.equalTo(self.sendButton.snp.bottom).offset(22)
        }
        self.forgotButton.snp.makeConstraints { (make) in
            make.right.equalTo(self.view.snp.right).offset(-20)
            make.top.equalTo(self.sendButton.snp.bottom).offset(22)
        }
        let leftBarButtonItem:UIBarButtonItem = UIBarButtonItem.init(image: UIImage.init(named:"BACK")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(backBtnClcked))
        self.navigationItem.leftBarButtonItem = leftBarButtonItem
    }

    @objc func quickLogin() {
        let vc = LVRegisteredViewController()
        vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true);
    }
    @objc func didChangePwd() {
        let vc = LVRegisteredViewController()
        vc.pwdChangeSuccessBlock = {[weak self](text) in
            self?.userNameTextField.text = text
        }
        vc.setIsSetPwd(isSetPwd: true)
        vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true);
    }
    
    override func backBtnClcked() {
        self.dismiss(animated: true) {
            
        }
    }
    
    @objc func didLogin() {

        if (self.userNameTextField.text == nil || self.userNameTextField.text!.isEmpty)
        {
            TBTHUD.showMessage(message: "请输入邮箱")

            return
        }

        if (self.userPwdTextField.text == nil || self.userPwdTextField.text!.isEmpty)
        {
             TBTHUD.showMessage(message: "请输入密码")

            return
        }
        tbtLoginModel.password = userPwdTextField.text!
        tbtLoginModel.email = userNameTextField.text!
        TBTHUD.showLoadingWithText(message: "正在登录")
        tbtLoginModel.startBeenRequest(successionHandler: { (user:User) in
            debugPrint("登录成功！！！！！")
            TBTHUD.dismiss()
            TBTHUD.showSuccessMessage(message: "登录成功")
            UserUtil.insertUser(user: user)
            //发送登录通知
            NotificationCenter.default.post(name: NotifyLogin, object: nil)
            self.dismiss(animated: true, completion: {
                
            })
        }) {
            
        }
    }
}
