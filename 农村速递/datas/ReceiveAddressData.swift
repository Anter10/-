//
//  ReceiveAddressData.swift
//  农村速递
//
//  Created by 郭有超 on 2017/6/18.
//  Copyright © 2017年 郭有超. All rights reserved.
//

import Foundation

class ReceiveAddressData{
    var id:          String = ""
    var mailid:      String = ""
    var mainid:      String = ""
    var province:    String = ""
    var city:        String = ""
    var controy:     String = ""
    var detail:      String = ""
    var addtime:     String = ""
    var editra: Array<String> = []
    init(id: String,mailid: String,mainid: String,province: String,city: String,controy: String,detail: String, addtime: String) {
        self.id = id;
        
        self.mainid = mainid
        self.province = province
        self.city = city
        self.controy = controy
        self.detail = detail
        self.mailid = mailid
        self.addtime = addtime
    }
    
    init(){
        
    }
    
    func toString()-> String{
        return province + " " + city + " " + controy + " " + detail
    }
    
    func getEditData() -> Array<String> {
        editra.append(province)
        editra.append(city)
        editra.append(controy)
        editra.append(mailid)
        editra.append(detail)
        return editra
    }
    
    
}
