//
//  ReceivePerson.swift
//  农村速递
//
//  Created by 郭有超 on 2017/6/18.
//  Copyright © 2017年 郭有超. All rights reserved.
//

import Foundation
class ReceivePerson {
    var phone1 : String = ""
    var phone2 : String = ""
    var name   : String = ""
    var mainid : String = ""
    var id     : String = ""
    var editdata: Array<String> = []
    init() {
        
    }
    func getString() -> String {
        return name+" " + phone1
    }
    
    func getEditData() -> Array<String> {
        editdata.append(name)
        editdata.append(phone1)
        editdata.append(phone2)
        return editdata
    }
    
    
}
