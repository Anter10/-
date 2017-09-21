//
//  ShopIndexView.swift
//  农村速递
//
//  Created by 郭有超 on 2017/8/13.
//  Copyright © 2017年 郭有超. All rights reserved.
//

import UIKit

class ShopIndexView: UIView {
    var indexName : UILabel?
    var indexImage: UIImageView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        print("ddddsss")
        self.sizeThatFits(CGSize(width: 110, height: 110))
        indexName = UILabel(frame: CGRect(x: 0, y: 80, width: 110, height: 30))
        indexName?.textAlignment = NSTextAlignment.center
        indexName?.text = "TUIJIAN"
        indexName?.font = UIFont(name: "Arial", size: 16)
        addSubview(indexName!)
        
        indexImage = UIImageView(frame: CGRect(x: 15, y: 5, width: 80, height: 75))
 
        indexImage?.image = UIImage(named: "brower.png")
//        indexImage?.backgroundColor = UIColor.lightGray
        addSubview(indexImage!)
    }
    
    
    
    func addShows(icon:String, title: String){
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
