//
//  ViewController.swift
//  LeavesVideo
//
//  Created by Sinder on 2018/10/17.
//  Copyright © 2018 Sinder. All rights reserved.
//

import UIKit
import PullToRefreshKit
class LVHomeViewController: BaseViewController ,UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    private lazy var headerTitles:[String] = {
        return ["","推荐电影","推荐剧集"]
    }()
    private lazy var viewModel: LVHomeViewControllerViewModel = {
        let model = LVHomeViewControllerViewModel.init()
        return model
    }()
    private lazy var videoDetail:LVVideoDetailService = {
        return LVVideoDetailService()
    }()
    private var bannerList:[LVHomeBannerModel] = []
    private var movieList:[LVVideoListModel] = []
    private var episodeList:[LVHomeEpisodeModel] = []
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout.init()
        let collection = UICollectionView.init(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: self.view.height), collectionViewLayout: layout)
        collection.delegate = self
        collection.dataSource = self
        collection.backgroundColor = UIColor.white
        collection.showsVerticalScrollIndicator = false
        return collection
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        self.addSubViews()
        self.addUglyBoard()
        self.collectionView.configRefreshHeader(container: self) {[weak self] in
            self!.loadData()
        }
        TBTHUD.showLoading()
        self.loadData()
        LVADUtil.showHomeAlertAD()
    }
    //添加顶部的遮丑板
    private func addUglyBoard(){
        let view = UIView.init(frame: CGRect.init(x: 0, y: 0, width: kScreenWidth, height: is_iPhoneX ? 44 : 20))
        view.backgroundColor = UIColor.white
        self.view.addSubview(view)
    }
    func addSubViews() {
        self.view.addSubview(self.collectionView)
        self.collectionView.registerCellWith(cellClazz: LVHomeBannerCollectionViewCell.self)
        self.collectionView.registerCellWith(cellClazz: LVHomeMovieCollectionViewCell.self)
        self.collectionView.registerCellWith(cellClazz: LVHomeEpisodeCollectionViewCell.self)
        self.collectionView.register(LVNormalCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "header")
    }
    private func loadData(){
        self.viewModel.loadData {[weak self] in
            self!.bannerList = self!.viewModel.bannerItems
            self!.movieList = self!.viewModel.movieItems
            self!.episodeList = self!.viewModel.episodeItems
            self?.collectionView.reloadData()
            self?.collectionView.switchRefreshHeader(to: .normal(.success, 0.3))
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 4
        case 2:
            return 6
        default:
            break
        }
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell1: UICollectionViewCell = UICollectionViewCell.init()
        switch indexPath.section {
        case 0:
            let cell: LVHomeBannerCollectionViewCell = collectionView.dequeueCell(with: LVHomeBannerCollectionViewCell.self, indexPath: indexPath) as! LVHomeBannerCollectionViewCell
            cell.setDatas(datas: self.bannerList)
            cell.bannerSelectAtIndex = {[weak self](index) in
                //请求视频详情
                self?.jumpViewControllerWithItem(item: (self?.bannerList[index])!)
            }
            return cell
        case 1:
            let cell = collectionView.dequeueCell(with: LVHomeMovieCollectionViewCell.self, indexPath: indexPath) as! LVHomeMovieCollectionViewCell
            return cell
        case 2:
            let cell = collectionView.dequeueCell(with: LVHomeEpisodeCollectionViewCell.self, indexPath: indexPath) as! LVHomeEpisodeCollectionViewCell
            return cell
        default:
            break
        }
        
        return cell1
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 {
            return CGSize(width: kScreenWidth, height: 174 * kWidthMultiper)
        }else if indexPath.section == 1{
            return CGSize(width: (kScreenWidth - 12) / 2, height: (kScreenWidth - 12) / 2 * 148 / 180)
        }else{
            return CGSize(width: (kScreenWidth - 20) / 3, height: (kScreenWidth - 20) / 3 * 210 / 120)
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 4
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if section == 0 {
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }else{
            return UIEdgeInsets(top: 0, left: 4, bottom: 4, right: 4)
        }
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        var reusableview:UICollectionReusableView = UICollectionReusableView.init()
        if kind == UICollectionView.elementKindSectionHeader {
            let header:LVNormalCollectionReusableView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "header", for: indexPath) as! LVNormalCollectionReusableView
            header.setTitle(title: headerTitles[indexPath.section])
            header.setSubTile(title: "更多")
            header.subButtonHandler = {
                debugPrint("点击了更多")
            }
            reusableview = header
        }
        return reusableview
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 0 {
            return CGSize.zero
        }else{
            return CGSize(width: kScreenWidth, height: 45)
        }
    }
}
extension LVHomeViewController{
    func jumpViewControllerWithItem(item: LVHomeBannerModel){
        switch item.bannerType {
        case 2:
            videoDetail.videoId = item.bannerPath
            TBTHUD.showLoading()
            //请求视频详情
            videoDetail.getBeenRequest(successionHandler: {[weak self] (response: LVVideoListModel) in
                let vc = LVVideoPlayViewController()
                vc.currentVideo = response
                vc.hidesBottomBarWhenPushed = true
                self?.navigationController?.pushViewController(vc, animated: true)
            }) {
                
            }
            break;
        case 3:
            let vc = WKWebViewViewController()
            vc.url = item.bannerPath
            vc.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(vc, animated: true)
            break
        default:
            break
        }
    }
}
