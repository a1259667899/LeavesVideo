//
//  UICollectionViewCell+dequeue.swift
//  LeavesVideo
//
//  Created by Sinder on 2018/10/22.
//  Copyright © 2018 Sinder. All rights reserved.
//

import Foundation
extension UICollectionViewCell{
    class func cellWithCollectionView(collectionView:UICollectionView , indexPath: IndexPath)->(UICollectionViewCell){
        let identifer = String(describing: type(of:self.init()))
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifer, for: indexPath)
        return cell
    }
    class func getCellIdentifer()->(String){
        return String(describing: self)
    }
}

