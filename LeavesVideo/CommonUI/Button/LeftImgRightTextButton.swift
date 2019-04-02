//
//  LeftImgRightTextButton.swift
//  LeavesVideo
//
//  Created by Sinder on 2018/10/19.
//  Copyright © 2018 Sinder. All rights reserved.
//

import UIKit

class MineLeftImgRightTextButton: ExtendButton {
    
    override func titleRect(forContentRect contentRect: CGRect) -> CGRect {
        return CGRect(x: 51, y: 0, width: contentRect.width - 21 - 30, height: contentRect.height)
    }
    override func imageRect(forContentRect contentRect: CGRect) -> CGRect {
        return CGRect(x: 15, y: (contentRect.height - 21)/2, width: 21, height: 21)
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
