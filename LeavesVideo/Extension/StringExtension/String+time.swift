//
//  String+time.swift
//  Investment
//
//  Created by XD on 2018/9/25.
//  Copyright © 2018 方加会. All rights reserved.
//

import Foundation
extension String{
    /**
     时间戳转时间字符串
     */
    func getDateStringFromTimestamp(timestamp:String)-> String{
        if self.isEmpty{
            return ""
        }
        let dateFormater = DateFormatter.init()
        dateFormater.dateFormat = timestamp
        let date = Date.init(timeIntervalSince1970: Double(self)!/1000.0)
        let timeString = dateFormater.string(from: date)
        return timeString
    }
    /**
     将2018-01-01 12:12:12形式的字符串格式化为 周一 1.1 12:12 之类的字符串
     */
    func getWeekDayString()->String{
        let dateFormater = DateFormatter.init()
        dateFormater.dateFormat = "yyyy-MM-dd HH:mm"
        let time = dateFormater.date(from: self)
        if time == nil{
            return self
        }
        let anotherFormater = DateFormatter.init()
        anotherFormater.dateFormat = "MM.dd HH:mm"
        let timeString = anotherFormater.string(from: time!)
        
        let weekDays = ["周日","周一","周二","周三","周四","周五","周六"]
        let timeInterval:TimeInterval = time!.timeIntervalSince1970
        let days = Int(timeInterval/86400)
        let weekday = ((days + 4)%7+7)%7
        return weekDays[weekday] + " " + timeString
    }
    
    /**
     将2018-01-01 12:12:12形式的字符串格式化为 3天前 之类的字符串
     */
    //MARK: 根据规则返回对应的字符串
    func getTimeString() -> String {
        if isToday {
            if minute < 5 {
                return "刚刚"
            } else if hour < 1 {
                return "\(minute)分钟之前"
            } else {
                return "\(hour)小时之前"
            }
        } else if isYesterday {
            return "昨天 \(self.yesterdayTimeStr())"
        } else if isYear {
            return noYesterdayTimeStr()
        } else {
            return yearTimeStr()
        }
    }
    
    fileprivate var selfDate : Date {
        let formater = DateFormatter()
        formater.dateFormat = "yyyy-MM-dd HH:mm:ss"
        //得到时间戳
        let date = formater.date(from: self)
        if date != nil{
            return date!
        }else{
            return Date.init()
        }
        //        let timeInterval = date?.timeIntervalSince1970
    }
    
    /// 距当前有几分钟
    var minute : Int {
        let dateComponent = Calendar.current.dateComponents([.minute], from: selfDate, to: Date())
        return dateComponent.minute!
    }
    
    /// 距当前有几小时
    var hour : Int {
        let dateComponent = Calendar.current.dateComponents([.hour], from: selfDate, to: Date())
        return dateComponent.hour!
    }
    
    /// 是否是今天
    var isToday : Bool {
        return Calendar.current.isDateInToday(selfDate)
    }
    
    /// 是否是昨天
    var isYesterday : Bool {
        return Calendar.current.isDateInYesterday(selfDate)
    }
    
    /// 是否是今年
    var isYear: Bool {
        let nowComponent = Calendar.current.dateComponents([.year], from: Date())
        let component = Calendar.current.dateComponents([.year], from: selfDate)
        return (nowComponent.year == component.year)
    }
    
    func yesterdayTimeStr() -> String {
        let format = DateFormatter()
        format.dateFormat = "HH:mm"
        return format.string(from: selfDate)
    }
    
    func noYesterdayTimeStr() -> String {
        let format = DateFormatter()
        format.dateFormat = "MM-dd HH:mm"
        return format.string(from: selfDate)
    }
    func yearTimeStr() -> String {
        let format = DateFormatter()
        format.dateFormat = "yyyy-MM-dd HH:mm"
        return format.string(from: selfDate)
    }
}
