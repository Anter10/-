//
//  ImageViewLabelCell.swift
//  农村速递
//
//  Created by 郭有超 on 2017/7/15.
//  Copyright © 2017年 郭有超. All rights reserved.
//

import UIKit

class ImageViewLabelCell: UIView {
    var iconButton: UIButton!
    override init(frame: CGRect) {
        super.init(frame: frame)
        print("ddddsss")
        self.sizeThatFits(CGSize(width: 120, height: 120))
//        self.backgroundColor = UIColor.gray
    
    }
    
    
    
    func addShows(icon:String, title: String){
        iconButton = UIButton(frame: CGRect(x: 0, y: 0, width: 120, height: 90))
        iconButton.titleLabel?.textColor = UIColor.black
        iconButton.setTitleColor(UIColor.black, for: UIControlState.normal)
        self.addSubview(iconButton)
        iconButton.setTitle(title, for: UIControlState.normal)
        let image = UIImage(named: icon)
        iconButton.titleEdgeInsets = UIEdgeInsets(top: 120, left: 0, bottom: 0, right: 0)
        iconButton.titleLabel?.adjustsFontSizeToFitWidth = true
        iconButton.titleLabel?.textAlignment = NSTextAlignment.center
        iconButton.setBackgroundImage(image, for: UIControlState.normal)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
