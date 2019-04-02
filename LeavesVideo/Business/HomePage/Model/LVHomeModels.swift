//
//  LVHomeBannerModel.swift
//  LeavesVideo
//
//  Created by Sinder on 2018/10/22.
//  Copyright © 2018 Sinder. All rights reserved.
//

import Foundation
import HandyJSON
struct LVHomeBannerModel: HandyJSON{
    var bannerId = ""
    var bannerIcon = ""
    /**为2，跳转视频播放页*/
    var bannerType = 2
    /**bannerType = 2,该字段是视频id*/
    var bannerPath = ""
    var startTime = ""
    var endTime = ""
    var updateTime = ""
}
class LVVideoListModel:NSObject,HandyJSON {
    var duration = 0
    var collectNum = ""
    var playNum = ""
    var videoIcon = ""
    var videoId = "12"
    var videoTitle = ""
    var videoUrl = ""
    var isCollect = false
    required override init() {
        
    }
    func dataWithModel()->Data{
        let json = self.toJSONString()
        return (json?.data(using: .utf8))!
    }
    class func modelWithData(data:Data)-> LVVideoListModel{
        let json = String.init(data: data, encoding: .utf8)
        return LVVideoListModel.deserialize(from: json)!
    }
}

/**电影*/
struct LVHomeMovieModel: HandyJSON {
    
}

/**电视剧集*/
struct LVHomeEpisodeModel: HandyJSON {
    
}

