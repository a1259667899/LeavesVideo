//
//  String+range.swift
//  MeidaShare
//
//  Created by 方加会 on 2018/3/31.
//  Copyright © 2018年 萝卜. All rights reserved.
//

import UIKit
extension String {
    //返回第一次出现的指定子字符串在此字符串中的索引
    //（如果backwards参数设置为true，则返回最后出现的位置）
    func positionOf(sub:String, backwards:Bool = false)->Int {
        var pos = -1
        if let range = range(of:sub, options: backwards ? .backwards : .literal ) {
            if !range.isEmpty {
                pos = self.distance(from:startIndex, to:range.lowerBound)
            }
        }
        return pos
    }
    /**
    计算指定宽度和字体下，当前文字内容的高度
     */
    func caculateHeight(font:UIFont,width:CGFloat)->CGFloat{
        let pa:NSString = self as NSString
        let size = pa.boundingRect(with: CGSize.init(width: width, height: 100), options: [.usesLineFragmentOrigin,.usesFontLeading], attributes: [NSAttributedString.Key.font:font], context: nil)
        debugPrint("计算出来的label高度:\(size.height)")
        return size.height
    }
    /**
     根据语言区域本地化字符串
     */
    func localized()->String{
        if let path = Bundle.main.path(forResource: UserDefaults.standard.value(forKey: "appLanguage") as? String, ofType: "lproj") {
            if let bundle = Bundle.init(path: path){
                return bundle.localizedString(forKey: self, value: nil, table: "Language")
            }else{
                return self
            }
        }else{
            return self
        }
    }
    /**
     播放次数显示规则：
     1. 百位以内的播放次数都正常全部位数显示，最小值是1，最大值是999，为0时，不显示。
     2. 千位至万位的播放次数显示XXX.Xk，最小值是1.0K，最大值是19.9K。
     3. 十万位至千万位的播放次数显示XXX.Xw，最小值是10.0w，最大值是9999.9w。
     4. 过亿位后，播放次数显示XXX.X亿，最小值1.0 亿，
     */
    mutating func formatUnit()->String{
        if self == "" {
            self = "0"
        }
        let number:Float = Float.init(self)!
        //如果大于999小于10w，就除以1000保留一位小数
        if  number > 999 && number < 99999{//小于10万，以k为单位
            let count = number/1000.0
            return String(format:"%.1fk",count)
        }else if number > 99999 && number < 100000000{//小于1亿，以万为单位
            let count = number/10000.0
            return String(format:"%.1fw",count)
        }else if number > 99999999{ //大于1亿，以亿为单位
            let count = number/100000000.0
            return String(format:"%.1f亿",count)
        }else {
            return self
        }
    }

}
