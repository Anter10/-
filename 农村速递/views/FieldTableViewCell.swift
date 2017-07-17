//
//  FieldTableViewCell.swift
//  农村速递
//
//  Created by 郭有超 on 2017/7/8.
//  Copyright © 2017年 郭有超. All rights reserved.
//

import UIKit

class FieldTableViewCell: UITableViewCell {
    var textfield = UITextField()
    var placeholder: String = ""
    var showid        : Int    = 0
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    func flushShow(){
        textfield = UITextField(frame: CGRect(x: 120, y: 10, width: Paramters.ScreenSize.width - 120, height: self.frame.height))
        print("sdsdsdsdd")
  
        self.addSubview(textfield)
        textfield.placeholder = placeholder
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

}
