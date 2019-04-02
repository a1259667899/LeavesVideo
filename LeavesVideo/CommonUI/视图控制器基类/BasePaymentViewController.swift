//
//  BasePaymentViewController.swift
//  BoardCast
//
//  Created by admin on 2018/5/14.
//  Copyright © 2018年 admin. All rights reserved.
//

import UIKit
enum BasePaymentViewControllerShowType:Int {
    case nightType
    case lightType
}
class BasePaymentViewController: UIViewController {
    var titleLab = MarqueeView.init(frame: CGRect.init(x: 0, y: 5, width: kScreenWidth - 100, height: 20))
    var subTitlLabel:UILabel?
    var rightBtnCallBack:noneAttributeClosure?
    var backBtnCallBack:noneAttributeClosure?

    var titleStr: String? {
        didSet{
            titleLab.setTitle(title: titleStr!)
        }
    }
    var rightTipTitle:String?{
        didSet{
            rightBarButton.setAttributedTitle(NSAttributedString.init(string: rightTipTitle!, attributes: [NSAttributedString.Key.font:UIFont.init(name: XDFont.pingFangSCRegular.rawValue, size: 14)!,NSAttributedString.Key.foregroundColor:UIColor(hexString: "#888888")!]), for: .normal)
        }
    }
    /**
     显示类型，是黑色还是白色
     */
    var showType:BasePaymentViewControllerShowType = .nightType{
        didSet{
            
        }
    }
    /**
     导航背景图片
     */
    private lazy var backgroundImage:UIImage = {
        let image = UIImage.init()
        return image
    }()
    /**
     返回按钮图片
     */
    private lazy var backImage:UIImage = {
        let image = UIImage.init()
        return image
    }()
    private lazy var rightBarButton:ExtendButton = {
        let button = ExtendButton.init(frame: CGRect.init(x: 0, y: 0, width: 55, height: 13))
        button.addTarget(self, action: #selector(rightBtnClicked), for: .touchUpInside)
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white

        //右侧按钮
        let rightBarButtonItem:UIBarButtonItem = UIBarButtonItem.init(customView: self.rightBarButton)
        self.navigationItem.rightBarButtonItem = rightBarButtonItem
    }
    @objc func rightBtnClicked() {
        if rightBtnCallBack != nil{
            rightBtnCallBack!()
        }
    }
    @objc func backBtnClcked(){
        weak var weakSelf = self
        if self.backBtnCallBack != nil{
            weakSelf?.backBtnCallBack!()
        }else{
            weakSelf?.navigationController?.popViewController(animated: true)
        }

    }
    /**
     根据showType显示导航
     */
    func showNVBarByShowType(){
        if self.showType == .nightType{
            backgroundImage = UIImage.createImageWithColor(color: UIColor(hexString: "#333334")!)
            backImage = UIImage.init(named:"back-gold")!
            titleLab.color = UIColor(hexString: "#E3B355")!
        }else if self.showType == .lightType{
            backgroundImage = UIImage.init(named: "导航背景")!
            backImage = UIImage.init(named: "BACK")!
            titleLab.color = UIColor(hexString: "#333334")!
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.rt_disableInteractivePop = false

        //自定义导航背景图
        self.showNVBarByShowType()
        self.navigationController?.navigationBar.setBackgroundImage(backgroundImage.withRenderingMode(.alwaysOriginal), for: .default)
        //自定义返回按钮
        let leftBarButtonItem:UIBarButtonItem = UIBarButtonItem.init(image: self.backImage.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(backBtnClcked))
        self.navigationItem.leftBarButtonItem = leftBarButtonItem
        self.navigationController?.edgesForExtendedLayout = UIRectEdge(rawValue: 0)
        /**
         标题
         */
        titleLab.font = UIFont.init(name: XDFont.pingFangSCMedium.rawValue, size: 18)!
        self.navigationItem.titleView = titleLab

        self.navigationController?.navigationBar.clipsToBounds = false
        self.navigationController?.navigationBar.barStyle = .default

        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.barTintColor = UIColor.white
        //消除横线
        self.navigationController?.navigationBar.shadowImage = UIImage.init()
        //        if (self.navigationController?.viewControllers.count)! > 1 {
        // 记录系统返回手势的代理
//        gesDelegate = self.navigationController?.interactivePopGestureRecognizer?.delegate
        // 设置系统返回手势的代理为当前控制器
//        self.navigationController?.interactivePopGestureRecognizer?.delegate = self;
        //        }
    }
    override func rt_customBackItem(withTarget target: Any!, action: Selector!) -> UIBarButtonItem! {
        return UIBarButtonItem.init(image: UIImage.init(named: "BACK")?.withRenderingMode(.alwaysOriginal), style: UIBarButtonItem.Style.plain, target: target, action: action)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
//        self.navigationController?.interactivePopGestureRecognizer?.delegate = gesDelegate
    }
    deinit {
        debugPrint("释放控制器:\(self.classForCoder)")
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
