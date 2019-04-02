//
//  LGP_ShareChannelView.swift
//  Investment
//
//  Created by 方加会 on 2018/7/11.
//  Copyright © 2018年 方加会. All rights reserved.
//

import UIKit

typealias LVShareChannelViewCompletion = (MSShareChannelItem) -> ();
let wechatColor = UIColor(hexString: "#49CC8E")!;

class LVShareChannelView: UIView {
    var completion:LVShareChannelViewCompletion?
    
    class func show(_ callback:@escaping LVShareChannelViewCompletion) {
        let mask = UIControl(frame:UIScreen.main.bounds);
        mask.backgroundColor = UIColor.init(white: 0, alpha: 0.5);
        mask.isUserInteractionEnabled = true;
        
        var view = LVShareChannelView.init(frame: CGRect(x: 10, y: 0, width: kScreenWidth - 20, height: 0));
        view = LVShareChannelView.init(frame: CGRect(x: 10, y: 0, width: kScreenWidth - 20, height: 133));//原始值为133
        view.completion = callback;
        view.top = mask.height;
        
        mask.addSubview(view);
        mask.addTarget(view, action: #selector(doChannelSelected(sender:)), for: .touchUpInside);
        UIApplication.shared.keyWindow?.addSubview(mask);
        
        UIView.animate(withDuration: 0.3) {
            view.bottom = mask.height - 10;
        }
    }
    
    func dismiss() {
        self.superview?.removeFromSuperview();
        self.removeFromSuperview();
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame);
        self.layer.cornerRadius = 4;
        self.layer.backgroundColor = UIColor.white.cgColor;
        
        self.titleLabel.text = "分享到";
        self.titleLabel.font = UIFont.systemFont(ofSize: 16);
        self.titleLabel.textColor = UIColor.black;
        self.titleLabel.sizeToFit();
        self.titleLabel.top = 15;
        self.titleLabel.centerX = frame.width / 2;
        
        let marginX = (frame.width - 55 * 3) / 4;
        var offsetX = marginX;
        for channel in type(of: self).generateChannelsToShare() {
            let button = self.generateButton(channel: channel);
            if (channel == .qzone){
                button.origin = CGPoint.init(x: marginX, y: self.titleLabel.bottom + 10 + 75 + 10);
                self.addSubview(button);
            } else {
                button.origin = CGPoint.init(x: offsetX, y: self.titleLabel.bottom + 10);
                self.addSubview(button);
                offsetX += marginX + button.width;
            }
        }
        
        self.addSubview(self.titleLabel);
    }
    func generateButton(channel:MSShareChannel) -> UIButton {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 55, height: 75));
        button.titleEdgeInsets = UIEdgeInsets.init(top: 62, left: -45, bottom: 0, right: 0);
        button.imageEdgeInsets = UIEdgeInsets.init(top: -20, left: 5, bottom: 0, right: 0);
        button.titleLabel?.font = UIFont.systemFont(ofSize: 10);
        button.setTitleColor(UIColor.black, for: .normal);
        button.tag = channel.rawValue;
        button.addTarget(self, action: #selector(doChannelSelected(sender:)), for: .touchUpInside);
        switch channel {
        case .download:
            button.setImage(UIImage.init(named: "downLoadImage"), for: .normal);
            button.setTitle("保存图片", for: .normal);
        case .session:
            button.setImage(UIImage.init(named: "MSShareChannelSession"), for: .normal);
            button.setTitle("微信好友", for: .normal);
        case .timeline:
            button.setImage(UIImage.init(named: "MSShareChannelTimeline"), for: .normal);
            button.setTitle("朋友圈", for: .normal);
        case .minipro:
            button.setImage(UIImage.init(named: "WXMiniPro"), for: .normal);
            button.setTitle("小程序卡片", for: .normal);
            //        case .qq:
            //            button.setImage(UIImage.init(named: "MSShareChannelQQ"), for: .normal);
            //            button.setTitle("QQ好友", for: .normal);
            //        case .qzone:
            //            button.setImage(UIImage.init(named: "MSShareChannelQZone"), for: .normal);
            //            button.setTitle("QQ空间", for: .normal);
            //        case .weibo:
            //            button.setImage(UIImage.init(named: "MSShareChannelWeibo"), for: .normal);
            //            button.setTitle("新浪微博", for: .normal);
            
        default: break
        }
        button.titleLabel?.centerX = button.width / 2;
        return button;
    }
    
    class func generateChannelsToShare() -> [MSShareChannel] {
        var ret = [MSShareChannel]();
        ret.append(.download);
        if UIApplication.shared.canOpenURL(URL.init(string: "weixin://")!) {
            ret.append(.session);
            ret.append(.timeline);
        }
        return ret;
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
    }
    var titleLabel = UILabel();
    var sessionButton = UIButton();
    var timelineButton = UIButton();
    @objc func doChannelSelected(sender:UIButton) {
        self.dismiss();
        if self.completion != nil {
            self.completion!(MSShareChannelItem.init(channel: sender.tag));
        }
    }
}
