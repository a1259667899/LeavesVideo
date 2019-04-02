//
//  LGP_ChangeNameViewController.swift
//  Investment
//
//  Created by 方加会 on 2018/6/28.
//  Copyright © 2018年 方加会. All rights reserved.
//

import UIKit
class LVChangeNameViewController: BaseViewController,UITextFieldDelegate {
    var didChangeNameBlock:clouserWithString?
    var oldPwdTextField = UITextField();
    var newPwdTextField = UITextField();
    var okPwdTextField = UITextField();
    var nameLabel = UILabel();
    var lineBottomImageView = UIImageView()
    var lineTopImageView = UIImageView()
    var lineMidImageView = UIImageView()
    var sendButton = UIButton()
    private lazy var businsssModel:LVUserBusinessModel = {
        let model = LVUserBusinessModel()
        return model
    }()
    //初始的昵称
    var originalNickName = ""
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
        
        self.nameLabel.text = "修改昵称";
        self.nameLabel.font = UIFont.systemFont(ofSize: 28);
        self.nameLabel.frame = CGRect(x: 10*2, y: 20, width: self.view.width - 20*2, height: 34);
        self.oldPwdTextField.text = self.originalNickName
        self.oldPwdTextField.placeholder = "请输入新昵称(15字以内)"
        self.oldPwdTextField.font = UIFont.systemFont(ofSize: 16);
        self.oldPwdTextField.frame = CGRect(x: 10*2, y: nameLabel.bottom+20, width: self.view.width - 20*2, height: 34);
        self.oldPwdTextField.clearButtonMode = UITextField.ViewMode.whileEditing // 清除按钮模式
        self.oldPwdTextField.borderStyle = UITextField.BorderStyle.none // 边框样式
        self.oldPwdTextField.keyboardType = .emailAddress
        //设置placeholder的字体颜色
        self.oldPwdTextField.setValue(UIColor(hexString: "#999999"), forKeyPath: "placeholderLabel.textColor")
        self.oldPwdTextField.delegate = self // 关联代理
        self.oldPwdTextField.returnKeyType = UIReturnKeyType.done  // 键盘右下角按钮类型
        self.oldPwdTextField.keyboardType = UIKeyboardType.namePhonePad // 键盘类型
        
        self.lineTopImageView.frame = CGRect(x: 10*2, y:oldPwdTextField.bottom+20, width:self.view.width-20*2, height: 1)
        self.lineTopImageView.backgroundColor = UIColor(hexString: "#F2F2F2")
        
        self.sendButton.frame = CGRect(x: 10*2, y: lineTopImageView.bottom+20, width:self.view.width-20*2, height: 25*2)
        self.sendButton.layer.cornerRadius = 25
        self.sendButton.backgroundColor = UIColor(hexString: "#3574FA")
        self.sendButton.setTitle("保存", for: .normal)
        self.sendButton.setTitleColor(UIColor(hexString: "#FFFFFF"), for: .normal)
        self.sendButton.addTarget(self, action: #selector(didChangeName), for: .touchUpInside);
        
    }
    //MARK:-UITextFieldDelegate
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        debugPrint("修改昵称输入的字符:\(string)")
        debugPrint("修改昵称输入的range:\(range)")
        if string.isEmpty {
            return true
        }else{
            return (self.oldPwdTextField.text?.count)! < 15
        }
    }
    @objc func didChangeName()
    {
        if (self.oldPwdTextField.text == nil || self.oldPwdTextField.text!.isEmpty)
        {
            TBTHUD.showMessage(message: "请输入昵称")
            
            return
        }
        TBTHUD.showMessage(message: "正在修改")
        self.businsssModel.setName(name: self.oldPwdTextField.text!)
        self.businsssModel.startBeenRequest(successionHandler: { [weak self](response:StringHandy) in
           TBTHUD.showSuccessMessage(message: "修改成功")
            UserUtil.updateUserNickName(name: (self?.oldPwdTextField.text)!)
            if self!.didChangeNameBlock != nil{
                self?.didChangeNameBlock!((self?.oldPwdTextField.text!)!)
            }
            self?.navigationController?.popViewController(animated: true)
        }) {
             TBTHUD.dismiss()
        }

//        userInfoModel.nickName = NSData.aes256Encrypt(withPlainText:oldPwdTextField.text)
//        userInfoModel.userId = NSData.aes256Encrypt(withPlainText:LGP_Utils.userId!)
//        userInfoModel.load()
    }
    
    @objc private func popToLast(){
        self.navigationController?.popViewController(animated: true)
    }
}
