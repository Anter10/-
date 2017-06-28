//
//  Http.swift
//  农村速递
//
//  Created by 郭有超 on 2017/6/20.
//  Copyright © 2017年 郭有超. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
class Http  {
    // 请求地址
    static let postip : String = "http://192.168.1.11:8083/hskj-express/"
    
    // 发送Http请求
    static func Post(url: String, data: Parameters, call:@escaping (JSON)->Bool){
        Alamofire.request(url, method: .post, parameters: data).response { response1 in
            let data = response1.data
            let utf8Text = String(data: data!, encoding: .utf8)
            print("response", JSON(parseJSON: utf8Text!))
            call(JSON(parseJSON: utf8Text!))
        }
    }
    
//    请求文本显示
    static let getshows: String = Http.postip + "getappshow"
//    请求登陆
    static let loginurl: String =  Http.postip + "postlogin"
    
}
