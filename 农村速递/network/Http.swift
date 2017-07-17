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
    static let postip : String = "http://192.168.3.23:8083/hskj-express/"
    
    // 发送Http请求
    static func Post(url: String, data: Parameters, call:@escaping (JSON)->Bool){
        print(data,"此次请求的地址 = ", url);
        Alamofire.request(url, method: .post, parameters: data).response { response1 in
            let data = response1.data
            let utf8Text = String(data: data!, encoding: .utf8)
            print("response", JSON(parseJSON: utf8Text!))
            call(JSON(parseJSON: utf8Text!))
        }
    }
    
    
    
    //    请求文本显示
    static let getshows: String               = Http.postip + "getappshow"
    //    请求登陆
    static let loginurl: String               =  Http.postip + "loginbypwd"
    //    修改用户信息
    static let changemsg: String              =  Http.postip             + "changepersonmessage"
    //    注册的时候发送验证码
    static let sendregistercode : String      = Http.postip      + "getcode"
    //    验证发送的验证码是否正确
    static let verilphoneoreamilcode : String = Http.postip + "vailphoneoremailcode"
    //    修改密码
    static let changepassword : String        = Http.postip        + "changepassword"
    //    添加联系人
    static let addreceiveperson : String      = Http.postip      + "addreceiveperson"
    //    添加收件地址
    static let addreceiveaddress : String     = Http.postip     + "addreceiveaddress"
    //    发送数据请求
    static let sendalldataaction : String     = Http.postip     + "sendalldataaction"
    //    删除数据请求
    static let deleteactionaction : String    = Http.postip    + "deleteactionaction"
    //    关于农村速递
    static let aboutncsd : String             = Http.postip    + "aboutncsd"
    //    验证身份证
    static let veriidcard : String            = Http.postip   + "veriidcard"
    //    提交快递请求信息
    static let senditemrequestaction : String = Http.postip + "senditemrequestaction"
    //    查询快递信息
    static let selectorderaction : String = Http.postip + "selectorderaction"
    //    获得某种类型的订单
    static let selecttypeorderaction : String = Http.postip + "selecttypeorderaction"
}
