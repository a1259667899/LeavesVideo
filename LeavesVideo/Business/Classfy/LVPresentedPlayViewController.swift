//
//  LVPresentedPlayViewController.swift
//  LeavesVideo
//
//  Created by Sinder on 2018/10/24.
//  Copyright © 2018 Sinder. All rights reserved.
//

import UIKit

class LVPresentedPlayViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.black
        //强制k横屏
        self.navigationController?.navigationBar.isHidden = true
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.blockRotation = true
        DeviceTool.interfaceOrientation(.landscapeRight)
    }
    deinit{
        debugPrint("LVPresentedPlayViewController释放")
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
