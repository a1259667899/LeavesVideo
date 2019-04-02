//
//  LVMovieClassfyButton.swift
//  LeavesVideo
//
//  Created by Sinder on 2018/11/13.
//  Copyright © 2018 Sinder. All rights reserved.
//

import UIKit

class LVMovieClassfyButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.titleLabel?.textAlignment = .center
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func imageRect(forContentRect contentRect: CGRect) -> CGRect {
        return CGRect(x: 0, y: 0, width: self.bounds.width, height: self.bounds.width)
    }
    override func titleRect(forContentRect contentRect: CGRect) -> CGRect {
        return CGRect(x: 0, y: self.height - 20, width: self.width, height: 20)
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
