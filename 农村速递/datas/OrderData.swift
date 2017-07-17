//
//  OrderData.swift
//  农村速递
//
//  Created by 郭有超 on 2017/6/18.
//  Copyright © 2017年 郭有超. All rights reserved.
//

import Foundation
class OrderData {
    var id:                      String = ""     // 订单号\n
    var receive_person_id:       String = ""     // 订单生效时间
    var receive_where_id:        String  = ""    // 寄件放
    var send_person_id:          String  = ""    // 收件方
    var send_person_where:       String = ""     // 寄件人电话
    var item_type:               String = ""     // 收件人电话
    var item_real_price:         String = ""     // 收件人电话
    
    var item_prot_price:         String = ""     // 寄件地址
    var get_time:                String = ""     // 目的地
    var express_price:           String = ""     // 邮政编码
   
    var orderpeoid:              String = ""     // 预计到达时间
    var orderstatue:               String = ""     // 运费
    var reveivepersonname:        String = ""     // 物品保价
    var receivepersonwhere:           String = ""     // 物品类型
    var receivepersonphone:       String = ""     // 物流信息跟踪ID\n
    var receivepersonphone2:                   String = ""     // 寄件人ID\n
    var express_move_path_id:            String = ""     // 订单受理人\n
    var curmovepeople:         String = ""     // 当前送货人
    var movepeoplehistory:     String = ""     // 承运人历史
    
    init(id:String,receive_person_id:String,receive_where_id:String,send_person_id:String,send_person_where:String,item_type:String,item_real_price:String,item_prot_price:String,get_time:String,express_price:String,orderpeoid:String,orderstatue:String,reveivepersonname:String,receivepersonwhere:String,receivepersonphone:String,receivepersonphone2:String,express_move_path_id:String,curmovepeople:String,movepeoplehistory:String) {
        self.id                     =    id
        self.receive_person_id      =    receive_person_id
        self.receive_where_id       =    receive_where_id
        self.send_person_id         =    send_person_id
        self.send_person_where      =    send_person_where
        self.item_type              =    item_type
        self.item_real_price        =    item_real_price
        self.item_prot_price        =    item_prot_price
        self.get_time               =    get_time
        self.express_price          =    express_price
        self.orderpeoid             =    orderpeoid
        self.orderstatue            =    orderstatue
        self.reveivepersonname      =    reveivepersonname
        self.receivepersonwhere     =    receivepersonwhere
        self.receivepersonphone     =    receivepersonphone
        self.receivepersonphone2    =    receivepersonphone2
        self.express_move_path_id   =    express_move_path_id
        self.curmovepeople          =    curmovepeople
        self.movepeoplehistory      =    movepeoplehistory
    }
    func idMsg() ->String{
        return "订单号: " + id
    }
    
    func rnMsg() ->String{
        return "收件人: " + reveivepersonname
    }
    init() {
        
    }
}
