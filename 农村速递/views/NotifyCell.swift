//
//  NotifyCell.swift
//  农村速递
//
//  Created by 郭有超 on 2017/8/9.
//  Copyright © 2017年 郭有超. All rights reserved.
//

import UIKit

class NotifyCell: UITableViewCell {
 
    @IBOutlet var showmessage: UITextView!
    @IBOutlet var notifytime: UILabel!
    @IBOutlet var title: UILabel!
    @IBOutlet var showimage: UIImageView!
    var imagedata: Data? = nil;
    override func awakeFromNib() {
        super.awakeFromNib()
        self.frame = CGRect(x: 0, y: 0, width: Paramters.ScreenSize.width, height: 266)
        // Initialization code
        showmessage.isEditable = false
        title.center = CGPoint(x:Paramters.ScreenSize.width / 2, y: 15)
        showmessage.isScrollEnabled = false
        
    }
    
    func loadTexture(imagedata: Data) {
        //通过数据流初始化图片
        let newImage = UIImage(data: imagedata)
        showimage.image = newImage
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
