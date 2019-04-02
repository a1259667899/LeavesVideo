//
//  UIImage+ColorImage.swift
//  Investment
//
//  Created by XD on 2018/9/5.
//  Copyright © 2018年 方加会. All rights reserved.
//

import Foundation
import UIKit
extension UIImage{
    convenience init?(gradientColors:[UIColor], size:CGSize){
        UIGraphicsBeginImageContextWithOptions(size, true, 0)
        let context = UIGraphicsGetCurrentContext()
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let colors = gradientColors.map {(color: UIColor) -> CGColor? in
            return color.cgColor
        }
        let gradient = CGGradient(colorsSpace: colorSpace, colors: colors as CFArray, locations: nil)
        // 第二个参数是起始位置，第三个参数是终止位置
        context!.drawLinearGradient(gradient!, start: CGPoint(x: 0, y: 0), end: CGPoint(x: size.width, y: 0), options: CGGradientDrawingOptions(rawValue: 0))
        self.init(cgImage: (UIGraphicsGetImageFromCurrentImageContext()?.cgImage)!)
//        self(cgImage:UIGraphicsGetImageFromCurrentImageContext()!.cgImage!)
        UIGraphicsEndImageContext()
    }
    /**
     UIcolor转图片
     */
    class func createImageWithColor(color:UIColor)->UIImage{
        let rect = CGRect.init(x: 0, y: 0, width: kScreenWidth, height: 17)
        UIGraphicsBeginImageContext(rect.size);
        let context = UIGraphicsGetCurrentContext();
        context!.setFillColor(color.cgColor);
        context!.fill(rect);
        let theImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return theImage!;
    }
    /**
     渐变色转图片
     */
    class func createGradientImage(frame:CGRect,colors:Array<UIColor>,locations:Array<CGFloat>)->UIImage {
        let gradientLayer: CAGradientLayer = CAGradientLayer()
        gradientLayer.frame = frame
        //设置渐变的主颜色
        gradientLayer.colors = colors
        //定义每种颜色所在的位置
        gradientLayer.locations = locations as [NSNumber]
        gradientLayer.startPoint = CGPoint.init(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint.init(x: 1, y: 1)
        let rect = CGRect.init(x: 0, y: 0, width: frame.width, height: frame.height)
        UIGraphicsBeginImageContext(rect.size);
        let context = UIGraphicsGetCurrentContext();
        gradientLayer.render(in: context!)
        var theImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        let imageData = theImage!.jpegData(compressionQuality: 1.0)
        theImage = UIImage(data: imageData!)!
        return theImage!;
//
//        let rect = CGRect(x: 0.0, y: 0.0, width: frame.width, height: frame.height)
//        let gradinet = CGGradient(colorsSpace: CGColorSpaceCreateDeviceRGB(), colors: colors as CFArray, locations: locations)
//        UIGraphicsBeginImageContextWithOptions(rect.size, false, UIScreen.main.scale)
//        let ctx = UIGraphicsGetCurrentContext()
//        ctx?.drawLinearGradient(gradinet, start: CGPoint(x: 0, y: 0), end: CGPoint(x: 1, y: 1), options: .drawsAfterEndLocation)
//        var image = UIGraphicsGetImageFromCurrentImageContext()!
//        UIGraphicsEndImageContext()
//        let imageData = image.jpegData(compressionQuality: 1.0)
//        image = UIImage(data: imageData!)!
//        return image
    }
    /**
     两张图片合成一张
     在image底部拼接图片，形成新的图片
     */
    func appendImageAtBottom(image:UIImage)->UIImage{
        
        let size = CGSize(width: self.size.width, height: self.size.height + image.size.height)
        
        UIGraphicsBeginImageContextWithOptions(size, false, UIScreen.main.scale)
        
        self.draw(in: CGRect(x:0, y:0, width:size.width, height:self.size.height))
        
        image.draw(in: CGRect(x:0, y:self.size.height, width:self.size.width, height:image.size.height));
        
        let newImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        return newImage
    }
    /**
     两张图片合成一张，
     在底部覆盖
     */
    func coverImageAtBottom(image: UIImage, headerHeight: CGFloat, bottomOrignX: CGFloat , extraHeight:CGFloat)-> UIImage{
        let size = CGSize(width: self.size.width, height: headerHeight + image.size.height + extraHeight)
        UIGraphicsBeginImageContextWithOptions(size, false, UIScreen.main.scale)
        
        self.draw(in: CGRect(x:0, y:0, width:size.width, height:self.size.height))
        
        image.draw(in: CGRect(x:0, y:size.height - image.size.height , width:self.size.width, height:image.size.height));
        
        let newImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        return newImage
    }
    
}
