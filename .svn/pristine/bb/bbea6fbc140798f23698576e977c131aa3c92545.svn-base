//
//  LVHomeClassfyTableViewCell.swift
//  LeavesVideo
//
//  Created by Sinder on 2018/10/22.
//  Copyright © 2018 Sinder. All rights reserved.
//

import UIKit

class LVHomeClassfyTableViewCell: UITableViewCell ,UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout{
    private var itemSize = CGSize(width: 48 * kWidthMultiper, height: (48 + 9) * kWidthMultiper + 14)
    private var datas:[LVCatagrayItem] = []
    private lazy var collectionView:UICollectionView = {
        let collection = UICollectionView.init(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: 174 * kWidthMultiper), collectionViewLayout: UICollectionViewFlowLayout.init())
        collection.delegate = self
        collection.dataSource = self
        collection.backgroundColor = UIColor.white
        return collection
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = UIColor.white
        addViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func addViews(){
        self.addSubview(self.collectionView)
        self.collectionView.snp.makeConstraints { (make) in
            make.height.equalTo(Int(160 * kWidthMultiper))
            make.edges.equalTo(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        }
        self.collectionView.registerCellWith(cellClazz: LVHomeClassfyCollectionViewCell.self)
    }
    func setDatas(datas:[LVCatagrayItem]){
        self.datas = datas
        self.collectionView.reloadData()
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.datas.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueCell(with: LVHomeClassfyCollectionViewCell.self, indexPath: indexPath) as! LVHomeClassfyCollectionViewCell
        cell.setItem(item: self.datas[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cat = self.datas[indexPath.row]
        //跳转列表页
        let vc = LVVideoListTableViewController.init(style: .plain, catId: cat.categoryId, catName: cat.categoryName)
        vc.hidesBottomBarWhenPushed = true
        ViewControllerUtil.getCurrentViewController().navigationController?.pushViewController(vc, animated: true)
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
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
