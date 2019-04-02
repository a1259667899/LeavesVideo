//
//  LVHomeAlertModel.swift
//  LeavesVideo
//
//  Created by Sinder on 2018/10/31.
//  Copyright © 2018 Sinder. All rights reserved.
//

import Foundation
import HandyJSON
struct LVHomeAlertItem: HandyJSON {
    var content = ""
    var link = ""
    var iconUrl = ""
    var advertId = 2
    init() {
        
    }
}
class LVHomeAlertModel: GetBeenNetworkProtocol{
    var requestUrl: String?
    
    func setRequestUrl() -> String {
        return "advert/notice"
    }
    
    func setRequestBody() -> [String : Any] {
        return [:]
    }
}
class LVLaunchADModel: GetListNetworkProtocol{
    var requestUrl: String?
    
    
    func setRequestUrl() -> String {
        return "advert/ad"
    }
    
    func setRequestBody() -> [String : Any] {
        return [:]
    }
    
    
}
