//
//  ReceivePersonCell.swift
//  农村速递
//
//  Created by 郭有超 on 2017/7/8.
//  Copyright © 2017年 郭有超. All rights reserved.
//

import UIKit

class ReceivePersonCell: UITableViewCell {
    var nameLabel   = UILabel()
    var phone1Label = UILabel()
    var phone2Label = UILabel()
    var name   = ""
    var phone1 = ""
    var phone2 = ""
    var height:CGFloat = 100
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func flushShowMsg(){
        nameLabel = UILabel(frame: CGRect(x: 10, y: 5, width: self.frame.width, height: height / 3))
        phone1Label = UILabel(frame: CGRect(x: 10, y:height / 3, width: self.frame.width , height: height / 3))
        phone2Label = UILabel(frame: CGRect(x: 10, y:height - (height / 3) , width: self.frame.width, height: (height / 3) - 10))
        self.addSubview(nameLabel)
        self.addSubview(phone1Label)
        self.addSubview(phone2Label)
        nameLabel.text = String(UserData.addreceiveshows[0])+": "+name
        phone1Label.text = String(UserData.addreceiveshows[1])+": "+phone1
        phone2Label.text = String(UserData.addreceiveshows[2])+": "+phone2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}



