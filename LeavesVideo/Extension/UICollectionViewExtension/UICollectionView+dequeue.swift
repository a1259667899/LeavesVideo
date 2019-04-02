//
//  UICollectionView+dequeue.swift
//  LeavesVideo
//
//  Created by Sinder on 2018/10/22.
//  Copyright © 2018 Sinder. All rights reserved.
//

import Foundation
extension UICollectionView{
    /**
     注册cell
     */
    func registerCellWith(cellClazz: UICollectionViewCell.Type){
        self.register(cellClazz.classForCoder(), forCellWithReuseIdentifier: cellClazz.getCellIdentifer())
    }
    /**dequeueCell*/
    func dequeueCell(with cellClazz: UICollectionViewCell.Type , indexPath: IndexPath)-> UICollectionViewCell{
        let identifer = String(describing: cellClazz.self)
        let cell = self.dequeueReusableCell(withReuseIdentifier: identifer, for: indexPath)
        return cell
    }
}
