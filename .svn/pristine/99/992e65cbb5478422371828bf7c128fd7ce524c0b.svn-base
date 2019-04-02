//
//  LVHomeNetworokService.swift
//  LeavesVideo
//
//  Created by Sinder on 2018/11/12.
//  Copyright © 2018 Sinder. All rights reserved.
//

import Foundation
/**视频详情*/
class LVVideoDetailService: BaseNetworkService,GetBeenNetworkProtocol{
    var videoId = ""
    override func setRequestUrl() -> String {
        return "video/detail"
    }
    override func setRequestBody() -> [String : Any] {
        return ["videoId": videoId]
    }
}
/**获取bannerList*/
class LVHomeBannerService : BaseNetworkService,GetListNetworkProtocol{
    override func setRequestUrl() -> String {
        return "banner/list"
    }
    override func setRequestBody() -> [String : Any] {
        return [:]
    }
}

/**获取推荐电影*/
class LVHomeMovieService: BaseNetworkService , GetListNetworkProtocol{
    override func setRequestUrl() -> String {
        return "video/spread"
    }
    override func setRequestBody() -> [String : Any] {
        return [:]
    }
}

/**获取推荐剧集*/
class LVHomeEpisodeService: BaseNetworkService , GetListNetworkProtocol{
    override func setRequestUrl() -> String {
        return ""
    }
    override func setRequestBody() -> [String : Any] {
        return [:]
    }
}
