//
//  AddressData.swift
//  农村速递
//
//  Created by 郭有超 on 2017/6/18.
//  Copyright © 2017年 郭有超. All rights reserved.
//

import Foundation
class AddressData {
    var addresss : [String] = []
    init() {
    }
    
    public func removeIndex(index : Int) {
       addresss.remove(at: index)
    }
    
    public func addAddress(address: String) {
        addresss.append(address)
    }
    
}
