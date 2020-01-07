//
//  UIStackViewExtension.swift
//  TriforkSwiftExtensions
//
//  Created by Thomas Kalhøj Clemensen on 29/08/2017.
//  Copyright © 2017 Trifork A/S. All rights reserved.
//

import UIKit

public extension UIStackView {

    /// Returns a new stack view object that manages the provided views.
    /// - Parameters:
    ///   - arrangedSubviews: The views to be arranged by the stack view.
    ///   - axis: The axis along which the arranged views are laid out. The default value is `NSLayoutConstraint.Axis.horizontal`.
    ///   - spacing: The distance in points between the adjacent edges of the stack view’s arranged views. The default value is `0.0`.
    ///   - distribution: The distribution of the arranged views along the stack view’s axis. The default value is `UIStackView.Distribution.fill`.
    ///   - alignment: The alignment of the arranged subviews perpendicular to the stack view’s axis. The default value is `UIStackView.Alignment.fill`.
    convenience init(arrangedSubviews: [UIView] = [],
                     axis: NSLayoutConstraint.Axis = .horizontal,
                     spacing: CGFloat = 0,
                     distribution: UIStackView.Distribution = .fill,
                     alignment: UIStackView.Alignment = .fill) {
        self.init(arrangedSubviews: arrangedSubviews)

        self.axis = axis
        self.spacing = spacing
        self.distribution = distribution
        self.alignment = alignment
    }

    /// Removes all arranged subviews in receiver.
    func removeAllArrangedViews() {
        for subView: UIView in self.arrangedSubviews {
            subView.removeFromSuperview()
        }
    }

}
