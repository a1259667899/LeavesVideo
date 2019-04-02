//
//  Network.swift
//  AlamofrieTest
//
//  Created by XD on 2018/9/3.
//  Copyright © 2018年 XD. All rights reserved.
//

import UIKit
import Alamofire
import ZKProgressHUD
class Network: NSObject {
    /**
     创建单例对象
     */
    static let shared = Network()
    private lazy var sessionManager:SessionManager = {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 15
        let manager = Alamofire.SessionManager(configuration: configuration)
        return manager
    }()
    private override init() {
        super.init()
        
        //设置双向认证（https）
        //        sessionManager?.delegate.sessionDidReceiveChallenge = CertificateTrustUtil.alamofireCertificateTrust(session:challenge:)
    }
    /**
     发送post请求
     */
    func postWithArguements(url:String,header:[String:String],parameters:Parameters,completionCallBack:@escaping ()->(),sucessCallBack:@escaping (_ result:[String:Any])->(),failWithError:@escaping (_ error:Error)->()) {
        
        sessionManager.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: header).responseJSON { (response) in
            ZKProgressHUD.dismiss()
            completionCallBack()
            switch response.result{
            case .success:
                debugPrint(response)
                let res = response.result.value as! Parameters
                if !res.keys.contains("data"){//判断是否是正常的返回体
                    return
                }
                if res["code"] as! Int == 401{//判断是否是token失效
                    //t如果失效，就清除用户登录信息
                    UserUtil.deleteUser()
                    NotificationCenter.default.post(name: NotifyLogOut, object: nil)
                    return
                }
                if  res["success"] as! Bool == true{//判断请求是否成功
                    sucessCallBack(res)
                }else{
                    ZKProgressHUD.showError((res["msg"] as! String))
                }
            case .failure(let error):
                debugPrint(error)
                failWithError(error)
            }
        }
    }
    /**
     普通get请求
     */
    func getWithArguements(url:String,parameters:Parameters,headers:[String:String],sucessCallBack:@escaping (_ result:Parameters)->(),failWithError:@escaping (_ error:Error)->()) {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 15
        
        //       ConfigNetwork();
        sessionManager.request(url, method:.get, parameters: parameters, encoding: URLEncoding.default, headers: headers).responseJSON { response in
            TBTHUD.dismiss()
            switch response.result {
            case .success:
                debugPrint(response)
                let res = response.result.value as! Parameters
               if  res["success"] as! Bool == true{
                    sucessCallBack(response.result.value as! Parameters)
                }else{
                    ZKProgressHUD.showError((res["msg"] as! String))
                }
            case .failure(let error):
                debugPrint(error)
                failWithError(error)
            }
        }
    }
    //MARK:图片上传
    func uploadImagesWithArguements(url:String,uploadImages: [UIImage],scale: Double,success:@escaping (_ parameters:Parameters)->(),failWithError:@escaping (_ error:Error)->()) {
        
        var datas:Array<Data> = Array.init()
        
        //        let file = Bundle.main.path(forResource: "Mog", ofType: "png")
        for image:UIImage in uploadImages {
            //压缩上传
            let data = image.jpegData(compressionQuality: CGFloat(scale))
            datas.append(data!)
        }
        let headers = ["content-type":"multipart/form-data",
                       "token":""]
        sessionManager.upload(multipartFormData: { (multipartFormData) in
            //多张图片上传
            //            let flag = params["flag"]
            //            let userId = params["userId"]
            //
            //            multipartFormData.append((flag?.data(using: String.Encoding.utf8))!, withName: "flag")
            //            multipartFormData.append((userId?.data(using: String.Encoding.utf8))!, withName: "userId")
            
            for i in 0..<datas.count{
                //设置图片的名字
                let formatter = DateFormatter()
                formatter.dateFormat = "yyyyMMddHHmmss"
                let string = formatter.string(from: Date())
                let filename = "\(string).jpg"
                multipartFormData.append(datas[i], withName: "file", fileName: filename, mimeType: "image/jpeg")
            }
        }, to: url, headers: headers, encodingCompletion:{ encodingResult in
            
            switch encodingResult{
            case .success(request: let upload,_,_):
                upload.responseJSON(completionHandler: { (response) in
                    debugPrint(response)
                    if let value = response.result.value as? Parameters{
                        success(value)
                    }
                })
            case .failure(let error):
                debugPrint(error)
                failWithError(error)
            }
        })
    }
    /**
     取消指定url的网络请求
     */
    func cancleRequestWithUrlString(url:String){
        sessionManager.session.getAllTasks(completionHandler: { (tasks) in
            tasks.forEach({ (task) in
                if task.currentRequest?.url?.absoluteString == baseUrl + url{
                    task.cancel()
                }
            })
        })
    }
}
