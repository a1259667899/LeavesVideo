//
//  TableViewController.swift
//  LeavesVideo
//
//  Created by Sinder on 2018/10/19.
//  Copyright © 2018 Sinder. All rights reserved.
//

import UIKit

class LVMineDownloadTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    //是否全选
    private var ischeckAll = false
    //显示形式
    var cellType:LVMineCollectionTableViewCellType = .finished
    private lazy var bottomView:LVMineDownloadBottomView = {
        let view = LVMineDownloadBottomView.init(frame: CGRect.zero)
        view.allCheckClouser = {[weak self] in
            self?.selectAll()
        }
        view.deleteClouser = {[weak self] in
            self?.deleteSelectedDatas()
        }
        self.view.addSubview(view)
        return view
    }()
    private lazy var selectedItems:[YCDownloadItem] = []
    private lazy var tableView:UITableView = {
        let table = UITableView.init()
        table.delegate = self
        table.dataSource = self
        table.separatorStyle = .none
        table.tableFooterView = UIView.init()
        return table
    }()
    private lazy var downloadingList:[YCDownloadItem] = {
        return YCDownloadManager.downloadList()
        }() as! [YCDownloadItem]
    
    private lazy var downloadedList:[YCDownloadItem] = {
        return YCDownloadManager.finishList()
        }() as! [YCDownloadItem]
    
    private func refreshDataSource(){
        downloadingList = YCDownloadManager.downloadList() as! [YCDownloadItem]
        downloadedList = YCDownloadManager.finishList() as! [YCDownloadItem]
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(self.tableView)
        self.tableView.snp.makeConstraints { (make) in
            make.edges.equalTo(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        }
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 50 + kSafeAreaBottomH, right: 0)
        tableView.allowsMultipleSelectionDuringEditing = true
        self.tableView.registerCellWith(cellClazz: LVMineCollectionTableViewCell.self)
        if self.cellType == .finished {
            NotificationCenter.default.addObserver(self, selector: #selector(refreshDownLoadFinshList), name: NotifyVideoDownloadFinish, object: nil)
        }
    }
    override func viewDidAppear(_ animated: Bool) {
        if self.cellType == .finished {
             debugPrint("当前有\(self.tableView.numberOfRows(inSection: 0))个")
        }
       
    }
    deinit {
        NotificationCenter.default.removeObserver(self, name: NotifyVideoDownloadFinish, object: nil)
    }
    /**进入编辑状态*/
    func beginEditing(){
        self.tableView.setEditing(!self.tableView.isEditing, animated: true)
        if self.tableView.isEditing == true {
            self.bottomView.showOn(view: self.view)
        }else{
            self.bottomView.hideOn(view: self.view)
        }
    }
    // MARK: - Table view data source

    func numberOfSections(in tableView: UITableView) -> Int {
        if self.cellType == .downloading {
            if self.downloadingList.isEmpty{
                return 0
            }else{
                return 1
            }
        }else{
            if self.downloadedList.isEmpty{
                return 0
            }else{
                return 1
            }
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        debugPrint("++++++++++++++++++++++=")
        return self.cellType == .finished ? self.downloadedList.count : self.downloadingList.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = LVMineCollectionTableViewCell.cellWithTableView(tableView: tableView) as! LVMineCollectionTableViewCell
        cell.type = self.cellType
        cell.downLoadItem = self.cellType == .finished ? self.downloadedList[indexPath.row] : self.downloadingList[indexPath.row]
        cell.downLoadItem?.delegate = cell
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let v = LVMineDownloadingHeaderView.init(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: 44))
        v.pauseClouser = {
            YCDownloadManager.pauseAllDownloadTask()
        }
        v.resumeClouser = {
            YCDownloadManager.resumeAllDownloadTask()
        }
        return v
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return self.cellType == .finished ? 0 : 44
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if !self.tableView.isEditing {
            tableView.deselectRow(at: indexPath, animated: true)
            if self.cellType == .finished{
                let vc = HJVideoPlayerController.init()
                vc.configModel.onlyFullScreen = true
                let item = self.downloadedList[indexPath.row]
                let video = LVVideoListModel.modelWithData(data: item.extraData!)
                vc.videoTitle = video.videoTitle
                vc.url = item.savePath
                ViewControllerUtil.getCurrentViewController().navigationController?.pushViewController(vc, animated: true)
            }
           
        }else {
            //将数据加入数组
            if self.cellType == .finished{
                self.selectedItems.append(self.downloadedList[indexPath.row])
            }else if self.cellType == .downloading{
                self.selectedItems.append(self.downloadingList[indexPath.row])
            }
            
        }
    }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if self.tableView.isEditing == true {
            //将数据移除数组
            switch self.cellType {
            case .finished:
                let objc = self.downloadedList[indexPath.row]
                for (index, item) in selectedItems.enumerated(){
                    if item.fileId == objc.fileId{
                        self.selectedItems.remove(at: index)
                        break
                    }
                }
                
                break
            case .downloading:
                let objc = self.downloadingList[indexPath.row]
                for (index, item) in selectedItems.enumerated(){
                    if item.fileId == objc.fileId{
                        self.selectedItems.remove(at: index)
                        break
                    }
                }
                break
            }
        }
        
    }
    // Override to support conditional editing of the table view.
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
       
        return true
    }

    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        let type = UITableViewCell.EditingStyle.delete.rawValue | UITableViewCell.EditingStyle.insert.rawValue
        
        return UITableViewCell.EditingStyle(rawValue: type)!
    }
    // Override to support editing the table view.
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
    func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    /**获取当前e页面的编辑状态*/
    func isEditing()-> Bool{
        return self.tableView.isEditing
    }

}

extension LVMineDownloadTableViewController{
    /**监听到下载完成的通知，刷新页面*/
    @objc func refreshDownLoadFinshList(){
        self.downloadedList = YCDownloadManager.finishList() as! [YCDownloadItem]
        self.tableView.reloadData()
    }
    func selectAll(){
        self.selectedItems.removeAll()
        if self.cellType == .downloading {
            if self.ischeckAll == false{
                self.selectedItems.append(contentsOf: self.downloadingList)
                for i in 0..<self.downloadingList.count{
                    self.tableView.selectRow(at: IndexPath.init(row: i, section: 0), animated: true, scrollPosition: .top)
                    self.ischeckAll = true
                }
            }else{
                for i in 0..<self.downloadingList.count{
                    self.tableView.deselectRow(at: IndexPath.init(row: i, section: 0), animated: true)
                    self.ischeckAll = false
                }
            }
            
        }else if self.cellType == .finished{
            self.selectedItems.removeAll()
            if self.ischeckAll == false{
                self.selectedItems.append(contentsOf: self.downloadedList)
                for i in 0..<self.downloadedList.count{
                    self.tableView.selectRow(at: IndexPath.init(row: i, section: 0), animated: true, scrollPosition: .top)
                    self.ischeckAll = true
                }
            }else{
                for i in 0..<self.downloadedList.count{
                    self.tableView.deselectRow(at: IndexPath.init(row: i, section: 0), animated: true)
                    self.ischeckAll = false
                }
            }
            
        }
    }
    func deleteSelectedDatas(){
        if self.selectedItems.isEmpty {
            TBTHUD.showErrorMessage(message: "请选择项目")
            return
        }
        PopViewUtil.alert(message: "确定删除选中的视频吗？", leftTitle: "确定删除", rightTitle: "取消", leftHandler: {
            if self.selectedItems.isEmpty {
                return
            }
            self.selectedItems.forEach({[weak self] (item) in//删除下载任务
                YCDownloadManager.stopDownload(with: item)
                self?.refreshDataSource()
                self?.tableView.reloadData()
            })
        }) {
            
        }
    }
}

