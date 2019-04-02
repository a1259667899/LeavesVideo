//
//  MSShareChannel.swift
//  Investment
//
//  Created by 方加会 on 2018/7/11.
//  Copyright © 2018年 方加会. All rights reserved.
//

import UIKit
import Social

enum MSShareChannel:Int {
    case none = 0, session = 1, timeline = 2, qq = 3, qzone = 4, weibo = 5 ,minipro = 6,download = 7
}

class MSShareChannelItem: NSObject {
    init(channel:Int) {
        self.channel = MSShareChannel.init(rawValue: channel) ?? .none;
    }
    var channel = MSShareChannel.none;
    var serviceType:String {
        switch self.channel {
        case .timeline, .session,.minipro:
            return "com.tencent.xin.sharetimeline";
        case .qq, .qzone:
            return "com.tencent.mqq.ShareExtension";
        case .weibo:
            return SLServiceTypeSinaWeibo;
        case .download:
            return "com.download";
        default:
            return "";
        }
    }
    var channelSchema:String {
        switch self.channel {
        case .timeline, .session,.minipro:
            return "weixin://";
        case .qq, .qzone:
            return "mqq://";
        case .weibo:
            return "sinaweibo://";
        default:
            return "";
        }
    }
    var channelTips:String {
        switch self.channel {
        case .timeline:
            return "去微信朋友圈黏贴";
        case .session:
            return "发送给微信好友";
        case .qq:
            return "发送给QQ好友";
        case .weibo:
            return "去新浪微博黏贴";
        case .qzone:
            return "去QQ空间黏贴";
        default:
            return "";
        }
    }
    var showCommentTips:Bool {
        switch self.channel {
        case .timeline, .weibo, .qzone:
            return true;
        case .qq, .session:
            return false;
        default:
            return false;
        }
    }
    //是否使用单张拼接图分享
    var showSingleImage:Bool {
        switch self.channel {
        case .session, .qq, .weibo:
            return true;
        case .timeline, .qzone:
            return false;
        default:
            return false;
        }
    }
}
