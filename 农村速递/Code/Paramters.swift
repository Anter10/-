//
//  Paramters.swift
//  农村速递
//
//  Created by 郭有超 on 2017/6/27.
//  Copyright © 2017年 郭有超. All rights reserved.
//


import UIKit
import Foundation

import SwiftyJSON
import Alamofire

class Paramters {
    // 屏幕尺寸
    static let ScreenSize         = UIScreen.main.bounds
    // 屏幕中间
    static let ScreenCenter       = (Paramters.ScreenSize.width / 2, Paramters.ScreenSize.height / 2)
    // 屏幕宽的中间
    static let ScreenWidthCenter  = Paramters.ScreenSize.width  / 2
    // 屏幕高的中间
    static let ScreenHeightCenter = Paramters.ScreenSize.height / 2
    // 登录输入框的尺寸
    static let InputSize  = (Paramters.ScreenSize.width / 1.4, CGFloat(40))
    // 一般界面的按钮尺寸
    static let LoginButtonSize = (Paramters.ScreenSize.width, CGFloat(40))
    // 验证码输入框的大小
    static let CodeInputSize = (Paramters.ScreenWidthCenter - 40, CGFloat(40))
    // 发送验证码框的大小
    static let InputCodeButtonSize = ( CGFloat(160), CGFloat(35))
    
    
    
    
    
}
