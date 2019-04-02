//
//  BaseTableViewController.swift
//  BoardCast
//
//  Created by admin on 2018/5/7.
//  Copyright © 2018年 admin. All rights reserved.
//

import UIKit

class BaseTableViewController: UITableViewController,UIGestureRecognizerDelegate {
    var  gesDelegate:UIGestureRecognizerDelegate? = nil

    var titleLab = MarqueeView.init(frame: CGRect.init(x: 80, y: 5, width: kScreenWidth - 160, height: 20))
    var subTitlLabel:UILabel?
    var searchBtnCallBack:noneAttributeClosure?
    var backBtnCallBack:noneAttributeClosure?

    var titleStr: String? {
        didSet{
            titleLab.setTitle(title: titleStr!)
        }
    }
    /**
     是否延伸到状态栏下
     */
    var isExtendTop = true{
        didSet{
            if isExtendTop == true {
                if (NSFoundationVersionNumber>=NSFoundationVersionNumber_iOS_8_0) {
                    
                    self.edgesForExtendedLayout = UIRectEdge.init(rawValue: 0);
                    
                    self.extendedLayoutIncludesOpaqueBars = false;
                    
                    self.modalPresentationCapturesStatusBarAppearance = false;
                    
                    self.tableView.contentInsetAdjustmentBehavior = .never
                    
                }else{
                    
                }
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
        titleLab.font = UIFont.init(name: XDFont.pingFangSCRegular.rawValue, size: 18)!
        titleLab.color = UIColor(hexString: "#181818")!
        self.navigationItem.titleView = titleLab

        //搜索按钮
        self.navigationItem.rightBarButtonItem = nil
        let rightBarButtonItem:UIBarButtonItem = UIBarButtonItem.init(image: UIImage.init(named:"icon_Search")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(searchBtnClcked))
        self.navigationItem.rightBarButtonItem = rightBarButtonItem
        self.navigationController?.edgesForExtendedLayout = UIRectEdge(rawValue: 0)
        if self.navigationController != nil {
            if (self.navigationController?.viewControllers.count)! > 1 {
                //自定义返回按钮
                let leftBarButtonItem:UIBarButtonItem = UIBarButtonItem.init(image: UIImage.init(named:"BACK")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(backBtnClcked))
                self.navigationItem.leftBarButtonItem = leftBarButtonItem
                self.navigationController?.edgesForExtendedLayout = UIRectEdge(rawValue: 0)
            }
        }
       
        tableView.separatorStyle = .none
        tableView.estimatedRowHeight = 44.0
        tableView.rowHeight = UITableView.automaticDimension
        tableView.tableFooterView = UIView.init()
        self.addSubViews()
    }

    @objc func searchBtnClcked() {
        if searchBtnCallBack != nil{
            searchBtnCallBack!()
        }
    }
    @objc func backBtnClcked(){
        weak var weakSelf = self
        if self.backBtnCallBack != nil{
            weakSelf?.backBtnCallBack!()
        }else{
            weakSelf?.navigationController?.popViewController(animated: true)
        }

    }

    //保留系统返回手势
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.rt_disableInteractivePop = false
        //自定义导航背景图
//        let bagroundImage:UIImage = (UIImage.init(named: "导航背景")?.resizableImage(withCapInsets: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0), resizingMode: .stretch))!
        //纯白背景
        let bagroundImage = UIImage.createImageWithColor(color: UIColor(hexString: "FFFFFF")!)
        self.navigationController?.navigationBar.setBackgroundImage(bagroundImage.withRenderingMode(.alwaysOriginal), for: .default)
        self.navigationController?.navigationBar.clipsToBounds = false
        self.navigationController?.navigationBar.barStyle = .default
        
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.barTintColor = UIColor.white
        //消除横线
        self.navigationController?.navigationBar.shadowImage = UIImage.init()
        //        if (self.navigationController?.viewControllers.count)! > 1 {
        // 记录系统返回手势的代理
        gesDelegate = self.navigationController?.interactivePopGestureRecognizer?.delegate
        // 设置系统返回手势的代理为当前控制器
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self;
        //        }
        
    }
    override func rt_customBackItem(withTarget target: Any!, action: Selector!) -> UIBarButtonItem! {
        return UIBarButtonItem.init(image: UIImage.init(named: "BACK")?.withRenderingMode(.alwaysOriginal), style: UIBarButtonItem.Style.plain, target: target, action: action)
    }
   
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.interactivePopGestureRecognizer?.delegate = gesDelegate
    }
    deinit {
        debugPrint("释放控制器:\(self.classForCoder)")
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func addSubViews(){
        
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

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
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
