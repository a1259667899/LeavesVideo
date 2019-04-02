//
//  LVVideoPlayViewController.swift
//  LeavesVideo
//
//  Created by Sinder on 2018/10/23.
//  Copyright © 2018 Sinder. All rights reserved.
//

import UIKit

class LVVideoPlayViewController: BaseViewController ,UITableViewDelegate,UITableViewDataSource{
    
//    private var fullScreenViewController:UIViewController?
    var currentVideo:LVVideoListModel = LVVideoListModel()
    private var videoSrc = "http://hc31.aipai.com/user/128/31977128/1006/card/44340096/card.mp4?l=f"
    var videoPalyerVC:HJVideoPlayerController?
    private var videoList:[LVVideoListModel] = []
    private lazy var videoListModel:LVVideoRecommandListModel = {
        let model = LVVideoRecommandListModel()
        return model
    }()
    private lazy var playPathModel:LVVideoPlayPathModel = {
        let model = LVVideoPlayPathModel()
        return model
    }()
    private lazy var tableView:UITableView = {
        let table = UITableView.init()
        table.delegate = self
        table.dataSource = self
        table.separatorStyle = .none
        table.estimatedRowHeight = 44.0
        table.rowHeight = UITableView.automaticDimension
        return table
    }()
    /**加载推荐视频列表*/
    private func loadListData(){
        self.videoListModel.getListRequest(successionHandler: {[weak self] (response:[LVVideoListModel], total) in
            self?.videoList = response
            self?.tableView.reloadSections([2], with: .none)
        }) {
            
        }
    }
    /**加载播放地址*/
    private func loadPlayPath(){
        self.playPathModel.videoId = self.currentVideo.videoId
        self.playPathModel.getBeenRequest(successionHandler: {[weak self] (response: LVVideoListModel) in
            self!.videoPalyerVC?.url = response.videoUrl
        }) {
            
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        loadListData()
        loadPlayPath()
    }
    override var prefersStatusBarHidden: Bool {
        return true
    }
    override func addSuViews() {
        let videoPlayer = HJVideoPlayerController.init(frame: CGRect(x: 0, y: is_iPhoneX ? 44 : 0, width: kScreenWidth, height: kScreenWidth * 9/16))
        self.view.addSubview((videoPlayer?.view)!)
        self.addChild(videoPlayer!)
        self.videoPalyerVC = videoPlayer
        
        self.videoPalyerVC?.videoTitle = self.currentVideo.videoTitle
        
        self.view.addSubview(self.tableView)
        self.tableView.snp.makeConstraints { (make) in
            make.edges.equalTo(UIEdgeInsets(top: kScreenWidth * 9/16 + (is_iPhoneX ? 44 : 0), left: 0, bottom: 0, right: 0))
        }
        tableView.registerCellWith(cellClazz: LVPlayIntroTableViewCell.self)
        tableView.registerCellWith(cellClazz: LVNormalTextTableViewCell.self)
        tableView.registerCellWith(cellClazz: LVRecommandVideoTableViewCell.self)
        TBTHUD.dismiss()
    }
    /**刷新页面*/
    private func refreshWithVideoItem(item: LVVideoListModel){
        self.currentVideo = item
        self.loadListData()
        self.loadPlayPath()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 2 ? self.videoList.count : 1
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = LVPlayIntroTableViewCell.cellWithTableView(tableView: tableView) as! LVPlayIntroTableViewCell
            cell.setVideoItem(item: self.currentVideo)
            return cell
        }else if indexPath.section == 1{
            let cell = LVNormalTextTableViewCell.cellWithTableView(tableView: tableView)
            return cell
        }else{
            let cell = LVRecommandVideoTableViewCell.cellWithTableView(tableView: tableView) as! LVRecommandVideoTableViewCell
            cell.setVideoItem(item: self.videoList[indexPath.row])
            return cell
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        TBTHUD.showLoading()
        self.refreshWithVideoItem(item: self.videoList[indexPath.row])
    }
    
//    @objc private func handleTapGesture(){
//        if self.playerView.transFormState == .small {
//            self.enterFullScreen()
//        }else if self.playerView.transFormState == .fullScreen{
//            self.exitFullScreen()
//        }
//    }
//    private func exitFullScreen(){
//        if self.playerView.transFormState != .fullScreen {
//            return
//        }else{
//            let appDelegate = UIApplication.shared.delegate as! AppDelegate
//            appDelegate.blockRotation = false
//            DeviceTool.interfaceOrientation(.portrait)
//            self.playerView.transFormState = .animating
//            self.fullScreenViewController?.dismiss(animated: true, completion: {
//                self.playerView.transFormState = .small
//            })
//        }
//
//    }
//    private func enterFullScreen(){
//        if self.playerView.transFormState != .small {
//            return
//        }
//        self.playerView.transFormState = .animating
//        self.playerView.originalFrame = self.playerView.frame
//        self.playerView.parentView = self.playerView.superview!
//
//        let fullscreenViewController = LVPresentedPlayViewController()
//        if #available(iOS 8.0, *) {
//            fullscreenViewController.modalPresentationStyle = .overFullScreen
//        }else{
//            fullscreenViewController.modalPresentationStyle = .custom
//        }
//
//        fullscreenViewController.transitioningDelegate = self
//        fullscreenViewController.modalPresentationCapturesStatusBarAppearance = true
//        self.present(fullscreenViewController, animated: true) {
//            self.playerView.transFormState = .fullScreen
//            self.fullScreenViewController = fullscreenViewController
//
//        }
//    }
//
//    //MARK:-UIViewControllerTransitioningDelegate
//    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
//        return ExitFullscreenTransition.init(showingView: self.playerView)
//
//    }
//    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
//        return EnterFullscreenTransition.init(showingView: self.playerView)
//    }
    
//    private func addObservers(){
//        UIDevice.current.beginGeneratingDeviceOrientationNotifications()
//        // 检测设备方向
//        NotificationCenter.default.addObserver(self, selector: #selector(deviceOrientationChange), name:  UIDevice.orientationDidChangeNotification, object: nil)
//    }
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        self.isRotation = !self.isRotation
//        self.navigationController?.navigationBar.isHidden = self.isRotation
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//        if self.isRotation {
//            appDelegate.blockRotation = true
//            DeviceTool.interfaceOrientation(.landscapeRight)
//
//        }else{
//            appDelegate.blockRotation = false
//            DeviceTool.interfaceOrientation(.portrait)
//        }
//    }
//    /// 设备方向改变
//    @objc private func deviceOrientationChange() {
//        // 获取当前设备方向
//        let orientation = UIDevice.current.orientation
//        debugPrint("当前设备方向:\(orientation.rawValue)")
//        switch orientation.rawValue {
//        case 1://竖屏
//
//            break
//        case 3://home键在右
//
//            break
//        case 4://home键在左
//
//            break
//        default:
//            break
//        }
//    }

}
