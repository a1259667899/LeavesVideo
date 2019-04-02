//
//  LVMineDownLoadContainerViewController.swift
//  LeavesVideo
//
//  Created by Sinder on 2018/10/25.
//  Copyright © 2018 Sinder. All rights reserved.
//

import UIKit
class LVMineDownLoadContainerViewController: BaseViewController , LVMindownloadSegmentHeaderDelegate{
    private var pageView:DNSPageView?
    private var segView:LVMindownloadSegmentHeader?
    private var currentViewController: UIViewController?
    private lazy var rightBarButton:ExtendButton = {
        let button = ExtendButton.init(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        button.addTarget(self, action: #selector(rightBtnClcked), for: .touchUpInside)
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()

        self.titleStr = "我的下载"
        NotificationCenter.default.addObserver(self, selector: #selector(refreshTieles), name: NotifyVideoDownloadFinish, object: nil)
    }
    deinit {
        NotificationCenter.default.removeObserver(self, name: NotifyVideoDownloadFinish, object: nil)
    }
    override func addSuViews() {
        rightBarButton.setAttributedTitle(NSAttributedString.init(string: "编辑", attributes: [NSAttributedString.Key.font:XDFont.pingFangSCRegular.ofSize(size: 14.0)!,NSAttributedString.Key.foregroundColor:textBlackColor!]), for: .normal)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(customView: rightBarButton)
//        setupSegmentView()
        setupSement()
    }
    
    override func rightBtnClcked() {
        debugPrint("进入编辑状态")
//        self.segView?.setTitles(titles: ["正在下载(\(YCDownloadManager.downloadList().count))","已下载"])
        debugPrint("当前显示的index为\(String(describing: self.segView?.getCurrentIndex()))")
        let vc:LVMineDownloadTableViewController = self.children[(self.segView?.getCurrentIndex())!] as! LVMineDownloadTableViewController
         vc.beginEditing()
        self.updateRightBarButtonItemWithIndex(index: (self.segView?.getCurrentIndex())!)
    }
}

extension LVMineDownLoadContainerViewController{
/**初始化segmentView*/
    func setupSement(){
        // 设置标题内容
        let titles = ["正在下载(\(YCDownloadManager.downloadList().count))","已完成"]
        segView = LVMindownloadSegmentHeader.init(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: 45), titles: titles)
        self.view.addSubview(segView!)
        segView?.delegate = self
        // 创建每一页对应的controller
        let vcAll = LVMineDownloadTableViewController()
        vcAll.cellType = .downloading
        vcAll.view.frame = CGRect(x: 0, y: 45, width: kScreenWidth, height: kScreenHeight - 44)
        let myConcern = LVMineDownloadTableViewController()
        myConcern.cellType = .finished
        myConcern.view.frame = CGRect(x: 0, y: 45, width: kScreenWidth, height: kScreenHeight - kNavibarH - 44)
        self.addChild(vcAll)
        self.addChild(myConcern)
        vcAll.didMove(toParent: self)
        self.currentViewController = vcAll
        self.view.addSubview(vcAll.view)
    }
    
    func LVMindownloadSegmentHeaderDidSelectIndex(index: Int) {
        self.updateRightBarButtonItemWithIndex(index: index)
        self.transition(from: currentViewController!, to: self.children[index], duration: 0.2, options: .curveLinear, animations: {
            
        }) {[weak self] (ret) in
            if ret{
                //移除oldController，但在removeFromParentViewController：方法前不会调用willMoveToParentViewController:nil 方法，所以需要显示调用

//                self!.children[index].didMove(toParent: self)
//                self!.currentViewController?.willMove(toParent: nil)
//                self!.currentViewController?.removeFromParent()
                self!.currentViewController = self!.children[index]
            }else{
                
            }
        }
    }
}

extension LVMineDownLoadContainerViewController{
    func updateRightBarButtonItemWithIndex(index: Int){
        let vc:LVMineDownloadTableViewController = self.children[index] as! LVMineDownloadTableViewController
        //获取编辑状态
        let ret = vc.isEditing()
        if ret == true {
             rightBarButton.setAttributedTitle(NSAttributedString.init(string: "取消", attributes: [NSAttributedString.Key.font:XDFont.pingFangSCRegular.ofSize(size: 14.0)!,NSAttributedString.Key.foregroundColor:textBlackColor!]), for: .normal)
        }else{
             rightBarButton.setAttributedTitle(NSAttributedString.init(string: "编辑", attributes: [NSAttributedString.Key.font:XDFont.pingFangSCRegular.ofSize(size: 14.0)!,NSAttributedString.Key.foregroundColor:textBlackColor!]), for: .normal)
        }
    }
    /**
     配置segmentView
     */
    func setupSegmentView(){
        // 创建DNSPageStyle，设置样式
        let style = DNSPageStyle()
        style.isTitleScaleEnabled = false
        style.isShowBottomLine = true
        //        style.titleFont = 16
        style.titleColor = UIColor.init(hexString: "#262626")!
        style.titleSelectedColor = UIColor.init(hexString: "#4383F6")!
        style.bottomLineColor = UIColor.init(hexString: "#4383F6")!
        style.bottomLineHeight = 3
        style.bottomLineRadius = 1.5
        // 设置标题内容
        let titles = ["正在下载(\(YCDownloadManager.downloadList().count))","已完成"]
        
        // 创建每一页对应的controller
        let vcAll = LVMineDownloadTableViewController()
        vcAll.cellType = .downloading
        let myConcern = LVMineDownloadTableViewController()
        myConcern.cellType = .finished
        let childViewControllers = [vcAll , myConcern]
        
        let size = self.view.size
        
        // 创建对应的DNSPageView，并设置它的frame
        // titleView和contentView会连在一起
        pageView = DNSPageView(frame: CGRect(x: 0, y: 0, width: size.width, height: size.height - kSafeAreaBottomH - kNavibarH), style: style, titles: titles, childViewControllers: childViewControllers)
        pageView?.didChangeToIndex = {[weak self] (index) in
            self?.updateRightBarButtonItemWithIndex(index: index)
        }
        view.addSubview(pageView!)
    }
    /**刷新title*/
    @objc func refreshTieles(){
        self.segView?.updateTiels(titles: ["正在下载(\(YCDownloadManager.downloadList().count))","已完成"])
    }
}

