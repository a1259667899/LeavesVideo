//
//  LVMovieViewController.swift
//  LeavesVideo
//
//  Created by Sinder on 2018/11/13.
//  Copyright © 2018 Sinder. All rights reserved.
//

import UIKit

class LVMovieViewController: BaseViewController,UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
   
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout.init()
        let collection = UICollectionView.init(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: self.view.height - kNavibarH), collectionViewLayout: layout)
        
        collection.backgroundColor = UIColor.white
        return collection
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func addSuViews() {
        self.titleStr = "电影"
        self.view.addSubview(self.collectionView)
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.registerCellWith(cellClazz: LVHomeBannerCollectionViewCell.self)
        self.collectionView.registerCellWith(cellClazz: LVMovieClassfyCollectionViewCell.self)
        self.collectionView.registerCellWith(cellClazz: LVHomeMovieCollectionViewCell.self)
        self.collectionView.register(LVNormalCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "header")
        self.setNVBarBgStyle(style: .custom)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 1
        case 2:
            return 12
        default:
            break
        }
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            let cell: LVHomeBannerCollectionViewCell = collectionView.dequeueCell(with: LVHomeBannerCollectionViewCell.self, indexPath: indexPath) as! LVHomeBannerCollectionViewCell
            return cell
        case 1:
            let cell: LVMovieClassfyCollectionViewCell = collectionView.dequeueCell(with: LVMovieClassfyCollectionViewCell.self, indexPath: indexPath) as! LVMovieClassfyCollectionViewCell
            return cell
        case 2:
            let cell: LVHomeMovieCollectionViewCell = collectionView.dequeueCell(with: LVHomeMovieCollectionViewCell.self, indexPath: indexPath) as! LVHomeMovieCollectionViewCell
            return cell
        default:
            break
        }
        return UICollectionViewCell.init()
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch indexPath.section {
        case 0:
            return CGSize(width: kScreenWidth, height: 174 * kWidthMultiper)
        case 1:
            return CGSize(width: 345 * kWidthMultiper, height: 178 * kWidthMultiper)
        case 2:
            return CGSize(width: (kScreenWidth - 15) / 2, height: (kScreenWidth - 15) / 2 * 148 / 180)
        default:
            break
        }
        return CGSize(width: kScreenWidth-50, height: (kScreenWidth-50)*145/325)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        switch section {
        case 0:
            return 0
        case 1:
            return 45
        case 2:
            return 5
        default:
            break
        }
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if section == 2 {
            return UIEdgeInsets(top: 10, left: 4, bottom: 4, right: 4)
        }else if section == 1{
            return UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        }else{
            return UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        }
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        var reusableview:UICollectionReusableView = UICollectionReusableView.init()
        if kind == UICollectionView.elementKindSectionHeader {
            let header:LVNormalCollectionReusableView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "header", for: indexPath) as! LVNormalCollectionReusableView
            header.setTitle(title: "热播推荐")
            header.setSubTile(title: "更多")
            header.subButtonHandler = {
                debugPrint("点击了更多")
            }
            reusableview = header
        }
        return reusableview
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 2 {
            return CGSize(width: kScreenWidth, height: 45)
        }else{
            return CGSize.zero
        }
    }
    
}