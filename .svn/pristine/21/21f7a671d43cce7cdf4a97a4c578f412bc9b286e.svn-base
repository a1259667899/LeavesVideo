//
//  ClassfyViewController.swift
//  LeavesVideo
//
//  Created by Sinder on 2018/10/18.
//  Copyright © 2018 Sinder. All rights reserved.
//

import UIKit

class LVClassfyViewController: BaseViewController ,UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout{
   
    private lazy var headerTitles:[String] = {
        return ["娱乐" , "社会"]
    }()
    private var itemSize = CGSize(width: 75 * kWidthMultiper, height: 32 * kWidthMultiper)
    private lazy var collectionView:UICollectionView = {
        let collection = UICollectionView.init(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight - kNavibarH), collectionViewLayout: UICollectionViewFlowLayout.init())
        collection.delegate = self
        collection.dataSource = self
        collection.backgroundColor = UIColor.white
        return collection
    }()
    private lazy var listModel:LVVideoCatagrayListModel = {
        let model = LVVideoCatagrayListModel()
        return model
    }()
    private lazy var list:[LVCatagrayItem] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addViews()
        self.loadData()
    }
    private func loadData(){
        TBTHUD.showLoading()
        self.listModel.getListRequest(successionHandler: { (response:[LVCatagrayItem], ret) in
            self.list = response
            self.collectionView.reloadData()
        }) {
            
        }
    }
    private func addViews(){
        self.view.addSubview(self.collectionView)
        self.collectionView.snp.makeConstraints { (make) in
            make.edges.equalTo(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        }
        self.collectionView.registerCellWith(cellClazz: LVClassfyCollectionViewCell.self)
        self.collectionView.register(LVClassfyNoramlHeaderCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "header")
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return list.count
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list[section].subList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueCell(with: LVClassfyCollectionViewCell.self, indexPath: indexPath) as! LVClassfyCollectionViewCell
        cell.setItem(item: list[indexPath.section].subList[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cat = list[indexPath.section].subList[indexPath.row]
        let cell = collectionView.cellForItem(at: indexPath) as! LVClassfyCollectionViewCell
        cell.setSelected(selected: true)
        let vc = LVVideoListTableViewController.init(style: .plain, catId: cat.categoryId, catName: cat.categoryName)
        vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! LVClassfyCollectionViewCell
        cell.setSelected(selected: false)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return itemSize
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return (kScreenWidth - itemSize.width * 4 - 30) / 3
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        var reusableview:UICollectionReusableView = UICollectionReusableView.init()
        if kind == UICollectionView.elementKindSectionHeader {
            let header:LVClassfyNoramlHeaderCollectionReusableView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "header", for: indexPath) as! LVClassfyNoramlHeaderCollectionReusableView
            header.setTitle(title: list[indexPath.section].categoryName)
            reusableview = header
        }
        return reusableview
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: kScreenWidth, height: 45)
    }

}
