//
//  UIStackViewExtension.swift
//  TriforkSwiftExtensions
//
//  Created by Thomas Kalhøj Clemensen on 29/08/2017.
//  Copyright © 2017 Trifork A/S. All rights reserved.
//

import Foundation


public extension UIStackView {
    
    /// Removes all arranged subviews in receiver.
    public func removeAllArrangedViews() {
        for subView: UIView in self.arrangedSubviews {
            subView.removeFromSuperview()
        }
    }
}
