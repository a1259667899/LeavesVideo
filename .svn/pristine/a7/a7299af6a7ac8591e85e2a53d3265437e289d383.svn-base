//
//  LVShareImageModel.swift
//  LeavesVideo
//
//  Created by Sinder on 2018/10/30.
//  Copyright © 2018 Sinder. All rights reserved.
//

import Foundation
import HandyJSON
struct LVShareItem: HandyJSON {
    var allInviteNum = ""
    var inviteCode = ""
    var inviteNum = ""
    var qrCodeUrl = ""
    var rewardRules: [String] = []
    init() {
        
    }
}
class LVShareImageModel: BaseNetworkService,GetBeenNetworkProtocol{
    
    override func setRequestUrl() -> String {
        return "user/inviteCode"
    }
    override func setRequestBody() -> [String : Any] {
        return [:]
    }
    
    
}
