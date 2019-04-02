//
//  UIColor+HexColor.swift
//  RxXMLY
//
//  Created by sessionCh on 2017/12/14.
//  Copyright © 2017年 sessionCh. All rights reserved.
//

import UIKit

extension String {
    
    // MARK:- 获取字符串大小
    func getSize(fontSize: CGFloat) -> CGSize {
        let str = self as NSString
        
        let size = CGSize(width: UIScreen.main.bounds.width, height: CGFloat(MAXFLOAT))
        return str.boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: fontSize)], context: nil).size
    }
    
    // MARK:- 获取字符串大小
    func getSize(font: UIFont) -> CGSize {
        let str = self as NSString
        
        let size = CGSize(width: UIScreen.main.bounds.width, height: CGFloat(MAXFLOAT))
        return str.boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil).size
    }
    /**
     获取文本大小CGSize（固定宽度）
     */
    func getStringRect(font:UIFont,width:CGFloat) -> CGRect {
        let nsText: NSString = NSString( string: self )
        let size:CGSize = CGSize(width:width, height: 0)
        let options:NSStringDrawingOptions =  NSStringDrawingOptions.usesLineFragmentOrigin
        let boundRec = nsText.boundingRect(with: size, options: options, attributes: [NSAttributedString.Key.font: font], context: nil)
        return boundRec
    }
    
}
