//
//  MineViewController.swift
//  LeavesVideo
//
//  Created by Sinder on 2018/10/18.
//  Copyright © 2018 Sinder. All rights reserved.
//

import UIKit

class LVMineViewController: BaseTableViewController {
    private lazy var tips:[[String]] = {
        return [[""],["邀请好友","我的任务","我的下载","我的收藏","修改密码"],["退出"]]
    }()
    private lazy var icons:[String] = {
        return ["mine_invite","mine_task","mine_downloading","mine_collection","mine_changePwd"]
    }()
    private lazy var subTitles:[String] = {
        return ["邀请好友，可以获取更多下载次数","做任务，获取更多下载次数","","",""]
    }()
    private lazy var downLoadCoutModel:LVDownloadCountModel = {
        return LVDownloadCountModel()
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.isExtendTop = true
        self.tableView.isScrollEnabled = false
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if UserUtil.isLogin() {
            downLoadCoutModel.getBeenRequest(successionHandler: {[weak self] (response:DownloadCoutItem) in
                //刷新下载次数显示
                let cell = self!.tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as! LVMineHeaderTableViewCell
                cell.updateDownLoadCount(count: response.downloadNum)
            }) {
                
            }
        }
        
    }
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    override func addSubViews() {
        self.tableView.registerCellWith(cellClazz: LVMineHeaderTableViewCell.self)
        self.tableView.registerCellWith(cellClazz: LVMineNormalTableViewCell.self)
        self.tableView.registerCellWith(cellClazz: LVMineLogOutTableViewCell.self)
        NotificationCenter.default.addObserver(self, selector: #selector(refreshTableView), name: NotifyLogin, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(refreshTableView), name: NotifyLogOut, object: nil)
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        super.tableView(tableView, didSelectRowAt: indexPath)
        var vc:UIViewController?
        let text = tips[indexPath.section][indexPath.row]
        if indexPath.section == 1{
            if text != "我的下载" && UserUtil.isLogin() == false{
                ViewControllerUtil.showLoginViewController()
                return
            }
            switch text {
            case "邀请好友":
                vc = LVShareViewController()
            case "我的任务":
                vc = LVTaskListViewController()
            case "我的下载":
                vc = LVMineDownLoadContainerViewController()
            case "我的收藏":
                vc = LVMineCollectionTableViewController()
            case "修改密码":
                vc = LVChangePwdViewController()
            default:
                break
            }
            vc?.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(vc!, animated: true)
        }else if indexPath.section == 2{
            PopViewUtil.alert(message: "确定退出登录?", leftTitle: "确定", rightTitle: "取消", leftHandler: {
                UserUtil.deleteUser()
                NotificationCenter.default.post(Notification.init(name: NotifyLogOut))
            }) {
                
            }
        }
        
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return is_iPhoneX ? 124 + 24 : 124
        }else{
            return UITableView.automaticDimension
        }
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }else if section == 1{
            return 4
        }else{
            return 1
        }
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = LVMineHeaderTableViewCell.cellWithTableView(tableView: tableView) as! LVMineHeaderTableViewCell
            
            return cell
        }else if indexPath.section == 1{
            let cell = LVMineNormalTableViewCell.cellWithTableView(tableView: tableView) as! LVMineNormalTableViewCell
            cell.set(title: tips[1][indexPath.row], icon: icons[indexPath.row], subTitle: subTitles[indexPath.row])
            return cell
        }else{
            return LVMineLogOutTableViewCell.cellWithTableView(tableView: tableView)
        }
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return UserUtil.isLogin() == true ? 3 : 2
    }
    @objc func refreshTableView(){
        self.tableView.reloadData()
    }
    deinit {
        NotificationCenter.default.removeObserver(self, name: NotifyLogin, object: nil)
        NotificationCenter.default.removeObserver(self, name: NotifyLogOut, object: nil)
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
