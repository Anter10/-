//
//  SenditemCell.swift
//  农村速递
//
//  Created by 郭有超 on 2017/7/13.
//  Copyright © 2017年 郭有超. All rights reserved.
//

import UIKit

class SenditemCell: UICollectionViewCell {

    @IBOutlet var Label: UILabel!
    @IBOutlet var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        Label.text = "120"
        print("jjjj")
        
        // Initialization code
    }

}
