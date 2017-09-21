//
//  ShowTextMessage.swift
//  农村速递
//
//  Created by 郭有超 on 2017/9/10.
//  Copyright © 2017年 郭有超. All rights reserved.
//

import Foundation
import UIKit

enum ShowMessageType{
    case AutoHideMessage
    case ShowMessageHasButton
}

class ShowTextMessage {
    // 显示信息
    var message: String = ""
    // 显示在哪个控制器内
    var showViewController: UIViewController!
    // 提示框信息
    var alertController: UIAlertController?
    
    init(showViewController: UIViewController) {
        self.showViewController = showViewController
    }
}
