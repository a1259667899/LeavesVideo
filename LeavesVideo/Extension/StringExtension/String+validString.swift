//
//  String+validString.swift
//  Investment
//
//  Created by XD on 2018/9/25.
//  Copyright © 2018 方加会. All rights reserved.
//

import Foundation
extension String{
    /**
     判断是否是正确的身份证号
     */
    func validateIDCardNumber()->Bool{
        let emailRegex = "(^[0-9]{15}$)|([0-9]{17}([0-9]|[0-9a-zA-Z])$)"
        let emailTest:NSPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailTest.evaluate(with: self)
    }
    /**
     判断是或否是争正确的邮箱
     */
    func validateEmail() -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let emailTest:NSPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailTest.evaluate(with: self)
    }
    /**
     判断是否是正确的手机号
     */
    func validatePhoneNumber() -> Bool {
        let emailRegex = "^1((3[0-9]|4[57]|5[0-35-9]|7[0678]|8[0-9])\\d{8}$)"
        let emailTest:NSPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailTest.evaluate(with: self)
    }
    /**
     判断是否是符合格式的密码,不能使是汉字
     */
    func validatePassWord() -> Bool {
        let regex = "[\u{4e00}-\u{9fa5}]+"
        let pwdTest : NSPredicate = NSPredicate(format: "SELF MATCHES %@", regex)
        return !pwdTest.evaluate(with:self)
    }
    /**
     验证URL
     */
    func checkURL() -> Bool {
        let regex = "http(s)?:\\/\\/([\\w-]+\\.)+[\\w-]+(\\/[\\w- .\\/?%&=]*)?";
        let pred = NSPredicate(format: "SELF MATCHES %@",regex)
        return pred.evaluate(with:self)
    }
    /**
     url转码
     */
    func UrlTrans() -> String{
        return self.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
    }
    //只能为中文
    func onlyInputChineseCharacters() -> Bool {
        let inputString = "[\u{4e00}-\u{9fa5}]+"
        let predicate = NSPredicate(format: "SELF MATCHES %@", inputString)
        let Chinese = predicate.evaluate(with: self)
        return Chinese
    }
    
    //只能为数字
    func onlyInputTheNumber() -> Bool {
        let numString = "[0-9]*"
        let predicate = NSPredicate(format: "SELF MATCHES %@", numString)
        let number = predicate.evaluate(with: self)
        return number
    }
    //只能为小写
    func onlyInputLowercaseLetter() -> Bool {
        let regex = "[a-z]*"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
        let letter = predicate.evaluate(with: self)
        return letter
    }
    //只能为大写
    func onlyInputACapital() -> Bool {
        let regex = "[A-Z]*"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
        let capital = predicate.evaluate(with: self)
        return capital
        
    }
    
    //允许大小写
    func inputCapitalAndLowercaseLetter() -> Bool {
        let regex = "[a-zA-Z]*"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
        let inputString = predicate.evaluate(with: self)
        return inputString
    }
    //允许大小写或数字(不限字数)
    func inputLettersOrNumbers() -> Bool {
        let regex = "[a-zA-Z0-9]*"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
        let inputString = predicate.evaluate(with: self)
        return inputString
        
    }
    
    //允许大小写或数字(限字数)
    func inputNumberOrLetters() -> Bool {
        let userNameRegex = "^[A-Za-z0-9]{6,20}+$"
        let userNamePredicate = NSPredicate(format: "SELF MATCHES %@", userNameRegex)
        let inputString = userNamePredicate.evaluate(with: self)
        return inputString
    }
    
    //允许汉字，大小写或数字(限字数)
    func inputChineseOrLettersNumberslimit() -> Bool {
        let regex = "[\u{4e00}-\u{9fa5}]+[A-Za-z0-9]{6,20}+$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
        let inputString = predicate.evaluate(with: self)
        return inputString
    }
    
    
    //允许汉字或数字(不限字数)
    func inputChineseOrNumbers() -> Bool {
        let regex = "[\u{4e00}-\u{9fa5}]+[0-9]*"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
        let inputString = predicate.evaluate(with: self)
        return inputString
    }
    //允许汉字或数字(限字数)
    func inputChineseOrNumbersLimit() -> Bool {
        let regex = "[\u{4e00}-\u{9fa5}][0-9]{6,20}+$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
        let inputString = predicate.evaluate(with: self)
        return inputString
    }
    //允许汉字，大小写或数字(不限字数)
    func inputChineseOrLettersAndNumbersNum() -> Bool {
        let regex = "[\u{4e00}-\u{9fa5}]+[A-Za-z0-9]*"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
        let inputString = predicate.evaluate(with: self)
        return inputString
    }
}
