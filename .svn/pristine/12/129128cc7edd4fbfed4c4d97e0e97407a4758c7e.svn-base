//
//  UserUtil.swift
//  LeavesVideo
//
//  Created by Sinder on 2018/10/18.
//  Copyright © 2018 Sinder. All rights reserved.
//

import Foundation
import CoreData
class UserUtil {
    class func getContext()->NSManagedObjectContext {
        return CoreDataStack.shared.context
    }
    class func fatchUserRequest()->NSFetchRequest<NSFetchRequestResult>{
        return SysUser.fetchRequest()
    }
    /**是否登录*/
    class func isLogin()->Bool{
        do{
            let results = try UserUtil.getContext().fetch(UserUtil.fatchUserRequest())
            return results.count > 0
        }catch{
            return false
        }
    }
    /**获取登录用户*/
    class func getCurrentUser()->SysUser{
        do {
            let results:[SysUser] = try UserUtil.getContext().fetch(UserUtil.fatchUserRequest()) as! [SysUser]
            return results[0]
        } catch {
            fatalError();
        }
    }
    /**添加登录用户*/
    class func insertUser(user:User){
        let person = NSEntityDescription.insertNewObject(forEntityName: "SysUser", into: UserUtil.getContext()) as! SysUser
        person.nickName = user.nickName
        person.icon = user.icon
        person.token = user.token
        person.id = user.id
        CoreDataStack.shared.saveContext()
    }
    /**删除用户*/
    class func deleteUser(){
        //先判断是否登录
        if UserUtil.isLogin() {
            // 这里直接调用上面获取所有数据的方法
            let result = UserUtil.getCurrentUser()
            // 删除所有数据
            UserUtil.getContext().delete(result)
            CoreDataStack.shared.saveContext()
        }
    }
    /**更新用户的token*/
    class func updateUserToken(token:String){
        do {
            // 拿到符合条件的所有数据
            let result:SysUser = try UserUtil.getContext().fetch(UserUtil.fatchUserRequest())[0] as! SysUser
            result.token = token
        } catch {
            fatalError();
        }
        CoreDataStack.shared.saveContext()
    }
    /**更新用户的昵称*/
    class func updateUserNickName(name:String){
        do {
            // 拿到符合条件的所有数据
            let result:SysUser = try UserUtil.getContext().fetch(UserUtil.fatchUserRequest())[0] as! SysUser
            result.nickName = name
        } catch {
            fatalError();
        }
        CoreDataStack.shared.saveContext()
    }
    /**更新用户头像*/
    class func updateUserIcon(url:String){
        do {
            // 拿到符合条件的所有数据
            let result:SysUser = try UserUtil.getContext().fetch(UserUtil.fatchUserRequest())[0] as! SysUser
            result.icon = url
        } catch {
            fatalError();
        }
        CoreDataStack.shared.saveContext()
    }
    /**整体更新用户信息*/
    class func updataUser(user:User){
        let fetchRequest: NSFetchRequest = SysUser.fetchRequest()
        let context = CoreDataStack.shared.context
        do {
            // 拿到符合条件的所有数据
            let result = try context.fetch(fetchRequest)[0]
            result.token = user.token
            result.icon = user.icon
            result.id = user.id
            result.nickName = user.nickName
        } catch {
            fatalError();
        }
        CoreDataStack.shared.saveContext()
    }
}
