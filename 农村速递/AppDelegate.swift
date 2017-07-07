//
//  AppDelegate.swift
//  农村速递
//
//  Created by 郭有超 on 2017/6/17.
//  Copyright © 2017年 郭有超. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
 

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let para : Parameters = Parameters()
        
        Http.Post(url: Http.getshows, data: para, call: callback)
        
        
        sleep(5)
        return true
    }
    
    func callback(data: JSON) -> Bool {
        
        
        // 处理请求得到的数据
        // APP 的显示数据
        // 首页的显示数据
        let firstdata = data[1]
        let fsdata    = firstdata["applan"+UserData.lantype]
        let fiddata    = firstdata["appids"]
        UserData.fshowdics = UserData.converJSONTOStringArray(jsonData: fsdata)
        UserData.fshowids  = UserData.converJSONTOIntArray(jsonData: fiddata)
        
        
        // 个人中心显示数据
        let pertdata = data[0]
        let psdata    = pertdata["applan"+UserData.lantype]
        let piddata    = pertdata["appids"]
        UserData.showdics = UserData.converJSONTOStringArray(jsonData: psdata)
        UserData.showids  = UserData.converJSONTOIntArray(jsonData: piddata)
        
        // 　个人资料显示
        let permtdata   = data[2]
        let keys        = permtdata["applan"+UserData.lantype]
        let pmiddata    = permtdata["appids"]
        UserData.getUD().personmsg.keys = UserData.converJSONTOStringArray(jsonData: keys)
        UserData.getUD().personmsg.tags = UserData.converJSONTOIntArray(jsonData: pmiddata)
        
        // 设置里面的显示
        let edittdata        = data[3]
        let editshows        = edittdata["applan"+UserData.lantype]
        let editshowids      = edittdata["appids"]
        UserData.getUD().editdata.edits = UserData.converJSONTOStringArray(jsonData: editshows)
        UserData.getUD().editdata.editids = UserData.converJSONTOIntArray(jsonData: editshowids)
        
        // 身份验证显示
        let versdata        = data[5]
        UserData.getUD().verificationshows = UserData.converJSONTOStringArray(jsonData: versdata["applan"+UserData.lantype])
        
        // 输入框提示信息
        let tplaceholders = data[4]
        UserData.placeholders = UserData.converJSONTOStringArray(jsonData: tplaceholders["applan"+UserData.lantype])
        
        // 基础文本显示
        let showtexts = data[6]
        UserData.appshowtexts = UserData.converJSONTOStringArray(jsonData: showtexts["applan"+UserData.lantype])
        print(UserData.placeholders,"当前的显示数据323112 = ",UserData.appshowtexts)
        
        let loginshowtexts = data[7]
        UserData.loginshows = UserData.converJSONTOStringArray(jsonData: loginshowtexts["applan"+UserData.lantype])
        // 订单
        UserData.ordershows = UserData.converJSONTOStringArray(jsonData: data[8]["applan"+UserData.lantype])
        UserData.ordershowids = UserData.converJSONTOIntArray(jsonData: data[8]["applan"+UserData.lantype])
        print("ordershows = ", data[8])
        return true
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
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

