//
//  LVVideolistModel.swift
//  LeavesVideo
//
//  Created by Sinder on 2018/10/25.
//  Copyright © 2018 Sinder. All rights reserved.
//
import Foundation
class LVVideoRecommandListModel:BaseNetworkService,GetListNetworkProtocol {
    override func setRequestUrl() -> String {
        return "video/spread"
    }
    override func setRequestBody() -> [String : Any] {
        return [:]
    }
}
class LVVideoByCatListModel: BaseNetworkService,GetListNetworkProtocol,PostListNetworkProtocol{
    var currentPage = 1
    var pageSize = 20
    
    var catId: String = ""
    override func setRequestUrl() -> String {
        return "video/cat"
    }
    override func setRequestBody() -> [String : Any] {
        return ["catId": catId, "currentPage": currentPage, "pageSize": pageSize]
    }
}
class LVVideoAddCollectModel: BaseNetworkService,GetBeenNetworkProtocol{
    var videoId = ""
    override func setRequestUrl() -> String {
        return "user/addCollect"
    }
    override func setRequestBody() -> [String : Any] {
        return ["videoId": videoId]
    }
    
}
class LVVideoCancleCollectModel: BaseNetworkService ,PostBeenNetworkProtocol{
    
    var videoIds:[String] = []
    
    override func setRequestUrl() -> String {
        return "user/cancelCollect"
    }
    override func setRequestBody() -> [String : Any] {
        return ["videoIds": videoIds]
    }
}

/**请求播放地址*/
class LVVideoPlayPathModel: BaseNetworkService,GetBeenNetworkProtocol{
    
    var videoId = ""

    override func setRequestUrl() -> String {
        return "video/play"
    }
    override func setRequestBody() -> [String : Any] {
        return ["videoId": videoId]
    }
}
/**请求下载地址*/
class LVVideoDownloadPathModel: BaseNetworkService, GetBeenNetworkProtocol{
    var videoId = ""
    
    override func setRequestUrl() -> String {
        return "video/download"
    }
    override func setRequestBody() -> [String : Any] {
        return ["videoId": videoId]
    }
}
