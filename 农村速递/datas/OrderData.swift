//
//  OrderData.swift
//  农村速递
//
//  Created by 郭有超 on 2017/6/18.
//  Copyright © 2017年 郭有超. All rights reserved.
//

import Foundation
class OrderData {
    var orderid:          Int    = -1     //订单ID
    var orderitem:        String = ""     //物品名称
    var orderprice:       Float  = 0.0    //物品价格
    var orderpprice:      Float  = 0.0    //物品保价
    var receivecode:      String = ""     //物品提取码
    var receiveperson:    String = ""     //收件人名称
    var receivephone1:    String = ""     //收件人电话1
    var receivephone2:    String = ""     //收件人电话2
    var isarivepay:       Bool   = false  // 是否是货到付款
    var arivepaymoney:    Float = 0.0     // 货到付款多少钱
    var movepersonid:     String = ""     // 送货人的账号ID
    
}
