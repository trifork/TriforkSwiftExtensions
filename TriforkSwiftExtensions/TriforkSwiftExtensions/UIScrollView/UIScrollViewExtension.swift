//
//  UIScrollViewExtension.swift
//  TriforkSwiftExtensions
//
//  Created by Kim de Vos on 02/10/2018.
//  Copyright © 2018 Trifork A/S. All rights reserved.
//

import Foundation

extension UIScrollView {

    /// When setting `contentAndScrollInset` the `UIScrollView`s
    /// `contentInset` and `scrollIndicatorInsets` get the same value.
    public var contentAndScrollInset: UIEdgeInsets {
        get {
            return contentInset
        }
        set {
            contentInset = newValue
            scrollIndicatorInsets = newValue
        }
    }

}
