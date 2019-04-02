//
//  LVMineCollectionTableViewCell.swift
//  LeavesVideo
//
//  Created by Sinder on 2018/10/19.
//  Copyright © 2018 Sinder. All rights reserved.
//

import UIKit
enum LVMineCollectionTableViewCellType {
    case finished
    case downloading
}
class LVMineCollectionTableViewCell: UITableViewCell,YCDownloadItemDelegate {
    /***记录上一次的状态*/
    private var lastStatus: YCDownloadStatus = .waiting
    var type:LVMineCollectionTableViewCellType = .downloading{
        didSet{
            if type == .finished {
                self.progressView.isHidden = true
                self.speedLabel.isHidden = true
                self.sizeLabel.isHidden = true
                self.controllButton.isHidden = true
            }else{
                self.progressView.isHidden = false
                self.speedLabel.isHidden = false
                self.sizeLabel.isHidden = false
                self.controllButton.isHidden = false
            }
        }
    }
    var downLoadItem:YCDownloadItem? {
        didSet{
            let videoItem = LVVideoListModel.modelWithData(data: (downLoadItem?.extraData)!)
            self.coverImage.setImageby_kf(imageUrl: videoItem.videoIcon)
            self.titleLabel.text = videoItem.videoTitle
            self.setDownLoadStatus(status: (downLoadItem?.downloadStatus)!)
        }
    }
    private lazy var controllButton: ExtendButton = {
        let button = ExtendButton()
        button.setBackgroundImage(UIImage(named: "video_downloading"), for: .normal)
        button.setBackgroundImage(UIImage(named: "video_stopdownload"), for: .selected)
        button.addTarget(self, action: #selector(resumeOrPauseTask(sender:)), for: .touchUpInside)
        return button
    }()
    private lazy var coverImage:UIImageView = {
        let imageView = UIImageView.init()
        imageView.backgroundColor = textLightGrayColor
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
    private lazy var titleLabel:UILabel = {
        let lable = UILabel.init()
        lable.font = XDFont.pingFangSCRegular.ofSize(size: 14.0)
        lable.textColor = textBlackColor
        lable.text = "我觉得鸣人是一个很厉害的人"
        return lable
    }()
    private lazy var progressView:UIProgressView = {
        let progress = UIProgressView.init(frame: CGRect(x: 0, y: 0, width: 210, height: 1))
        progress.isHidden = true
        progress.progressTintColor = UIColor(hex: "#4382EB")
        return progress
    }()
    private lazy var speedLabel:UILabel = {
        let label = UILabel()
        label.font = XDFont.pingFangSCRegular.ofSize(size: 11.0)
        label.textColor = UIColor(hexString: "#8B8B8B")
        label.isHidden = true
        return label
    }()
    private lazy var sizeLabel:UILabel = {
        let label = UILabel()
        label.font = XDFont.pingFangSCRegular.ofSize(size: 11.0)
        label.textColor = UIColor(hexString: "#8B8B8B")
        label.isHidden = true
        return label
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setVideoItem(item:LVMineCollectionCellViewModel){
        self.coverImage.setImageby_kf(imageUrl: item.coverImageSrc)
        self.titleLabel.text = item.title
    }
    func setYCDownLoadItem(item: YCDownloadItem){
        let video = LVVideoListModel.modelWithData(data: item.extraData!)
        self.coverImage.setImageby_kf(imageUrl: video.videoIcon)
        self.titleLabel.text = video.videoTitle
        self.setDownLoadStatus(status: item.downloadStatus)
    }
    private func addViews(){
        self.contentView.addSubview(self.coverImage)
        self.contentView.addSubview(self.titleLabel)
        self.contentView.addSubview(self.progressView)
        self.contentView.addSubview(self.sizeLabel)
        self.contentView.addSubview(self.speedLabel)
       self.coverImage.addSubview(self.controllButton)
        self.coverImage.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize(width: 120, height: 68))
            make.top.equalTo(self.contentView.snp.top).offset(7)
            make.bottom.equalTo(self.contentView.snp.bottom).offset(-7)
            make.left.equalTo(self.contentView.snp.left).offset(15)
        }
        self.controllButton.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize(width: 30, height: 30))
            make.center.equalTo(self.coverImage.snp.center)
        }
        self.titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.coverImage.snp.right).offset(15)
            make.right.equalTo(self.snp.right).offset(-15)
            make.top.equalTo(self.coverImage.snp.top)
        }
        self.progressView.snp.makeConstraints { (make) in
            make.left.equalTo(self.titleLabel.snp.left)
            make.bottom.equalTo(self.coverImage.snp.bottom)
            make.right.equalTo(self.snp.right).offset(-15)
        }
        self.speedLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.progressView.snp.left)
            make.bottom.equalTo(self.progressView.snp.top).offset(-3)
        }
        self.sizeLabel.snp.makeConstraints { (make) in
            make.right.equalTo(self.progressView.snp.right)
            make.bottom.equalTo(self.progressView.snp.top).offset(-3)
        }
    }
    private func setDownLoadStatus(status:YCDownloadStatus){
        self.controllButton.isSelected = status == .downloading
        switch status {
        case .waiting:
            self.sizeLabel.text = "正在等待"
            break
        case .downloading:
            self.sizeLabel.text = "正在下载"
            break
        case .paused:
            self.sizeLabel.text = "暂停下载"
            break
        case .finished:
            self.sizeLabel.text = "下载成功"
            self.progressView.progress = 1
            if lastStatus != .finished{
                //发送下载完成的通知
                NotificationCenter.default.post(name: NotifyVideoDownloadFinish, object: nil)
            }
            break
        case .failed:
            self.sizeLabel.text = "下载失败"
            break
        default:
            break
        }
        self.lastStatus = status
    }
    private func changedSizeLableDownloadedSize(downloadedSize: Int64, totalSize: Int64){
        self.sizeLabel.text = "\(YCDownloadUtils.fileSizeString(fromBytes: totalSize) ?? "0MB")"
        var progress:Float = 0
        if totalSize != 0 {
            progress = Float(downloadedSize) / Float(totalSize)
        }
        self.speedLabel.text = "\(YCDownloadUtils.fileSizeString(fromBytes: downloadedSize) ?? "0MB")"
        self.progressView.progress = progress
    }
    @objc private func resumeOrPauseTask(sender: UIButton){
        sender.isSelected = !sender.isSelected
        if sender.isSelected == true {
            YCDownloadManager.resumeDownload(with: self.downLoadItem!)
        }else{
            YCDownloadManager.pauseDownload(with: self.downLoadItem!)
        }
    }
    func downloadItemStatusChanged(_ item: YCDownloadItem) {
        self.setDownLoadStatus(status: item.downloadStatus)
    }
    func downloadItem(_ item: YCDownloadItem, downloadedSize: Int64, totalSize: Int64) {
        self.changedSizeLableDownloadedSize(downloadedSize: downloadedSize, totalSize: totalSize)
    }
    func downloadItem(_ item: YCDownloadItem, speed: UInt, speedDesc: String) {
//        self.speedLabel.text = "\(YCDownloadUtils.fileSizeString(fromBytes: Int64(speed)) ?? "")"
    }
}
