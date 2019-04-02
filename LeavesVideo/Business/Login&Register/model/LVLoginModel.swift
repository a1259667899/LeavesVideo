//
//  LVLoginModel.swift
//  LeavesVideo
//
//  Created by Sinder on 2018/10/18.
//  Copyright © 2018 Sinder. All rights reserved.
//

import Foundation
import HandyJSON
struct User:HandyJSON {
    var createTime = ""
    var description = ""
    var email = ""
    var id = "sadsadsa"
    var lastLoginTime = ""
    var mobilePhone = ""
    var nickName = "dgdfgdfdasf"
    var password = ""
    var portrait = ""
    var roleCode = ""
    var status = 0
    var updateTime = ""
    var userName = ""
    var token = "we2132432453"
    var icon = "2312312"
}
struct DownloadCoutItem: HandyJSON {
    var downloadNum: Int = 0
}
class LVLoginModel: BaseNetworkService,PostBeenNetworkProtocol {
    var email = ""
    var password = ""
    
    override func setRequestUrl() -> String {
        return "user/login"
    }
    override func setRequestBody() -> [String : Any] {
        return ["password": self.password, "email": self.email]
    }
}
class LVDownloadCountModel: BaseNetworkService,GetBeenNetworkProtocol{
    
    override func setRequestUrl() -> String {
        return "user/downloadNum"
    }
    override func setRequestBody() -> [String : Any] {
        return [:]
    }
}
