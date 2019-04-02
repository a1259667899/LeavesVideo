//
//  LGP_RegisteredViewController.swift
//  Investment
//
//  Created by 方加会 on 2018/6/29.
//  Copyright © 2018年 方加会. All rights reserved.
//

import UIKit
typealias clouserWithString = (String)-> Void
class LVRegisteredViewController: BaseViewController,UITextFieldDelegate {
    var pwdChangeSuccessBlock : clouserWithString?
    
    var userNameImageView = UIImageView();
    var userNameTextField = UITextField();
    var userCodeImageView = UIImageView();
    var userCodeTextField = UITextField();
    var userPwdTextField = UITextField();
    var userPwdImageView = UIImageView();
    var inviteCodeImageView = UIImageView()
    var inviteTextField = UITextField()
    var lineTopImageView = UIImageView()
    var lineMidImageView = UIImageView()
    var quickButton = UIButton()
    var forgotButton = UIButton()
    var sendButton = UIButton()
    var codeButton = UIButton()
    /**
     用户协议按钮
     */
    private lazy var userProtocalButton:ExtendButton = {
        let button = ExtendButton()
        let attributeString = NSMutableAttributedString.init(string: "注册即代表阅读并同意用户协议", attributes: [NSAttributedString.Key.font:UIFont(font: XDFont.pingFangSCRegular, size: 15)!,NSAttributedString.Key.foregroundColor:UIColor(hexString: "#949494")!])
        attributeString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor(hexString: "#3574FA")!, range: NSRange.init(location: 10, length: 4))
        button.setAttributedTitle(attributeString, for: .normal)
        button.addTarget(self, action: #selector(openUserProtocol), for: .touchUpInside)
        return button
    }()
    /**
     是否是修改密码
     */
    var isSetPwd = false
    
    /**
     注册获取验证码model
     */
    private lazy var checkCodeModel:LVRegisterCodeModel = {
        let model = LVRegisterCodeModel()
        
        return model
    }()
    /**
     忘记密码获取验证码model
     */
    private lazy var pwdChodeModel:LVForgetPwdCodeModel = {
        let model = LVForgetPwdCodeModel()
        
        return model
    }()
    /**
     用修改密码获取验证码model
     */
    private lazy var resetPwdCodeModel:LVResetPwdModel = {
        let model = LVResetPwdModel()
        
        return model
    }()
    /**
     忘记密码model
     */
    private lazy var resetPwdModel:LVResetPwdModel = {
        let model = LVResetPwdModel()
        
        return model
    }()
    /**
     用户注册model
     */
    private lazy var registerModel:LVRegisterModel = {
        let model = LVRegisterModel()
        return model
    }()
    /**
     登录model
     */
    private lazy var loginModel:LVLoginModel = {
        let model = LVLoginModel()
        
        return model
    }()
    /**
     隐藏显示密码按钮
     */
    private lazy var showPwdButton:ExtendButton = {
        let btn = ExtendButton()
        btn.tag = 0
        btn.setImage(UIImage(named: "闭眼"), for: .normal)
        btn.setImage(UIImage(named: "睁眼"), for: .selected)
        btn.addTarget(self, action: #selector(showOrHideTextContent(sender:)), for: .touchUpInside)
        return btn
    }()
    var countdownTimer: Timer?
    var remainingSeconds: Int = 0 {
        willSet {
            self.codeButton.setTitle("\(newValue)s", for: .normal)
            if newValue <= 0 {
                self.codeButton.setTitle("发送验证码", for: .normal)
                isCounting = false
            }
        }
        
    }
    
    var isCounting = false {
        willSet {
            if newValue {
                countdownTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTime(timer:)), userInfo: nil, repeats: true)
                remainingSeconds = 60
                
            } else {
                countdownTimer?.invalidate()
                countdownTimer = nil
                
            }
            self.codeButton.isEnabled = !newValue
        }
        
    }
    
    @objc func updateTime(timer: Timer) {
        remainingSeconds -= 1
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white;
        self.navigationItem.rightBarButtonItem = nil
        if isSetPwd == false {
            self.view.addSubview(self.inviteTextField)
            self.view.addSubview(self.inviteCodeImageView)
        }
        
        self.view.addSubview(self.userNameTextField);
        self.view.addSubview(self.userPwdTextField);
        self.view.addSubview(self.lineTopImageView);
        self.view.addSubview(self.lineMidImageView);
        self.view.addSubview(self.quickButton);
        self.view.addSubview(self.forgotButton);
        self.view.addSubview(self.userNameImageView);
        self.view.addSubview(self.userPwdImageView);
        self.view.addSubview(self.sendButton);
        self.view.addSubview(self.codeButton);
        self.view.addSubview(self.showPwdButton)
//        self.view.addSubview(self.userProtocalButton)
//        self.navigationController?.isNavigationBarHidden = true
        self.titleStr = "注册"
        
        
        self.userNameImageView.frame = CGRect(x: 29, y: 110, width: 20, height: 15);
        self.userNameImageView.image = UIImage(named: "login_email")
        self.userNameTextField.placeholder = "请输入邮箱"
        self.userNameTextField.font = UIFont.systemFont(ofSize: 16);
        self.userNameTextField.frame = CGRect(x: userNameImageView.right+10*2, y: 110, width: self.view.width - 29*2*2, height: 20);
        self.userNameTextField.clearButtonMode = UITextField.ViewMode.whileEditing // 清除按钮模式
        self.userNameTextField.borderStyle = UITextField.BorderStyle.none // 边框样式
        //设置placeholder的字体颜色
        self.userNameTextField.setValue(UIColor(hexString: "#999999"), forKeyPath: "placeholderLabel.textColor")
        self.userNameTextField.delegate = self // 关联代理
        self.userNameTextField.returnKeyType = UIReturnKeyType.done  // 键盘右下角按钮类型
        self.userNameTextField.keyboardType = UIKeyboardType.emailAddress // 键盘类型
        
        self.lineTopImageView.frame = CGRect(x: 10*2, y:userNameTextField.bottom+14, width:self.view.width-20*2, height: 1)
        self.lineTopImageView.backgroundColor = UIColor(hexString: "#EBEBEB")
        
        self.userCodeImageView.frame = CGRect(x: 29, y: lineTopImageView.bottom+28, width: 15, height: 18);
        self.userCodeImageView.image = UIImage(named: "login_checkCodeIcon")
        self.view.addSubview(userCodeImageView)
        
        self.userCodeTextField.placeholder = "请输验证码"
        self.userCodeTextField.font = UIFont.systemFont(ofSize: 16);
        self.userCodeTextField.frame = CGRect(x: userCodeImageView.right+10*2, y: lineTopImageView.bottom+28, width: (self.view.width - 29*2*2)/2, height: 20);
        self.userCodeTextField.clearButtonMode = UITextField.ViewMode.whileEditing // 清除按钮模式
        self.userCodeTextField.borderStyle = UITextField.BorderStyle.none // 边框样式
        //设置placeholder的字体颜色
        self.userCodeTextField.setValue(UIColor(hexString: "#999999"), forKeyPath: "placeholderLabel.textColor")
        self.userCodeTextField.delegate = self // 关联代理
        self.userCodeTextField.returnKeyType = UIReturnKeyType.done  // 键盘右下角按钮类型
        self.userCodeTextField.keyboardType = UIKeyboardType.namePhonePad // 键盘类型
        self.view.addSubview(userCodeTextField)
        
        let lineMid1ImageView = UIImageView()
        lineMid1ImageView.frame = CGRect(x: userCodeTextField.right+15, y:lineTopImageView.bottom+17, width:1, height: 36)
        lineMid1ImageView.backgroundColor = UIColor(hexString: "#EBEBEB")
        self.view.addSubview(lineMid1ImageView)
        
        self.codeButton.frame = CGRect(x:userCodeTextField.right+15*2, y:lineTopImageView.bottom+28, width:self.view.width/3, height: 20)
        self.codeButton.setTitleColor(UIColor(hexString: "#3574FA"), for: .normal)
        self.codeButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        self.codeButton.setTitle("发送验证码", for: .normal)
        self.codeButton.addTarget(self, action: #selector(getVerificationCode), for: .touchUpInside);
        self.isCounting = false
        
        let lineMidExImageView = UIImageView()
        lineMidExImageView.frame = CGRect(x: 10*2, y:userCodeTextField.bottom+14, width:self.view.width-20*2, height: 1)
        lineMidExImageView.backgroundColor = UIColor(hexString: "#EBEBEB")
        self.view.addSubview(lineMidExImageView)
        
        if isSetPwd == false{
            self.inviteCodeImageView.frame = CGRect(x: 29, y: lineMidExImageView.bottom + 28, width: 20, height: 15);
            self.inviteCodeImageView.image = UIImage(named: "login_email")
            self.inviteTextField.placeholder = "请输入邀请码（可选）"
            self.inviteTextField.font = UIFont.systemFont(ofSize: 16);
            self.inviteTextField.frame = CGRect(x: userNameImageView.right+10*2, y: lineMidExImageView.bottom + 28, width: self.view.width - 29*2*2, height: 20);
            self.inviteTextField.clearButtonMode = UITextField.ViewMode.whileEditing // 清除按钮模式
            self.inviteTextField.borderStyle = UITextField.BorderStyle.none // 边框样式
            //设置placeholder的字体颜色
            self.inviteTextField.setValue(UIColor(hexString: "#999999"), forKeyPath: "placeholderLabel.textColor")
            self.inviteTextField.delegate = self // 关联代理
            self.inviteTextField.returnKeyType = UIReturnKeyType.done  // 键盘右下角按钮类型
            self.inviteTextField.keyboardType = UIKeyboardType.asciiCapableNumberPad // 键盘类型
            let lineInvitCodeBottomImageView = UIImageView()
            lineInvitCodeBottomImageView.frame = CGRect(x: 10*2, y:inviteTextField.bottom+14, width:self.view.width-20*2, height: 1)
            lineInvitCodeBottomImageView.backgroundColor = UIColor(hexString: "#EBEBEB")
            self.view.addSubview(lineInvitCodeBottomImageView)
            self.userPwdImageView.frame = CGRect(x: 29, y: lineInvitCodeBottomImageView.bottom+28, width: 15, height: 18);
            self.userPwdTextField.frame = CGRect(x: userPwdImageView.right+20, y: lineInvitCodeBottomImageView.bottom+20, width: self.view.width - 150, height: 34);
        }else{
            self.userPwdImageView.frame = CGRect(x: 29, y: lineMidExImageView.bottom+28, width: 15, height: 18);
            self.userPwdTextField.frame = CGRect(x: userPwdImageView.right+20, y: lineMidExImageView.bottom+20, width: self.view.width - 150, height: 34);
        }
        
        
        self.userPwdImageView.image = UIImage(named: "login_lock")
        
        self.userPwdTextField.placeholder = "请设置密码"
        self.userPwdTextField.font = UIFont.systemFont(ofSize: 16);
        
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
        
        //眼睛
        self.showPwdButton.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize(width: 20, height: 20))
            make.centerY.equalTo(self.userPwdTextField.snp.centerY)
            make.right.equalTo(self.lineMidImageView.snp.right)
        }
        
        self.sendButton.frame = CGRect(x: 10*2, y: lineMidImageView.bottom+40, width:self.view.width-20*2, height: 25*2)
        self.sendButton.layer.cornerRadius = 25
        self.sendButton.backgroundColor = UIColor(hexString: "#41BEFE")
        self.sendButton.setTitle("注册", for: .normal)
        self.sendButton.setTitleColor(UIColor(hexString: "#FFFFFF"), for: .normal)
        self.sendButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        self.sendButton.addTarget(self, action: #selector(didLogin), for: .touchUpInside);
        
        if(isSetPwd)
        {
            self.titleStr = "忘记密码"
            self.sendButton.setTitle("设置密码", for: .normal)
        }
//        self.userProtocalButton.snp.makeConstraints { (make) in
//            make.centerX.equalTo(self.view.snp.centerX)
//            make.bottom.equalTo(self.view.snp.bottom).offset(-44)
//            make.width.equalTo(210)
//        }
    }
    
    func setIsSetPwd(isSetPwd:Bool)
    {
        self.isSetPwd = isSetPwd
    }
    
    /**
     获取验证码
     */
    @objc func getVerificationCode() {
        
        //首先验证手机号码的有效性
        if (self.userNameTextField.text?.validateEmail())! == true{
            if isSetPwd == true{//忘记密码获取验证码
                TBTHUD.showLoadingWithText(message: "正在发送验证码")
                self.pwdChodeModel.email = self.userNameTextField.text!
                self.pwdChodeModel.getBeenRequest(successionHandler: { (response:StringHandy) in
                    TBTHUD.showSuccessMessage(message: "验证码已发送到邮箱")
                }) {
                    
                }
                return
            }
            self.checkCodeModel.email = self.userNameTextField.text!
            //发送验证码
            self.checkCodeModel.getBeenRequest(successionHandler: { (responsr:StringHandy) in
                TBTHUD.showSuccessMessage(message: "验证码已发送")
                self.isCounting = true
            }) {
                TBTHUD.showSuccessMessage(message: "验证码已发送")
                self.isCounting = true
            }
        }else{
            TBTHUD.showErrorMessage(message: "请输入有效的邮箱")
        }
    }
    
    @objc func didLogin() {
        
        if (self.userCodeTextField.text == nil || self.userCodeTextField.text!.count != 4)
        {
            TBTHUD.showMessage(message: "请输入正确的验证码")
            
            return
        }
        
        if (self.userNameTextField.text?.validateEmail() == false)
        {
            TBTHUD.showMessage(message: "请输入正确的邮箱")
            return
        }
        
        if (self.userPwdTextField.text?.validatePassWord() == false)
        {
            TBTHUD.showMessage(message: "请输入正确的密码格式")
            return
        }
        if isSetPwd == false{
            self.registerModel.email = self.userNameTextField.text!
            self.registerModel.password = self.userPwdTextField.text!
            self.registerModel.code = self.userCodeTextField.text!
            self.registerModel.inviteCode = self.inviteTextField.text!
            self.register()
        }else{
            TBTHUD.showLoadingWithText(message: "正在修改密码")
            self.resetPwdCodeModel.password = self.userPwdTextField.text!
            self.resetPwdCodeModel.email = self.userNameTextField.text!
            self.resetPwdCodeModel.code = self.userCodeTextField.text!
            self.resetPwdCodeModel.startBeenRequest(successionHandler: { (response:StringHandy) in
                TBTHUD.showSuccessMessage(message: "密码修改成功")
                if self.pwdChangeSuccessBlock != nil{
                    self.pwdChangeSuccessBlock!(self.userNameTextField.text!)
                    self.navigationController?.popViewController(animated: true)
                }
            }) {
                
            }
        }
    }
    @objc func showOrHideTextContent(sender:ExtendButton){
        sender.isSelected = !sender.isSelected
        self.userPwdTextField.isSecureTextEntry = !sender.isSelected
    }
    /**
     注册用户的操作
     */
    func register(){
        TBTHUD.showLoadingWithText(message: "正在注册")
        self.registerModel.startBeenRequest(successionHandler: {[weak self] (response:User) in
            TBTHUD.showLoadingWithText(message: "正在注册")
            //进行登录操作
            self?.login()
            
        }) {
            
        }
    }
    
    /**
     登录操作
     */
    private func login(){
        
        self.loginModel.email = self.userNameTextField.text!
        self.loginModel.password = self.userPwdTextField.text!
        self.loginModel.startBeenRequest(successionHandler: { (response:User) in
            //存储用户信息
            UserUtil.insertUser(user: response)
            TBTHUD.showSuccessMessage(message: "注册成功")
            //发送登录成功的通知
            NotificationCenter.default.post(name: NotifyLogin, object: nil)
            self.dismiss(animated: true, completion: {
                
            })
        }) {
            
        }
    }
    /**
     打开用户协议
     */
    @objc private func openUserProtocol(){
        let vc = WKWebViewViewController()
        vc.setupParamerters(urlP: "http://www.toubutou.com/tcp.html", titleP: "用户协议", thumb: "", allowShare: false)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
