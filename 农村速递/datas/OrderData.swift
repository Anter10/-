//
//  OrderData.swift
//  农村速递
//
//  Created by 郭有超 on 2017/6/18.
//  Copyright © 2017年 郭有超. All rights reserved.
//

import Foundation
class OrderData {
    var orderid:               Int    = -1     // 订单号\n
    var orderintotime:         String = ""     // 订单生效时间
    var orderstartpoint:       String  = ""    // 寄件放
    var ordersendpeople:       String  = ""    // 收件方
    var orderreceivepeople:    String = ""     // 寄件人电话
    var ordersendphone:        String = ""     // 收件人电话
    var orderreceivephone:     String = ""     // 收件人电话
    var orderstartwhere:       String = ""     // 寄件地址
    var ordertargetwhere:      String = ""     // 目的地
    var orderpostid:           String = ""     // 邮政编码
    var wishtime:              String = ""     // 预计到达时间
    var custome:               String = ""     // 运费
    var protectedprice:        String = ""     // 物品保价
    var expresstype:           String = ""     // 物品类型
    var followexpressid:       String = ""     // 物流信息跟踪ID\n
    var uid:                   String = ""     // 寄件人ID\n
    var dealpeople:            String = ""     // 订单受理人\n
    var curmovepeople:         String = ""     // 当前送货人
    var movepeoplehistory:     String = ""     // 承运人历史
}
