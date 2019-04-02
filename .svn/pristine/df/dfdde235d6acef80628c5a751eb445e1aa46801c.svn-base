//
//  BaseModel.swift
//  LeavesVideo
//
//  Created by Sinder on 2018/11/2.
//  Copyright © 2018 Sinder. All rights reserved.
//

import Foundation
class BaseNetworkService: CancelNetworkProtocol{
    var url = ""
    var requestUrl: String?
    
    func setRequestBody() -> [String : Any] {
        return [:]
    }
    func setRequestUrl() -> String {
        return self.requestUrl!
    }
    deinit {
        terminateNetwork()
    }
}
