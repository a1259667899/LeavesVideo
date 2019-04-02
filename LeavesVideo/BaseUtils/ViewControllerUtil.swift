//
//  ViewControllerUtil.swift
//  Investment
//
//  Created by XD on 2018/9/3.
//  Copyright © 2018年 方加会. All rights reserved.
//

import UIKit
/**
 有关ViewController的工具类
 */
class ViewControllerUtil: NSObject {
    /**
     获取当前显示的viewController
     */
   class func getCurrentViewController() -> UIViewController{
        let rootController = UIApplication.shared.keyWindow?.rootViewController
        if let tabController = rootController as? UITabBarController   {
            if let navController = tabController.selectedViewController as? UINavigationController{
                return navController.children.last!
            }else{
                return tabController
            }
        }else if let navController = rootController as? UINavigationController {
            
            return navController.children.last!
        }else{
            
            return rootController!
        }
    }
    //弹出登录页面
    class func showLoginViewController(){
        let vc = LVLoginViewController()
        let nv = RTRootNavigationController.init(rootViewController: vc)
        ViewControllerUtil.getCurrentViewController().present(nv, animated: true) {
            
        }
    }
}
