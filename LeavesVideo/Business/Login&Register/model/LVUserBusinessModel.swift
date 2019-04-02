//
//  LVUserBusinessModel.swift
//  LeavesVideo
//
//  Created by Sinder on 2018/10/18.
//  Copyright © 2018 Sinder. All rights reserved.
//

import Foundation
class LVUserBusinessModel: PostBeenNetworkProtocol {
    func setRequestUrl() -> String {
        return self.requestUrl!
    }
    
    var requestUrl: String? = "user/nickName"
    func setName(name:String){
        requestUrl = ("user/nickName" + "/" + name).addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
    }
    func setRequestBody() -> [String : Any] {
        return [:]
    }
    
}
class LVUserHeaderImageModel: PostBeenNetworkProtocol,NetworkParametersProtocol {
    func setRequestUrl() -> String {
        return self.requestUrl!
    }
    
    var requestUrl: String? = ""

    func setRequestBody() -> [String : Any] {
        return [:]
    }
    //上传头像
    func uploadHeaderImage(images:[UIImage],successHandler:@escaping (_ ImageUrl:String)-> Void, failerHandler:@escaping ()-> Void){
        Network.shared.uploadImagesWithArguements(url: "user/icon", uploadImages: images, scale: 0.5, success: { (response:[String:Any]) in
            TBTHUD.dismiss()
            let data = response["data"] as! NSDictionary
            let url:String = data.value(forKey: "url") as! String
            successHandler(url)
        }) { (error) in
            failerHandler()
        }
    }
}
class LVUserValidTokenModel: BaseNetworkService{
    
    override func setRequestUrl() -> String {
        return "user/myInfo"
    }
    override func setRequestBody() -> [String : Any] {
        return [:]
    }
}
