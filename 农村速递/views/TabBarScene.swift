//
//  TabBarScene.swift
//  农村速递
//
//  Created by 郭有超 on 2017/6/22.
//  Copyright © 2017年 郭有超. All rights reserved.
//

import UIKit

class TabBarScene: UITabBarController {
    var mc  =  FirstNavigationView()
    var hc  =  PersonNavigationView()
    var lv  =  LifeNavigationView()
    var firstBar: UITabBarItem = UITabBarItem()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.groupTableViewBackground
        mc.tabBarItem.title = UserData.appshowtexts[0]
        mc.tabBarItem.image = UIImage(named: "home_64.png")
        mc.tabBarItem.selectedImage = UIImage(named: "home_64.png")
        
        hc.tabBarItem.title = UserData.appshowtexts[1]
        hc.tabBarItem.image = UIImage(named: "man_64.png")
        hc.tabBarItem.selectedImage = UIImage(named: "man_64.png")
        
        lv.tabBarItem.title = UserData.appshowtexts[17]
        
        lv.tabBarItem.image = UIImage(named: "life.png")
        lv.tabBarItem.selectedImage = UIImage(named: "life.png")
        
        let allController = [mc,lv,hc] as [UIViewController]
        self.viewControllers = allController as! [UIViewController]
        
        // Do any additional setup after loading the view.
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
