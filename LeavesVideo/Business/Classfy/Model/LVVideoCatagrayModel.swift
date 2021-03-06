//
//  LVVideoCatagrayModel.swift
//  LeavesVideo
//
//  Created by Sinder on 2018/10/26.
//  Copyright © 2018 Sinder. All rights reserved.
//

import Foundation
import HandyJSON
struct LVCatagrayItem:HandyJSON {
    var categoryId = ""
    var categoryName = ""
    var categoryIcon = ""
    var subList:[LVCatagrayItem] = []
}
class LVVideoCatagrayRecommandModel: BaseNetworkService,GetListNetworkProtocol{
    
    override func setRequestUrl() -> String {
        return "cat/spread"
    }
    override func setRequestBody() -> [String : Any] {
        return [:]
    }
    
    
}
class LVVideoCatagrayListModel: BaseNetworkService,GetListNetworkProtocol {
    
    override func setRequestUrl() -> String {
        return "cat/list"
    }
    override func setRequestBody() -> [String : Any] {
        return [:]
    }
    
    
}
