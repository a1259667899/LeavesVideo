//
//  NSObject+Protocol.swift
//  Investment
//
//  Created by XD on 2018/9/4.
//  Copyright © 2018年 方加会. All rights reserved.
//

import Foundation
import HandyJSON
import ZKProgressHUD
struct StringHandy:HandyJSON {
    var string = ""
}
protocol NetworkParametersProtocol {
    var  requestUrl: String?{set get}
    func setRequestUrl()-> String
    func setRequestBody()-> [String:Any]
}
protocol PostListNetworkProtocol:NetworkParametersProtocol {
    /**
     请求列表数据（post）
     */
    func startListRequest<T:HandyJSON>(successionHandler: @escaping ([T],_ total:Int) -> Void, failerHandler: @escaping () -> Void)
}
protocol PostBeenNetworkProtocol:NetworkParametersProtocol {
    /**
     请求非列表数据（post）
     */
    func startBeenRequest<T:HandyJSON>(successionHandler: @escaping (T) -> Void, failerHandler: @escaping () -> Void)
}
protocol GetListNetworkProtocol:NetworkParametersProtocol {
    /**
     请求列表数据(get)
     */
    func getListRequest<T:HandyJSON>(successionHandler: @escaping ([T],_ total:Int) -> Void, failerHandler: @escaping () -> Void)
}
protocol GetBeenNetworkProtocol:NetworkParametersProtocol {
    /**
     请求非列表数据（get）
     */
    func getBeenRequest<T:HandyJSON>(successionHandler: @escaping (T) -> Void, failerHandler: @escaping () -> Void)
}
protocol CancelNetworkProtocol:NetworkParametersProtocol {
    /**
     终止网络请求
     */
    func terminateNetwork()
}
extension PostListNetworkProtocol {
    //MARK: - ConcernNetworkProtocol
    /**
     请求列表数据(post)
     */
    func startListRequest<T:HandyJSON>(successionHandler: @escaping ([T],_ total:Int) -> Void, failerHandler: @escaping () -> Void){
       
        NetworkFilterOrganizer.shared.postWithArguements(url:setRequestUrl(), header: ["token": UserUtil.isLogin() ? UserUtil.getCurrentUser().token! : "","Content-Type":"application/json"], parameters: setRequestBody(), completionCallBack: {
            ZKProgressHUD.dismiss()
        }, sucessCallBack: { (response) in
            let dic = response["data"] as! NSDictionary
            let total = dic["total"] as! Int
            if let arr:[T] = [T].deserialize(from: dic["list"] as? NSArray) as? [T] {
                successionHandler(arr,total)
            }else{
                failerHandler()
            }
        }) { (error) in
            failerHandler()
        }
    }
}
extension PostBeenNetworkProtocol{
    /**
     请求非列表数据(post)
     */
    func startBeenRequest<T:HandyJSON>(successionHandler: @escaping (T) -> Void, failerHandler: @escaping () -> Void){
        NetworkFilterOrganizer.shared.postWithArguements(url:setRequestUrl(), header: ["token":UserUtil.isLogin() ? UserUtil.getCurrentUser().token! : "","Content-Type":"application/json"], parameters: setRequestBody(), completionCallBack: {
            ZKProgressHUD.dismiss()
        }, sucessCallBack: { (response) in
            if let been:T = T.deserialize(from: response["data"] as? NSDictionary) {
                successionHandler(been)
            }else {
                let been:T = T()
                successionHandler(been)
            }
        }) { (error) in
            failerHandler()
        }
    }
}
extension GetListNetworkProtocol{
    /**
     请求列表数据（get）
     */
    func getListRequest<T:HandyJSON>(successionHandler: @escaping ([T],_ total:Int) -> Void, failerHandler: @escaping () -> Void){
        NetworkFilterOrganizer.shared.getWithArguements(url:self.setRequestUrl(), parameters: self.setRequestBody(), headers: ["token":UserUtil.isLogin() ? UserUtil.getCurrentUser().token! : ""], sucessCallBack: { (response) in
            TBTHUD.dismiss()
            if let dic = response["data"] as? NSDictionary{
                let total = dic["total"] as! Int
                if let arr:[T] = [T].deserialize(from: dic["list"] as? NSArray) as? [T] {
                    successionHandler(arr,total)
                }else{
                    failerHandler()
                }
            }else{
                if let arr = response["data"] as? NSArray{
                    let result:[T] = ([T].deserialize(from: arr) as? [T])!
                    successionHandler(result,result.count)
                }
            }
           
        }) { (error) in
            TBTHUD.dismiss()
            failerHandler()
        }
    }
}
extension GetBeenNetworkProtocol{
    /**
     请求非列表数据（get）
     */
    func getBeenRequest<T:HandyJSON>(successionHandler: @escaping (T) -> Void, failerHandler: @escaping () -> Void){
        NetworkFilterOrganizer.shared.getWithArguements(url:self.setRequestUrl(), parameters: self.setRequestBody(), headers: ["token":UserUtil.isLogin() ? UserUtil.getCurrentUser().token! : ""], sucessCallBack: { (response) in
           TBTHUD.dismiss()
            if let been:T = T.deserialize(from: response["data"] as? NSDictionary) {
                successionHandler(been)
            }else {
                let been:T = T()
                successionHandler(been)
            }
        }) { (error) in
            TBTHUD.dismiss()
            failerHandler()
        }
    }
}


extension CancelNetworkProtocol where Self:NetworkParametersProtocol{
    func terminateNetwork(){
        Network.shared.cancleRequestWithUrlString(url: self.setRequestUrl())
    }
}

