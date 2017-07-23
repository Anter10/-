//
//  LifeNavigationView.swift
//  农村速递
//
//  Created by 郭有超 on 2017/7/23.
//  Copyright © 2017年 郭有超. All rights reserved.
//

import UIKit

class LifeNavigationView: UINavigationController {
    var controller : LifeTableView = LifeTableView()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.show( controller, sender: nil)
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
