//
//  UserMessage.swift
//  农村速递
//
//  Created by 郭有超 on 2017/6/18.
//  Copyright © 2017年 郭有超. All rights reserved.
//

import Foundation

class UserMessage {
    var name:    String = ""
    var phone:   String = ""
    var email:   String = ""
    var sex  :   String = ""
    var age  :   String = ""
    var address: String = ""
    var pcount : Int    = 5
    var msg : [[String]] = []
    var keys: [[String]] = []
    var tags: [[Int]]    = []
    
    init(_name: String, _phone: String, _email: String, _sex: String, _age: String, _address: String){
        name    = _name
        phone   = _phone
        email   = _email
        sex     = _sex
        age     = _age
        address = _address
        msg  = [[name],[phone],[email,address],[sex,age]]
    }
    
    
    init(){
        msg  = [[name],[phone],[email,address],[sex,age]]
    }
    
    public func setValueByTag(tag:Int, msg1: String){
        for column in 0...tags.count - 1{
            for row in 0...tags[column].count - 1{
                let tg = tags[column][row]
                if tg == tag{
                   msg[column][row] = msg1
                }
            }
        }
        
    }
}
