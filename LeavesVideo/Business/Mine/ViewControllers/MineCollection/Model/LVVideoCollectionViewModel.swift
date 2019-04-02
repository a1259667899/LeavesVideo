//
//  LVVideoCollectionViewModel.swift
//  LeavesVideo
//
//  Created by Sinder on 2018/11/2.
//  Copyright © 2018 Sinder. All rights reserved.
//

import Foundation
class LVVideoCollectionViewModel {
    private lazy var dataController: LVMineCollectionTableViewDataController = {
        return LVMineCollectionTableViewDataController()
    }()
    private lazy var tableView: UITableView = {
        return UITableView.init()
    }()
    var videos: [LVMineCollectionCellViewModel] = []
    /**请求下一页数据*/
    func loadNextPage(successHandler:@escaping ([LVMineCollectionCellViewModel], _ islast: Bool)-> Void,failHandler:@escaping noneAttributeClosure){
        self.dataController.requestNextPage(successCallBack: { [weak self] (isLast)in
            let videos = (self?.dataController.collectionList)!.compactMap({ (videoItem) -> LVMineCollectionCellViewModel? in
                let viewModel = LVMineCollectionCellViewModel().viewModelWithVideoModel(videoModel: videoItem)
                return viewModel
            })
            self?.videos.append(contentsOf: videos)
            successHandler((self?.videos)!, isLast)
        }) {
            failHandler()
        }
    }
    /**请求第一页数据*/
    func loadFirstPage(successHandler:@escaping ([LVMineCollectionCellViewModel])-> Void,failHandler:@escaping noneAttributeClosure){
        self.dataController.requestFirstPage(successCallBack: {[weak self] in
            self?.videos = (self?.dataController.collectionList)!.compactMap({ (videoItem) -> LVMineCollectionCellViewModel? in
                let viewModel = LVMineCollectionCellViewModel().viewModelWithVideoModel(videoModel: videoItem)
                return viewModel
            })
            successHandler((self?.videos)!)
        }) {
            failHandler()
        }
    }
    /**取消收藏*/
    func cancleCollectionsWithVideos(videos: [LVVideoListModel], successHandler:@escaping noneAttributeClosure,failHandler:@escaping noneAttributeClosure){
        var arr:[String] = []
        videos.forEach({ (item) in
            arr.append(item.videoId)
        })
        self.dataController.cancleCollectionWith(ids: arr, successCallBack: {
            successHandler()
        }) {
            failHandler()
        }
    }
}

