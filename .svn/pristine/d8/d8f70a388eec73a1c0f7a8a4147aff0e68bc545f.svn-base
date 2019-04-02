//
//  LVVideoCollectionModel.swift
//  LeavesVideo
//
//  Created by Sinder on 2018/10/26.
//  Copyright © 2018 Sinder. All rights reserved.
//

import Foundation
class LVVideoCollectionService: BaseNetworkService,PostListNetworkProtocol{
    var currentPage = 1
    var pageSize = 20
    
    override func setRequestUrl() -> String {
        return "user/collectList"
    }
    override func setRequestBody() -> [String : Any] {
        return ["currentPage": currentPage , "pageSize":pageSize]
    }
    
    
}
