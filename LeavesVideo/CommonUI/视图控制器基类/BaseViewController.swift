//
//  BaseNagivationController.swift
//  BoardCast-swift
//
//  Created by admin on 2017/8/2.
//  Copyright © 2017年 admin. All rights reserved.
//

import UIKit
import SwiftHEXColors
import SnapKit
import SKPhotoBrowser
import Photos
typealias noneAttributeClosure = () -> Void
typealias intAttributeClosuer = (Int) -> Void
typealias boolAttributeClouser = (Bool) -> Void

enum NVBarStyle: Int {
    case white
    case custom
}

class BaseViewController: UIViewController,UIGestureRecognizerDelegate {
    //分享的图片
    var shareImage:UIImage?
    var  gesDelegate:UIGestureRecognizerDelegate? = nil
    var subTitlLabel:UILabel?
    var rightBtnClickBlock:noneAttributeClosure?
    var backBtnCallBack:noneAttributeClosure?
    var titleLab = MarqueeView.init(frame: CGRect.init(x: 80, y: 5, width: kScreenWidth - 160, height: 20))
    var titleStr: String? {
        didSet{
            titleLab.setTitle(title: titleStr!)
        }
    }
    
    /**
     导航条样式
     */
    private var nvBarStyle:NVBarStyle = .white

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        titleLab.font = UIFont.init(name: XDFont.pingFangSCRegular.rawValue, size: 18)!
        titleLab.color = UIColor(hexString:"#181818")!
        self.navigationItem.titleView = titleLab
        
        //搜索按钮
        self.navigationItem.rightBarButtonItem = nil
        let rightBarButtonItem:UIBarButtonItem = UIBarButtonItem.init(image: UIImage.init(named:"icon_Search")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(rightBtnClcked))
        self.navigationItem.rightBarButtonItem = rightBarButtonItem
        self.navigationController?.edgesForExtendedLayout = UIRectEdge(rawValue: 0)
        
        if (self.navigationController?.viewControllers.count)! > 1{
            //自定义返回按钮
            let leftBarButtonItem:UIBarButtonItem = UIBarButtonItem.init(image: UIImage.init(named:"BACK")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(backBtnClcked))
            self.navigationItem.leftBarButtonItem = leftBarButtonItem
        }
        addSuViews()
    }
    @objc func rightBtnClcked() {
        if rightBtnClickBlock != nil{
            rightBtnClickBlock!()
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
//        //自定义导航背景图
//        let bagroundImage:UIImage = (UIImage.init(named: "导航背景")?.resizableImage(withCapInsets: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0), resizingMode: .stretch))!
        //纯白背景
        let bagroundImage = UIImage.createImageWithColor(color: UIColor(hexString: "#FFFFFF")!)
        self.navigationController?.navigationBar.setBackgroundImage(bagroundImage.withRenderingMode(.alwaysOriginal), for: .default)
        
        self.navigationController?.navigationBar.clipsToBounds = false
        self.navigationController?.navigationBar.barStyle = .default
        
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.barTintColor = UIColor.white
        //消除横线
        self.navigationController?.navigationBar.shadowImage = UIImage.init()
        self.titleLab.color = UIColor.white
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
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    /**
     添加子视图的方法
     */
    func addSuViews(){
        
    }

    /**
     设置导航条背景
     */
    func setNVBarBgStyle(style: NVBarStyle){
        switch style {
        case .white:
            let bagroundImage = UIImage.createImageWithColor(color: UIColor(hexString: "#FFFFFF")!)
            self.navigationController?.navigationBar.setBackgroundImage(bagroundImage.withRenderingMode(.alwaysOriginal), for: .default)
        case .custom:
            let bagroundImage = UIImage.init(gradientColors: [UIColor(hex: "#4481EB")!, UIColor(hex: "#FFFFFF")!], size: CGSize(width: kScreenWidth, height: kNavibarH))
            self.navigationController?.navigationBar.setBackgroundImage(bagroundImage!.withRenderingMode(.alwaysOriginal), for: .default)
        default:
            break
        }
    }
    
    //MARK:-分享相关
    func doShareAction(){
        if !LVShareChannelView.generateChannelsToShare().isEmpty {
            LVShareChannelView.show {[weak self] (channelItem) in
                
                guard self != nil else {
                    return ;
                }
                guard channelItem.channel != .none else {
                    return;
                }
                
                if(channelItem.channel == .download)
                {
                    self?.didLoadSelectImage()
                    return
                }
                
                if channelItem.channel == .session || channelItem.channel == .timeline {
                    //判断是否安装了微信
                    if UIApplication.shared.canOpenURL(URL.init(string: "weixin://")!) {
                        self!.wxSdkShareImage(channel:channelItem);
                    }else{
                        TBTHUD.showErrorMessage(message: "请安装微信")
                    }
                }
            }
        }else{
            TBTHUD.showErrorMessage(message: "请安装微信")
        }
    }
    private func didDismissActionSheetWithButtonIndex(_ buttonIndex: Int) {
        let currentState = PHPhotoLibrary.authorizationStatus();
        switch currentState {
        case .restricted, .denied:
            PopViewUtil.alert(title: "图片授权被拒绝", message: "拒绝后无法保存图片哦，是否跳转到设置？", leftTitle: "取消", rightTitle: "确定", leftHandler: {
                
            }) {
                UIApplication.shared.open(URL.init(string: UIApplication.openSettingsURLString)!, options:  [:], completionHandler: { (ret) in
                    
                })
            }
        case .notDetermined:
            PHPhotoLibrary.requestAuthorization({ (state) in
                if state == .authorized {
                    self.saveImages();
                } else {
                    PopViewUtil.alert(title: "图片授权被拒绝", message: "拒绝后无法保存图片哦，是否跳转到设置？", leftTitle: "取消", rightTitle: "确定", leftHandler: {
                        
                    }) {
                        UIApplication.shared.open(URL.init(string: UIApplication.openSettingsURLString)!, options:  [:], completionHandler: { (ret) in
                            
                        })
                    }
                }
            })
        case .authorized:
            self.saveImages();
        }
    }
    private func saveImages() {
        do {
            TBTHUD.showLoadingWithText(message: "正在保存")
            PHPhotoLibrary.shared().performChanges({
                let options = PHImageRequestOptions.init()
                options.resizeMode = .exact
                PHAssetChangeRequest.creationRequestForAsset(from: self.shareImage!);
            }, completionHandler: { (success, error) in
                DispatchQueue.main.async {
                    TBTHUD.dismiss()
                    if success && error == nil {
                        TBTHUD.showSuccessMessage(message: "保存成功")
                    } else {
                        TBTHUD.showErrorMessage(message: "保存失败" + (error != nil ? error!.localizedDescription : ""))
                    }
                }
                
            })
        } catch {
            DispatchQueue.main.async {
                TBTHUD.showErrorMessage(message: "网络连接失败，请检查网络")
            }
        }
    }
    private func didLoadSelectImage(){
        SKPhotoBrowserOptions.enableSingleTapDismiss = true;
        SKPhotoBrowserOptions.displayStatusbar = true;
        SKPhotoBrowserOptions.actionButtonTitles = ["保存此图到本地"];
        SKPhotoBrowserOptions.displayCloseButton = false;
        
        if let titles = SKPhotoBrowserOptions.actionButtonTitles {
            let actionSheetController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
            actionSheetController.addAction(UIAlertAction(title: "取消", style: .cancel))
            
            for idx in titles.indices {
                actionSheetController.addAction(UIAlertAction(title: titles[idx], style: .default, handler: { (_) -> Void in
                    self.didDismissActionSheetWithButtonIndex(idx)
                }))
            }
            
            if UI_USER_INTERFACE_IDIOM() == .phone {
                present(actionSheetController, animated: true, completion: nil)
            }
        }
    }
    //ios11上微信分享
    func wxSdkShareImage(channel:MSShareChannelItem){
        
        let imgObj = WXImageObject();
        
        let image = self.shareImage//
        imgObj.imageData = image?.jpegData(compressionQuality: 1)
        
        let message = WXMediaMessage();
        message.mediaObject = imgObj;
        message.description = nil
        message.title = nil
        message.mediaTagName = nil
        
        if channel.channel == .session {
            UIGraphicsBeginImageContext(CGSize(width: 100, height: 140))
            image?.draw(in: CGRect.init(x: 0, y: 0, width: 100, height: 140))
            let thumbImage=UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            message.thumbData=thumbImage!.pngData()
        }
        
        let sendReq = SendMessageToWXReq();
        
        if channel.channel == .session {
            sendReq.scene = Int32(WXSceneSession.rawValue);
        } else {
            sendReq.scene = Int32(WXSceneTimeline.rawValue);
        }
        sendReq.bText = false;
        //        sendReq.text = nil;//加上之后 就调不起微信
        sendReq.message = message;
        
        WXApi.send(sendReq);
        
        TBTHUD.dismiss()
    }

}
