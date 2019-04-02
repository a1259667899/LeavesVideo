//
//  NetworkFilterOrganizer.swift
//  LeavesVideo
//
//  Created by Sinder on 2018/11/13.
//  Copyright © 2018 Sinder. All rights reserved.
//

import Foundation
import Alamofire
class NetworkFilterOrganizer {
    /**
    标记是否已经获取到正确的baseUrl
    */
    private  var  ret = false

    /**
    待执行的任务集合
    */
    private var waitingOperations:[noneAttributeClosure] = []

    static let shared = NetworkFilterOrganizer()
    
    /**
     发送post请求
     */
    func postWithArguements(url:String,header:[String:String],parameters:Parameters,completionCallBack:@escaping ()->(),sucessCallBack:@escaping (_ result:[String:Any])->(),failWithError:@escaping (_ error:Error)->()) {
        self.validBaseUrl {
            Network.shared.postWithArguements(url: baseUrl + "/luoye_user/" + url, header: header, parameters: parameters, completionCallBack: {
                completionCallBack()
            }, sucessCallBack: { (response) in
                sucessCallBack(response)
            }) { (error) in
                failWithError(error)
            }
        }
    }
    
    /**
     普通get请求
     */
    func getWithArguements(url:String,parameters:Parameters,headers:[String:String],sucessCallBack:@escaping (_ result:Parameters)->(),failWithError:@escaping (_ error:Error)->()) {
        self.validBaseUrl {
            Network.shared.getWithArguements(url: baseUrl + "/luoye_user/" + url, parameters: parameters, headers: headers, sucessCallBack: { (response) in
                sucessCallBack(response)
            }) { (error) in
                failWithError(error)
            }
        }
    }

    /**
    检查正确的ip是否返回
    */
    private  func validBaseUrl(successHandler: @escaping noneAttributeClosure) {
        if self.ret == false{
            self.waitingOperations.append(successHandler)
            self.getCorrectIpAddress(successHandler:
                self.doWatingOperation
            )
        }else {
            successHandler()
        }
    }

    /**
    请求IP地址
    */
    private  func getCorrectIpAddress(successHandler: @escaping noneAttributeClosure){
        Network.shared.getWithArguements(url: baseUrl + "tbt_user/domain/", parameters: [:], headers: [:], sucessCallBack: {[weak self] response in
                self?.ret = true
             let dic = response["data"] as! NSDictionary
            baseUrl = dic["domain"] as! String
            successHandler()
         }, failWithError: { (v: Error) in

          })
    }

    /**
    执行待办任务
    */
    private func doWatingOperation(){
        for item in waitingOperations {
            item()
        }
        self.waitingOperations.removeAll()
    }
}
