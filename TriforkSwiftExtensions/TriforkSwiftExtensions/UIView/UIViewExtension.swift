//
//  UIViewExtension.swift
//  TriforkSwiftExtensions
//
//  Created by Thomas Kalhøj Clemensen on 29/08/2017.
//  Copyright © 2017 Trifork A/S. All rights reserved.
//

import Foundation


public extension UIView {
    
    /// Turns a square view into a circle.
    public func circle() {
        if self.bounds.width == self.bounds.height {
            self.layer.cornerRadius = self.bounds.width/2.0
        }
        else {
            print("The view must be a square to make it a circle.")
        }
    }
}
