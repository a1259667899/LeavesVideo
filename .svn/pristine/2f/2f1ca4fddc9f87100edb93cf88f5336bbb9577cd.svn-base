//
//  Int+Formater.swift
//  Investment
//
//  Created by Sinder on 2018/10/8.
//  Copyright © 2018 方加会. All rights reserved.
//

import Foundation
extension Int{
    //显示样式和输出样式
    public enum Style : UInt {
        
        case none //1234567.89
        
        case decimal //1,234,567.89
        
        case currency //￥1,234,567.89
        
        case percent //123,456,789%
        
        case scientific //1.23456789E6
        
        case spellOut //一百二十三万四千五百六十七点八九
        
        @available(iOS 9.0, *)
        case ordinal //第123,4568
        
        @available(iOS 9.0, *)
        case currencyISOCode //CNY1,234,567.89
        
        @available(iOS 9.0, *)
        case currencyPlural//1,234,567.89人民币
        
        @available(iOS 9.0, *)
        case currencyAccounting//￥1,234,567.89
    }
    func formatByComma()->String{
        //初始化NumberFormatter
        let format = NumberFormatter()
        //设置numberStyle（有多种格式）
        format.numberStyle = .decimal
        //转换后的string
        let string = format.string(from: NSNumber(value: self))
        //打印
        debugPrint(string!)
        return string ?? "0"
    }
    
}
