//
//  File.swift
//  农村速递
//
//  Created by 郭有超 on 2017/7/15.
//  Copyright © 2017年 郭有超. All rights reserved.
//

import Foundation

class ViriIdCard {
    var id      = ""
    var mainid  = ""
    var idcard  = ""
    var idname  = ""
    var vertime = ""
    
    init(_id: String, _mainid: String , _idcard: String , _idname:String, _vertime: String) {
        self.id      = _id
        self.mainid  = _mainid
        self.idcard  = _idcard
        self.idname  = _idname
        self.vertime = _vertime
        print("身份证信息 = ",self.idcard,_idcard)
    }
    init() {
        
    }
}
