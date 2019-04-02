//
//  LVMovieClassfyCollectionViewCell.swift
//  LeavesVideo
//
//  Created by Sinder on 2018/11/13.
//  Copyright © 2018 Sinder. All rights reserved.
//

import UIKit

class LVMovieClassfyCollectionViewCell: UICollectionViewCell {
    
    var classfyBtnClickedClouser:intAttributeClosuer?
    
    private lazy var buttons:[LVMovieClassfyButton] = {
        var arr:[LVMovieClassfyButton] = []
        for i in 0 ..< 8{
            let btn = LVMovieClassfyButton.init(frame: CGRect.zero)
            btn.tag = i
            btn.setImage(UIImage(named: "tab_movie_select"), for: .normal)
            btn.setAttributedTitle(NSAttributedString.init(string: "sidner", attributes: [NSAttributedString.Key.font: XDFont.pingFangSCRegular.ofSize(size: 14.0)!, NSAttributedString.Key.foregroundColor: textBlackColor!]), for: .normal)
            arr.append(btn)
            self.addSubview(btn)
            btn.addTarget(self, action: #selector(buttonClicked(sender:)), for: .touchUpInside)
        }
        return arr
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        self.layer.cornerRadius = 8
        self.showShadow()
        addViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addViews(){
        self.buttons.snp.makeConstraints{
            $0.width.equalTo(44 * kWidthMultiper)
            $0.height.equalTo(44 * kWidthMultiper + 28)
        }
        self.buttons.snp.distributeSudokuViews(fixedItemWidth: 44 * kWidthMultiper, fixedItemHeight: 44 * kWidthMultiper + 28, warpCount: 4, edgeInset: UIEdgeInsets(top: 10, left: 17, bottom: 10, right: 17))
    }
    
    @objc private func buttonClicked(sender: UIButton){
        if self.classfyBtnClickedClouser != nil {
            self.classfyBtnClickedClouser!(sender.tag)
        }
    }
}
