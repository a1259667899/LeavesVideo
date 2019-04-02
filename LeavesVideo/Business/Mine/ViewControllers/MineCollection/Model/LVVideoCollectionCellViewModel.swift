//
//  LVVideoCollectionCellViewModel.swift
//  LeavesVideo
//
//  Created by Sinder on 2018/11/5.
//  Copyright © 2018 Sinder. All rights reserved.
//

import Foundation
struct LVVideoCollectionCellViewModel {
    var coverImageSrc: String = ""
    var videoTitle: String = ""
    var videoId: String = ""
    var video: LVVideoListModel?
    init(videoItem: LVVideoListModel) {
        self.video = videoItem
    }
}
