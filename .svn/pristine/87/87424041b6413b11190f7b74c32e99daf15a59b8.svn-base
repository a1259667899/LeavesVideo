//
//  LVMineCollectionCellViewModel.swift
//  LeavesVideo
//
//  Created by Sinder on 2018/11/5.
//  Copyright © 2018 Sinder. All rights reserved.
//

import Foundation
class LVMineCollectionCellViewModel {
    var title = ""
    var coverImageSrc = ""
    var videoId = ""
    var videoSrc = ""
    var videoItem:LVVideoListModel?
    /**将model转换为viewModel*/
    func viewModelWithVideoModel(videoModel: LVVideoListModel)-> LVMineCollectionCellViewModel{
        self.videoItem = videoModel
        self.title = videoModel.videoTitle
        self.videoId = videoModel.videoId
        self.coverImageSrc = videoModel.videoIcon
        self.videoSrc = videoModel.videoUrl
        return self
    }
}
