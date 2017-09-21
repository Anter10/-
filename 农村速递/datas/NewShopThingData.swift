//
//  NewShopThingData.swift
//  农村速递
//
//  Created by 郭有超 on 2017/8/27.
//  Copyright © 2017年 郭有超. All rights reserved.
//

import Foundation

class NewShopThingData: NSObject {
    // 商品ID
    public var id:    String      = "商品ID";
    // 商品名称
    public var name:  String      = "商品名称";
    // 商品价格
    public var price: Float       = 0.0;
    // 商品简介
    public var info:  String      = "";
    // 商品打折
    public var priceper: Float    = 1.0;
    // 商品类型
    public var shoptype: String   = "";
    // 所有商品颜色
    public var colors: Array<String>    = [];
    // 商品简介图片
    public var sppngs: Array<String>    = [];
    // 商品销量
    public var salenum: Int             = 0;
    
    override init() {
        super.init()
        
    }
}
