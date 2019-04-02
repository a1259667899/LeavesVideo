//
//  FontRepresentable.swift
//  BoardCast
//
//  Created by admin on 2018/6/22.
//  Copyright © 2018年 admin. All rights reserved.
//

import UIKit

public protocol FontRepresentable: RawRepresentable {}

extension FontRepresentable where Self.RawValue == String {
    /// An alternative way to get a particular `UIFont` instance from a `Font`
    /// value.
    ///
    /// - parameter of size: The desired size of the font.
    ///
    /// - returns a `UIFont` instance of the desired font family and size, or
    /// `nil` if the font family or size isn't installed.
    public func ofSize(size: CGFloat) -> UIFont? {
        return UIFont(name: rawValue, size: size)
    }
    
    public func ofSize(size: Double) -> UIFont? {
        return UIFont(name: rawValue, size: CGFloat(size))
    }
}
