//
//  AppDelegate.swift
//  LeavesVideo
//
//  Created by Sinder on 2018/10/17.
//  Copyright © 2018 Sinder. All rights reserved.
//

import UIKit
import CoreData
import IQKeyboardManagerSwift
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate , WXApiDelegate, XHLaunchAdDelegate{

    var window: UIWindow?

    var blockRotation = false

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.setRootViewController()
        self.setupOptions(options: launchOptions)
        self.getLanguageLocation()
        self.setUPDownload()
        self.setUPLaunchAD()
        IQKeyboardManager.shared.enable = true
        return true
    }
    
    func application(_ application: UIApplication, handleOpen url: URL) -> Bool {
        
        return WXApi.handleOpen(url, delegate: self);
    }
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        YCDownloadManager.resumeAllDownloadTask()
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
        CoreDataStack.shared.saveContext()
    }

}

