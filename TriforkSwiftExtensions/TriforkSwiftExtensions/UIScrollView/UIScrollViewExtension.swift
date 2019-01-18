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


    /// Scrolls to the defined page
    ///
    /// - Parameters:
    ///   - page: Page that the srollview should scroll to.
    ///   - animated: `true` if the scrolling should be animated, `false` if it should be immediate.
    public func scroll(toPage page: Int, animated: Bool = true) {
        frame.origin.x = frame.size.width * CGFloat(page)
        frame.origin.y = 0
        scrollRectToVisible(frame, animated: animated)
    }
}
