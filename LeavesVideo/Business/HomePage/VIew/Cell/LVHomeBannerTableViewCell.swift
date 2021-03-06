//
//  LVHomeBannerTableViewCell.swift
//  LeavesVideo
//
//  Created by Sinder on 2018/10/22.
//  Copyright © 2018 Sinder. All rights reserved.
//

import UIKit
import LTAutoScrollView
class LVHomeBannerTableViewCell: UITableViewCell {
    var bannerSelectAtIndex : intAttributeClosuer?
    /*  设置为系统的pageControl样式利用dotType */
    private var bannerScrollView: LTAutoScrollView = {
        let autoScrollView = LTAutoScrollView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: 174 * kWidthMultiper))
        autoScrollView.glt_timeInterval = 3.0
        let layout = LTDotLayout(dotColor: UIColor.white, dotSelectColor: UIColor.lightGray, dotType: .default)
        /*设置dot的间距*/
        layout.dotMargin = 5
        /* 如果需要改变dot的大小，设置dotWidth的宽度即可 */
        layout.dotWidth = 5
        /*如需和系统一致，dot放大效果需手动关闭 */
        layout.isScale = false
        autoScrollView.dotLayout = layout
        return autoScrollView
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = UIColor.white
        self.selectionStyle = .none
        addViews()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func addViews(){
        self.addSubview(self.bannerScrollView)
        self.bannerScrollView.snp.makeConstraints { (make) in
            make.height.equalTo(Int(174 * kWidthMultiper))
            make.edges.equalTo(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        }
    }
    /**设置数据源*/
    func setDatas(datas: [LVHomeBannerModel]){
        var images:[String] = []
        for item in datas {
            images.append(item.bannerIcon)
        }
        if images.isEmpty == false {
             self.bannerScrollView.images = images
        }
       
        self.bannerScrollView.didSelectItemHandle = {
            let item = datas[$0]
            if item.bannerType == 2 {
                //请求视频详情
                if self.bannerSelectAtIndex != nil{
                    self.bannerSelectAtIndex!($0)
                }
            }
        }
        self.bannerScrollView.imageHandle = {(imageView, imageName) in
            imageView.setImageby_kf(imageUrl: imageName)
        }
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
