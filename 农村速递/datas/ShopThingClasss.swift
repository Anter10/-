//
//  ShopThingClasss.swift
//  农村速递
//
//  Created by 郭有超 on 2017/8/27.
//  Copyright © 2017年 郭有超. All rights reserved.
//

import Foundation

class ShopThingClasss: NSObject {
    //   名称
    public var name: String = "";
   //    ID
    public var id: String   = "";
   //    标题名称
    public var sectiontitle:Array<String> = [];
   //    首部信息
    public var everytitle: Array<Array<String>> = [];
   //  每个部分的图片信息
    public var everyimage: Array<String> = []
   // 头部显示的信息
    public var headerviewmsg:Array<String> = []
    public var headerimagedata: Array<Data> = []
    //    每个部分的ID
    public var sectionids:Array<Array<Int>> = []
    
    init(id: String, name: String,headerviewmsg: Array<String>,everyshoptype:Array<Array<Int>>, sectiontitle:Array<String>,everyimage:Array<Array<String>>,everytitle:Array<Array<String>>,sectionids:Array<Array<Int>> ) {
        super.init()
        self.id = id
        self.name = name
        self.headerviewmsg = headerviewmsg
        self.everytitle = everytitle
        self.sectionids = sectionids
        for img in self.headerviewmsg {
            let url = URL(string: Http.postip+"express_mobile_client/mobile_activity_res/"+img)
            //从网络获取数据流
            headerimagedata.append(try! Data(contentsOf: url!))
        }
    }
}
