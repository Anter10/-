//
//  SendItemLayout.swift
//  农村速递
//
//  Created by 郭有超 on 2017/7/13.
//  Copyright © 2017年 郭有超. All rights reserved.
//

import UIKit

class SendItemLayout: UICollectionViewLayout {
    override var collectionViewContentSize: CGSize{
        let width = collectionView!.bounds.size.width - collectionView!.contentInset.left
            - collectionView!.contentInset.right
        let height = CGFloat((collectionView!.numberOfItems(inSection: 0) + 1) / 3)
            * (width / 3 * 2)
        return CGSize(width: width, height: height)
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var attributesArray = [UICollectionViewLayoutAttributes]()
        let cellCount = self.collectionView!.numberOfItems(inSection: 0)
        for i in 0..<cellCount {
            let indexPath =  IndexPath(item:i, section:0)
            let attributes =  self.layoutAttributesForItem(at: indexPath)
            attributesArray.append(attributes!)
        }
        return attributesArray
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        //当前单元格布局属性
        let attribute =  UICollectionViewLayoutAttributes(forCellWith:indexPath)
        
        attribute.frame = CGRect(x: 10, y: 10, width: 120, height: 120)
        print(indexPath.row,"index Path = ",indexPath.item, indexPath.item % 3)
        if indexPath.item % 3 == 0{
           attribute.frame = CGRect(x: 10, y: 10, width: 120, height: 120)
        }else if indexPath.item % 3 == 1{
           attribute.frame = CGRect(x: 135, y: 10, width: 120, height: 120)
        }else if indexPath.item % 3 == 2{
            attribute.frame = CGRect(x: 285, y: 10, width: 120, height: 120)
        }
        return attribute
    }
    
    
}
