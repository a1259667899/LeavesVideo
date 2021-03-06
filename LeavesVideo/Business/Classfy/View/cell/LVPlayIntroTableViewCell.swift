//
//  LVPlayIntroTableViewCell.swift
//  LeavesVideo
//
//  Created by Sinder on 2018/10/24.
//  Copyright © 2018 Sinder. All rights reserved.
//

import UIKit

class LVPlayIntroTableViewCell: UITableViewCell {
    var collectButtonClickedBlock:noneAttributeClosure?
    var downloadButtonClickedBlock:noneAttributeClosure?
    private lazy var videoDetailModel:LVVideoDetailService = {
        let model = LVVideoDetailService()
        return model
    }()
    private var currentVideoItem: LVVideoListModel?
    private lazy var doCollectModel:LVVideoAddCollectModel = {
        let model = LVVideoAddCollectModel()
        return model
    }()
    private lazy var cancleCollectModel:LVVideoCancleCollectModel = {
        let model = LVVideoCancleCollectModel()
        return model
    }()
    private lazy var downLoadPathModel:LVVideoDownloadPathModel = {
        let model = LVVideoDownloadPathModel()
        return model
    }()
    
    private lazy var titleLable:UILabel = {
        let lab = UILabel.init()
        lab.font = XDFont.pingFangSCSemibold.ofSize(size: 16.0)
        lab.textColor = textBlackColor
        lab.numberOfLines = 0
        lab.sizeToFit()
        lab.text = "大爷，您幸福吗？"
        return lab
    }()
    private lazy var subTitleLable:UILabel = {
        let lab = UILabel.init()
        lab.font = XDFont.pingFangSCRegular.ofSize(size: 14.0)
        lab.textColor = textLightGrayColor
        lab.text = "200万次播放"
        return lab
    }()
    private lazy var collectButton:ExtendButton = {
        let button = ExtendButton()
        button.setBackgroundImage(UIImage(named: "play_collect_normal"), for: .normal)
        button.setBackgroundImage(UIImage(named: "play_collect_selected"), for: .selected)
        button.addTarget(self, action: #selector(collectionButtonClicked), for: .touchUpInside)
        return button
    }()
    private lazy var downloadButton:ExtendButton = {
        let button = ExtendButton()
        button.setBackgroundImage(UIImage(named: "play_download_normal"), for: .normal)
//        button.setBackgroundImage(UIImage(named: "play_collect_selected"), for: .selected)
        button.addTarget(self, action: #selector(downloadButtonClicked), for: .touchUpInside)
        return button
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addViews()
        self.selectionStyle = .none
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func addViews(){
        self.addSubview(self.titleLable)
        self.addSubview(self.subTitleLable)
        self.addSubview(self.collectButton)
        self.addSubview(self.downloadButton)
        self.titleLable.snp.makeConstraints { (make) in
            make.left.equalTo(self.snp.left).offset(15)
            make.right.equalTo(self.snp.right).offset(-15)
            make.top.equalTo(self.snp.top).offset(20)
        }
        self.subTitleLable.snp.makeConstraints { (make) in
            make.left.equalTo(self.snp.left).offset(15)
            make.top.equalTo(self.titleLable.snp.bottom).offset(20)
            make.height.equalTo(14)
            make.bottom.equalTo(self.snp.bottom).offset(-20)
        }
        self.downloadButton.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize(width: 20, height: 20))
            make.centerY.equalTo(self.subTitleLable.snp.centerY)
            make.right.equalTo(self.snp.right).offset(-15)
        }
        self.collectButton.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize(width: 20, height: 20))
            make.centerY.equalTo(self.subTitleLable.snp.centerY)
            make.right.equalTo(self.downloadButton.snp.left).offset(-20)
        }
    }
    private func loadData(){
        self.videoDetailModel.videoId = (self.currentVideoItem?.videoId)!
        self.videoDetailModel.getBeenRequest(successionHandler: {[weak self] (response: LVVideoListModel) in
            self!.collectButton.isSelected = response.isCollect
            self!.subTitleLable.text = response.playNum.formatUnit() + "次播放"
        }) {
            
        }
    }
    func setVideoItem(item:LVVideoListModel){
        self.currentVideoItem = item
        self.titleLable.text = self.currentVideoItem?.videoTitle
        self.subTitleLable.text = (self.currentVideoItem?.collectNum.formatUnit())! + "次播放"
        self.loadData()
    }
    @objc private func collectionButtonClicked(){
        if self.collectButtonClickedBlock != nil {
            self.collectButtonClickedBlock!()
        }
        if UserUtil.isLogin() == false {
            ViewControllerUtil.showLoginViewController()
            return
        }
        self.doCollectModel.videoId = (self.currentVideoItem?.videoId)!
        self.cancleCollectModel.videoIds = [(self.currentVideoItem?.videoId)!]
        if self.currentVideoItem!.isCollect == true{
            self.cancleCollectModel.startBeenRequest(successionHandler: {[weak self] (response:StringHandy) in
                TBTHUD.showSuccessMessage(message: "取消收藏成功")
                self!.currentVideoItem!.isCollect = false
                self!.collectButton.isSelected = (self?.currentVideoItem?.isCollect)!
            }) {
                
            }
        }else{
            self.doCollectModel.getBeenRequest(successionHandler: {[weak self] (response:StringHandy) in
                TBTHUD.showSuccessMessage(message: "收藏成功")
                self!.currentVideoItem!.isCollect = true
                self!.collectButton.isSelected = (self?.currentVideoItem?.isCollect)!
            }) {
                
            }
        }
        
    }
    @objc private func downloadButtonClicked(){
        if UserUtil.isLogin() == false {
            ViewControllerUtil.showLoginViewController()
            return
        }
        TBTHUD.showLoadingWithText(message: "准备开始下载")
        self.downLoadPathModel.videoId = (self.currentVideoItem?.videoId)!
        if self.downloadButtonClickedBlock != nil {
            self.downloadButtonClickedBlock!()
        }
        //请求下载地址
        self.downLoadPathModel.getBeenRequest(successionHandler: {[weak self] (response:LVVideoListModel) in
            TBTHUD.showMessage(message: "节目已开始下载")
            self?.currentVideoItem?.videoUrl = response.videoUrl
            DownloadManagerYC.shared.startDownLoadTask(video: (self?.currentVideoItem)!)
        }) {
            
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
