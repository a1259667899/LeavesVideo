//
//  LVMineCollectionTableViewDataController.swift
//  LeavesVideo
//
//  Created by Sinder on 2018/11/2.
//  Copyright © 2018 Sinder. All rights reserved.
//

import Foundation
import HandyJSON
class LVMineCollectionTableViewDataController{
    var collectionList:[LVVideoListModel] = []
    private var currentPage = 0
    private var pageSize = 20
    private var isLastPage = false
    private lazy var loadDataService:LVVideoCollectionService = {
        return LVVideoCollectionService()
    }()
    private lazy var cancleCollectionService: LVVideoCancleCollectModel = {
        return LVVideoCancleCollectModel()
    }()
    /**发起请求，请求收藏列表数据,下一页*/
    func requestNextPage(successCallBack: @escaping boolAttributeClouser, failCallBack:@escaping noneAttributeClosure){
        self.loadDataService.currentPage = currentPage + 1
        self.loadDataService.pageSize = pageSize
        self.loadDataService.startListRequest(successionHandler: {[weak self] (response:[LVVideoListModel], total) in
            self!.collectionList.append(contentsOf: response)
            self!.isLastPage = (self?.collectionList.count)! >= total
            successCallBack((self?.isLastPage)!)
        }) {
            failCallBack()
        }
    }
    /**请求第一页*/
    func requestFirstPage(successCallBack: @escaping noneAttributeClosure, failCallBack:@escaping noneAttributeClosure){
        self.loadDataService.currentPage = 1
        self.loadDataService.pageSize = pageSize
        self.loadDataService.startListRequest(successionHandler: {[weak self] (response:[LVVideoListModel], total) in
            self!.collectionList.removeAll()
            self!.collectionList.append(contentsOf: response)
            self!.isLastPage = (self?.collectionList.count)! >= total
            successCallBack()
        }) {
            failCallBack()
        }
    }
    /**取消收藏*/
    func cancleCollectionWith(ids:[String], successCallBack: @escaping noneAttributeClosure, failCallBack:@escaping noneAttributeClosure){
        self.cancleCollectionService.videoIds = ids
        self.cancleCollectionService.startBeenRequest(successionHandler: { (response: StringHandy) in
            successCallBack()
        }) {
            failCallBack()
        }
    }
}
