//
//  LVVideoListTableViewController.swift
//  LeavesVideo
//
//  Created by Sinder on 2018/10/23.
//  Copyright © 2018 Sinder. All rights reserved.
//

import UIKit

class LVVideoListTableViewController: BaseTableViewController {
    private var catId = ""
    private var videoList:[LVVideoListModel] = []
    private lazy var videoListModel:LVVideoByCatListModel = {
        let model = LVVideoByCatListModel()
        return model
    }()
    init(style: UITableView.Style, catId: String, catName: String) {
        super.init(style: style)
        self.catId = catId
        self.titleStr = catName
        self.videoListModel.catId = self.catId
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadData()
    }
    private func loadData(){
       TBTHUD.showLoading()
        self.videoListModel.startListRequest(successionHandler: {[weak self] (response:[LVVideoListModel], total) in
            if self?.videoListModel.currentPage == 1{
                self?.videoList.removeAll()
            }
            self!.videoList.append(contentsOf: response)
            self?.tableView.reloadData()
            self?.videoListModel.currentPage += 1
            self?.tableView.switchRefreshHeader(to: .normal(.success, 0.3))
            if (self?.videoList.count)! >= total{
                self?.tableView.switchRefreshFooter(to: .noMoreData)
            }else{
                self?.tableView.switchRefreshFooter(to: .normal)
            }
        }) {[weak self] in
            self?.tableView.switchRefreshHeader(to: .normal(.failure, 0.3))
            self?.tableView.switchRefreshFooter(to: .normal)
        }
    }
    override func addSubViews() {
        self.tableView.registerCellWith(cellClazz: LVVideoListTableViewCell.self)
        self.tableView.configRefreshHeader(container: self) {[weak self] in
            self?.videoListModel.currentPage = 1
            self?.loadData()
        }
        self.tableView.configRefreshFooter(container: self) {[weak self] in
            self!.loadData()
        }
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.videoList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = LVVideoListTableViewCell.cellWithTableView(tableView: tableView) as! LVVideoListTableViewCell
        cell.setVideo(video: self.videoList[indexPath.row])

        return cell
    }
    
    //MARK: - TableView delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        super.tableView(tableView, didSelectRowAt: indexPath)
        let vc = LVVideoPlayViewController()
        vc.currentVideo = self.videoList[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
