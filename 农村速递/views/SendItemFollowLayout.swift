//
//  SendItemFollowLayout.swift
//  农村速递
//
//  Created by 郭有超 on 2017/7/14.
//  Copyright © 2017年 郭有超. All rights reserved.
//

import UIKit

class SendItemFollowLayout: UICollectionViewFlowLayout {
    
    override init() {
        super.init()
        itemSize = CGSize(width: 120, height: 120)
        minimumLineSpacing = 2
        minimumInteritemSpacing = 2
        
        sectionInset = UIEdgeInsets(top: 0, left: 5, bottom: 5, right: 5)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
