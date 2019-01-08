//
//  UIEdgeInsetsExtension.swift
//  TriforkSwiftExtensions
//
//  Created by Thomas Kalhøj Clemensen on 17/07/2018.
//  Copyright © 2018 Trifork A/S. All rights reserved.
//

import Foundation

public extension UIEdgeInsets {

    /// Creates a `UIEdgeInsets` with same distance to all edges
    public init(allEdges distance: CGFloat) {
        self.init(top: distance, left: distance, bottom: distance, right: distance)
    }

}
