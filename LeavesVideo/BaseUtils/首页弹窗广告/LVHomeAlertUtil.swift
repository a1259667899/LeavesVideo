//
//  LVHomeAlertUtil.swift
//  LeavesVideo
//
//  Created by Sinder on 2018/10/31.
//  Copyright © 2018 Sinder. All rights reserved.
//

import Foundation
class LVADUtil{
    /**展示首页弹窗*/
    class func showHomeAlertAD(){
        let model = LVHomeAlertModel()
        model.getBeenRequest(successionHandler: { (response: LVHomeAlertItem) in
            //判断该消息是不是弹出过了
            if UserDefaults.standard.bool(forKey: "HomeAlert"){
                let id = UserDefaults.standard.integer(forKey: "HomeAlert")
                if id == response.advertId{
                    return
                }
            }
            //存储
            UserDefaults.standard.set(response.advertId, forKey: "HomeAlert")
            //弹框
            let alertController = UIAlertController.init(title: "", message: response.content, preferredStyle: .alert)
            let cancleAction = UIAlertAction.init(title: "关闭", style: .cancel, handler: { (action) in
                
            })
            alertController.addAction(cancleAction)
            if response.link.isEmpty == false{
                let openAction = UIAlertAction.init(title: "查看", style: .default, handler: { (action) in
                    let vc = WKWebViewViewController()
                    vc.url = response.link
                    vc.hidesBottomBarWhenPushed = true
                    ViewControllerUtil.getCurrentViewController().navigationController?.pushViewController(vc, animated: true)
                })
                alertController.addAction(openAction)
            }
            ViewControllerUtil.getCurrentViewController().present(alertController, animated: true, completion: {
                
            })
        }) {
            
        }
    }
    /**获取启动广告数据*/
    class func loadADData(successHandler:@escaping (LVHomeAlertItem)->Void){
        let model = LVLaunchADModel()
        model.getListRequest(successionHandler: { (response: [LVHomeAlertItem], total) in
            successHandler(response.last!)
        }) {
            
        }
    }
}
