//
//  Int64+formater.swift
//  LeavesVideo
//
//  Created by Sinder on 2018/10/22.
//  Copyright © 2018 Sinder. All rights reserved.
//

import UIKit

extension Int64 {

    /**将秒数转化为时分秒格式*/
    mutating func formatSeconds()->String{
        var formatString:String = ""
        let minutes:Int64 = self/60         //总分钟数
        let second:Int64 = self%60           //秒数
        //        let hours:Int64 = minutes/60            //小时数
        //        let minute:Int64 = minutes - hours * 60 //最终的分钟数<60
        //拼接
        if minutes != 0{
            if minutes < 10 {
                formatString.append("0")
            }
            formatString.append(String.init(minutes))
            formatString.append(":")
            if second < 10 {
                formatString.append("0")
            }
            formatString.append(String.init(second))
        }else {
            //不满10秒
            if second < 10 {
                formatString.append("00:0")
            }else{
                formatString.append("00:")
            }
            formatString.append(String.init(second))
        }
        return formatString
    }
    /**
     播放次数显示规则：
     1. 百位以内的播放次数都正常全部位数显示，最小值是1，最大值是999，为0时，不显示。
     2. 千位至万位的播放次数显示XXX.Xk，最小值是1.0K，最大值是19.9K。
     3. 十万位至千万位的播放次数显示XXX.Xw，最小值是10.0w，最大值是9999.9w。
     4. 过亿位后，播放次数显示XXX.X亿，最小值1.0 亿，
     */
    mutating func formatUnit()->String{
        let number:Float = Float.init(self)
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
            return String(self)
        }
    }

}
