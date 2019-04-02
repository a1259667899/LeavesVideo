//
//  TimeRelationProtocol.swift
//  Investment
//
//  Created by XD on 2018/9/26.
//  Copyright © 2018 方加会. All rights reserved.
//

import Foundation
enum TimePosition: Int {
    case beforeSection    = 0
    case betweenSection
    case afterSection
}
protocol TimeRelationProtocol {
    /**
     判断某个时间点是否在某一个时间段之内，都是时间戳来判断，endTime为空则只判断两个时间点的关系
     */
    func adjustTimeRelationBetween(time: String ,startTime: String ,endTime: String)-> TimePosition
}
extension TimeRelationProtocol{
    func adjustTimeRelationBetween(time: String ,startTime: String ,endTime: String)-> TimePosition{
        
        let timeDate = Date.init(timeIntervalSince1970: Double(time)!)
        if startTime.isEmpty || startTime == "<null>"{
            return .beforeSection
        }
        let startDate = Date.init(timeIntervalSince1970: Double(startTime)!/1000)
        if endTime.isEmpty{//endTime为空则只判断两个时间点的关系
            if timeDate.compare(startDate) == .orderedDescending{
                return .afterSection
            }else{
                return .beforeSection
            }
        }
        let endDate = Date.init(timeIntervalSince1970: Double(endTime)!/1000)
        if timeDate.compare(startDate) == .orderedDescending && timeDate.compare(endDate) == .orderedAscending {
            return .betweenSection
        }else if timeDate.compare(startDate) == .orderedAscending{
            return .beforeSection
        }else {
            return .afterSection
        }
    }
}
