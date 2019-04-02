//
//  LVRegisterModel.swift
//  LeavesVideo
//
//  Created by Sinder on 2018/10/18.
//  Copyright © 2018 Sinder. All rights reserved.
//

import UIKit
/**
 注册model
 */
class LVRegisterModel: BaseNetworkService,PostBeenNetworkProtocol{
    var email = ""
    var password = ""
    var code = ""
    var inviteCode = ""
    
    override func setRequestUrl() -> String {
        return "user/register"
    }
    override func setRequestBody() -> [String : Any] {
        return ["email":email,"password":password,"code":code,"inviteCode":inviteCode]
    }
}
/**
 忘记密码获取验证码model
 */
class LVForgetPwdCodeModel: BaseNetworkService,GetBeenNetworkProtocol {
    //手机号码
    var email = ""
    
    
    override func setRequestUrl() -> String {
        return "user/sendCode"
    }
    override func setRequestBody() -> [String : Any] {
        return ["email":email,"type":2]
    }
}
/**
 注册验证码model
 */
class LVRegisterCodeModel: BaseNetworkService,GetBeenNetworkProtocol {
    //手机号码
    var email = ""
    override func setRequestUrl() -> String {
        return "user/sendCode"
    }
    override func setRequestBody() -> [String : Any] {
        return ["email":email , "type":1]
    }
}
/**
 用验证码重置密码model
 */
class LVResetPwdModel:BaseNetworkService,PostBeenNetworkProtocol{
    var code = ""
    var email = ""
    var password = ""
    
    override func setRequestUrl() -> String {
        return "user/resetPassword"
    }
    override func setRequestBody() -> [String : Any] {
        return ["email":email,"password":password,"code":code]
    }
}
/**
 用旧密码重置密码model
 */
class LVUpdatePwdModel: BaseNetworkService,PostBeenNetworkProtocol {
    var token = ""
    var oldPassword = ""
    var password = ""
    var checkPassword = ""
    
   
    override func setRequestUrl() -> String {
        return "user/updatePassword"
    }
    override func setRequestBody() -> [String : Any] {
        return ["oldPassword":oldPassword,"password":password,"checkPassword":checkPassword]
    }
}
