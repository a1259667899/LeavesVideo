//
//  WKWebViewViewController.swift
//  BoardCast-swift
//
//  Created by admin on 2017/10/26.
//  Copyright © 2017年 admin. All rights reserved.
//

import UIKit
import WebKit
import Alamofire
import WebViewJavascriptBridge
class WKWebViewViewController: BaseViewController,WKNavigationDelegate,WKUIDelegate {
    var url = ""
    var titleS = ""
    /**
     分享显示的图片
     */
    fileprivate var thumbURL = ""
    /**
     是否可以分享
     */
    fileprivate var canShare = false
    /**
     用于分享的url
     */
    fileprivate var shareUrl = ""
    //标记页面是否已经加载完成了
    fileprivate var hasLoaded = false
    //进度条
    fileprivate var progressView:UIProgressView = UIProgressView.init(frame: CGRect.init(x: 0, y: 0, width: kScreenWidth, height: 3))
    fileprivate lazy var webView:WKWebView = {
       let webview = WKWebView.init(frame: CGRect.init(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight - kNavibarH - kSafeAreaBottomH))
        webview.uiDelegate = self
        webview.navigationDelegate = self
        return webview
    }()
    fileprivate lazy var bridge:WKWebViewJavascriptBridge = {
        let brid = WKWebViewJavascriptBridge.init(for: self.webView)
        return brid!
    }()
    /**
     初始化参数,allowShare:是否允许分享
     */
    func setupParamerters(urlP:String,titleP:String,thumb:String,allowShare:Bool){
        self.url = urlP
        self.titleS = titleP == "" ? "活动" : titleP
        self.canShare = allowShare
        self.thumbURL = thumb
        self.shareUrl = urlP.contains("?") ? self.url.components(separatedBy: "?").first! : urlP
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        layoutNVBar()
        layoutWebView()
    }
    func layoutNVBar(){
        self.navigationItem.rightBarButtonItem = nil
        self.titleStr = titleS

        if #available(iOS 11.0, *) {

        }else{
            self.edgesForExtendedLayout = UIRectEdge.init(rawValue: 0)
        }
//        if url.contains("complain.html") {
//            let rightButton = UIBarButtonItem.init(image: UIImage.init(named: "上传")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(commitComplane))
//            self.navigationItem.rightBarButtonItem = rightButton
//        }else{
//            //如果可以分享
//            let shareButton = UIBarButtonItem.init(image: UIImage.init(named: "转发")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(shareAction))
//            self.navigationItem.rightBarButtonItem = shareButton
//        }
    }
    func layoutWebView(){
        self.view.addSubview(self.webView)
        self.webView.snp.makeConstraints { (make) in
            make.edges.equalTo(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        }
        if URL.init(string: url) != nil{
            self.webView.load(URLRequest.init(url:URL.init(string: url)!))
        }
        self.view.addSubview(progressView)
        self.progressView.tintColor = UIColor.orange
        self.progressView.trackTintColor = UIColor.white
        self.webView.addObserver(self, forKeyPath: "estimatedProgress", options: NSKeyValueObservingOptions.new, context: nil)
        self.webView.addObserver(self, forKeyPath: "title", options: NSKeyValueObservingOptions.new, context: nil)
        self.bridge.registerHandler("share") {[weak self] (data, callBack) in
            let res = data as! Parameters
            debugPrint("swift响应操作：参数为\(res["shareSrc"]!)")
//            self?.shareUrl = res["shareSrc"] as! String
//            self?.shareAction()
            callBack!(data)
        }
        self.bridge.registerHandler("toFinishIOS") {[weak self] (data, callBack) in
            debugPrint("swift响应页面返回操作")
            self?.navigationController?.popViewController(animated: true)
            callBack!(data)
        }
        self.bridge.callHandler("JS Echo", data:"Hi from swift to JS!") { (response) in

        }
    }
    
    //MARK:- WKNavigationDelegate
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        if webView.canGoBack{//如果页面可以返回上一级的H5

        }else{
            
        }
    }
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        
    }
    //MARK: - WebViewUIDelegate
    func webView(_ webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping () -> Void) {
        PopViewUtil.alert(title: "提示", message: message, leftTitle: "", rightTitle: "OK", leftHandler: {

        }) {
            completionHandler()
        }

    }
    //监听进度
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "estimatedProgress" {
            let number:NSNumber = change![NSKeyValueChangeKey.newKey] as! NSNumber
            let newProgress = number.floatValue
            if newProgress == 1{
                self.hasLoaded = true
                self.progressView.isHidden = true
                self.progressView.setProgress(0, animated: false)
            }else{
                self.hasLoaded = false
                self.progressView.isHidden = false
                self.progressView.setProgress(newProgress, animated: true)
            }
        }else if keyPath == "title"{
            self.titleStr = self.webView.title
            self.titleS = self.webView.title!
        }else{
            super.observeValue(forKeyPath: keyPath, of: object, change: change, context: context)
        }
    }
    
    //https验证
//    func webView(_ webView: WKWebView, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
//        if challenge.protectionSpace.authenticationMethod == NSURLAuthenticationMethodServerTrust{
//            let card:URLCredential = URLCredential.init(trust: challenge.protectionSpace.serverTrust!)
//            completionHandler(URLSession.AuthChallengeDisposition.useCredential,card)
//        }
//    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
//        self.webView.load(URLRequest.init(url: URL.init(string: "about:blank")!))
    }
    deinit {
        self.webView.removeObserver(self, forKeyPath: "estimatedProgress")
        self.webView.removeObserver(self, forKeyPath: "title")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
