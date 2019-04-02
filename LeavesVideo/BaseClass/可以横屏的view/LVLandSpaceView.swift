//
//  LVLandSpaceView.swift
//  LeavesVideo
//
//  Created by Sinder on 2018/10/24.
//  Copyright © 2018 Sinder. All rights reserved.
//

import UIKit
enum LVLandSpaceViewState:Int {
    case small          = 0
    case animating
    case fullScreen
}
class LVLandSpaceView: UIView {

    /**
     记录小屏时的parentView
     */
    var parentView:UIView = UIView.init()
    
    /**
     记录小屏时的frame
     */
    var originalFrame:CGRect = CGRect(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight)
    
    var transFormState:LVLandSpaceViewState = .small
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.blue
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
