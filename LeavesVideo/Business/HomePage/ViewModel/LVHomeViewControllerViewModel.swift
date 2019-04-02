//
//  LVHomeViewControllerViewModel.swift
//  LeavesVideo
//
//  Created by Sinder on 2018/11/7.
//  Copyright © 2018 Sinder. All rights reserved.
//

import UIKit

class LVHomeViewControllerViewModel {
    private(set) lazy var bannerItems:[LVHomeBannerModel] = {return []}()
    private(set) lazy var movieItems:[LVVideoListModel] = {return []}()
    private(set) lazy var episodeItems:[LVHomeEpisodeModel] = {return []}()
    private lazy var bannerSerVice: LVHomeBannerService = {
        return LVHomeBannerService.init()
    }()
    private lazy var movieService: LVHomeMovieService = {
        return LVHomeMovieService.init()
    }()
    private lazy var episodeService: LVHomeEpisodeService = {
        return LVHomeEpisodeService.init()
    }()
    func loadData(with successHandler:@escaping noneAttributeClosure){
        let group = DispatchGroup.init()
        group.enter()
        DispatchQueue.global().async(group: group, qos: .default, flags: []) {
            self.loadBanner(successHandler: {[weak self] (response) in
                self?.bannerItems = response
                group.leave()
                }, failHandler: {
                    group.leave()
            })
        }
        group.enter()
        DispatchQueue.global().async(group: group, qos: .default, flags: []) {
            self.loadRecommandVideos(successHandler: { [weak self](response) in
                self?.movieItems = response
                group.leave()
                }, failHandler: {
                    group.leave()
            })
        }
        group.enter()
        DispatchQueue.global().async(group: group, qos: .default, flags: []) {
            self.loadHotVideos(successHandler: { [weak self](response) in
                group.leave()
                }, failHandler: {
                    group.leave()
            })
        }
        group.notify(queue: DispatchQueue.main) {
            successHandler()
        }
    }
    /**请求banner数据*/
    private func loadBanner(successHandler:@escaping ([LVHomeBannerModel])-> Void, failHandler:@escaping noneAttributeClosure){
        self.bannerSerVice.getListRequest(successionHandler: { (response: [LVHomeBannerModel], total) in
            successHandler(response)
        }) {
            failHandler()
        }
    }
    /**请求推荐电影*/
    private func loadRecommandVideos(successHandler:@escaping ([LVVideoListModel])-> Void, failHandler:@escaping noneAttributeClosure){
        self.movieService.getListRequest(successionHandler: { (response: [LVVideoListModel], total) in
            successHandler(response)
           
        }) {
            failHandler()
        }
    }
    /**请求热荐剧集*/
    private func loadHotVideos(successHandler:@escaping ([LVHomeEpisodeModel])-> Void, failHandler:@escaping noneAttributeClosure){
        successHandler([])
//        self.episodeService.getListRequest(successionHandler: { (response: [LVHomeEpisodeModel], total) in
//            self.episodeItems = response
//            successHandler(response)
//        }) {
//            failHandler()
//        }
    }
}
