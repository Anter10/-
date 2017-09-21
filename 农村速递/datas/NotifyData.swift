//
//  NotifyData.swift
//  农村速递
//
//  Created by 郭有超 on 2017/8/9.
//  Copyright © 2017年 郭有超. All rights reserved.
//

import Foundation

class NotifyData{
    public var id:String            = "";
    public var tilte:String         = "";
    public var showimage:String     = "";
    public var showmessage: String      = "";
    public var notifytime: String   = "";
    public var pngdatas: Data?       = nil;
    init(_id: String, _title: String,_showimage: String,_showmessage: String, _notifytime: String) {
       
        id     = _id;
        tilte  = _title;
        showimage = _showimage;
        showmessage   = _showmessage;
        notifytime = _notifytime;
        let url = URL(string: Http.postip+"express_mobile_client/mobile_activity_res/"+showimage)
        //从网络获取数据流
        pngdatas = try! Data(contentsOf: url!)
    }
}
