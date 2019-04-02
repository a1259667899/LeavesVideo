//
//  DownloadManager.swift
//  BoardCast-swift
//
//  Created by admin on 2017/12/13.
//  Copyright © 2017年 admin. All rights reserved.
//

import UIKit

class DownloadManagerYC: NSObject {
    /**
     单例
     */
    static let shared = DownloadManagerYC.init()
    fileprivate override init() {
        super.init()
       
    }
    /**
     开启单个下载任务
     */
    func startDownLoadTask(video:LVVideoListModel){
        var downloadItem : YCDownloadItem?
        if !video.videoId.isEmpty {
            downloadItem = YCDownloadManager.item(withFileId: video.videoId)
        }else if !video.videoUrl.isEmpty{
            downloadItem = (YCDownloadManager.items(withDownloadUrl: video.videoUrl).first as! YCDownloadItem)
        }
        if downloadItem == nil {
            downloadItem = YCDownloadItem.init(url: video.videoUrl, fileId: video.videoId)
            let v = video
            downloadItem?.extraData = v.dataWithModel()
            YCDownloadManager.startDownload(with: downloadItem!)
        }
    }
}
