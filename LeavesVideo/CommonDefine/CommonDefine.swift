//
//  CommonDefine.swift
//  LeavesVideo
//
//  Created by Sinder on 2018/10/17.
//  Copyright © 2018 Sinder. All rights reserved.
//

import Foundation
import UIKit
var kScreenWidth = UIScreen.main.bounds.width
var kScreenHeight = UIScreen.main.bounds.height
//适配iPhoneX
let is_iPhoneX = (kScreenHeight >= 812.0 ? true : false)
let kNavibarH: CGFloat = is_iPhoneX ? 88.0 : 64.0
let kTabbarH: CGFloat = is_iPhoneX ? 49.0+34.0 : 49.0
let kStatusbarH: CGFloat = is_iPhoneX ? 44.0 : 20.0
let iPhoneXBottomH: CGFloat = is_iPhoneX ? 34.0 : 0
let kSafeAreaBottomH:CGFloat = is_iPhoneX ? 34.0 : 0
//倍数适配
let kHeightMultiper = kScreenHeight / 667.0
let kWidthMultiper = kScreenWidth / 375.0

/**
 登录成功的通知
 */
let NotifyLogin = Notification.Name(rawValue: "loginSuccess")
/**
 登录退出登录的通知
 */
let NotifyLogOut = Notification.Name(rawValue: "logoutSuccess")
/**进入横屏模式的通知*/
let NotifyRotation = Notification.Name(rawValue: "screenRotation")
/**退出横屏的通知*/
let NotifyLandSpece = Notification.Name(rawValue: "screenLandSpace")
/**单个视频下载完成的通知*/
let NotifyVideoDownloadFinish = Notification.Name(rawValue: "NotifyVideoDownloadFinish")

#if DEVELOPMENT
var baseUrl = "http://148.66.135.165/"
#else
var baseUrl = "http://148.66.135.165/"
#endif

let MixpanelToken = "f41102b34092283a8ffef049d8a46a56"
let WXAppId = "wxacddcc09e54c299f"
//MARK:-常用颜色
let textBlackColor = UIColor(hexString: "#181818")
let textLightGrayColor = UIColor(hexString: "#999999")
