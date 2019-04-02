//
//  UIImageView+setImage.swift
//  Investment
//
//  Created by XD on 2018/9/4.
//  Copyright © 2018年 方加会. All rights reserved.
//

import Foundation
import Kingfisher
extension UIImageView{
    func setImageby_kf(imageUrl:String){
        self.kf.setImage(with: URL.init(string: imageUrl), placeholder: UIImage.createImageWithColor(color: UIColor(hexString: "#8B8B8B")!), options: [KingfisherOptionsInfoItem.cacheOriginalImage], progressBlock: { (receivedSize, totalSize) in
            
        }) { (image, error, cacheType, url) in
            
        }
    }
    func setImageby_kf(imageUrl:String ,placeHolderName:String){
        self.kf.setImage(with: URL.init(string: imageUrl), placeholder: UIImage(named: placeHolderName), options: [KingfisherOptionsInfoItem.cacheOriginalImage], progressBlock: { (receivedSize, totalSize) in
            
        }) { (image, error, cacheType, url) in
            
        }
    }
    
}
