//
//  LVTaskListViewController.swift
//  LeavesVideo
//
//  Created by Sinder on 2018/10/19.
//  Copyright © 2018 Sinder. All rights reserved.
//

import UIKit

class LVTaskListViewController: BaseTableViewController {
    private lazy var listModel:LVMineTaskModel = {
        return LVMineTaskModel()
    }()
    private lazy var taskList:[LVMineTaskItem] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        self.titleStr = "我的任务"
        self.loadData()
    }
    private func loadData(){
        TBTHUD.showLoading()
        self.listModel.getListRequest(successionHandler: { [weak self](response:[LVMineTaskItem], total) in
            self?.taskList = response
            self!.tableView.reloadData()
        }) {
            
        }
    }
    override func addSubViews() {
        self.tableView.registerCellWith(cellClazz: LVTaskListTableViewCell.self)
    }
   
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.taskList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = self.taskList[indexPath.row]
        let cell = LVTaskListTableViewCell.cellWithTableView(tableView: tableView) as! LVTaskListTableViewCell
        cell.setTaskItem(task: item)
        cell.buttonClickedClouser = {[weak self] in
            if item.taskType == 3 {
                let vc = LVShareViewController()
                self!.navigationController?.pushViewController(vc, animated: true)
            }
        }
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        super.tableView(tableView, didSelectRowAt: indexPath)
        
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
