//
//  UIEdgeInsetsExtension.swift
//  TriforkSwiftExtensions
//
//  Created by Thomas Kalhøj Clemensen on 17/07/2018.
//  Copyright © 2018 Trifork A/S. All rights reserved.
//

import UIKit

public extension UIEdgeInsets {

    /// Creates a `UIEdgeInsets` with same distance to all edges
    init(allEdges distance: CGFloat) {
        self.init(top: distance, left: distance, bottom: distance, right: distance)
    }
    
    /// Sum of `left` and `right`
    var horizontalSum: CGFloat {
        return self.left + self.right
    }
    
    /// Sum of `top` and `bottom`
    var verticalSum: CGFloat {
        return self.top + self.bottom
    }

}
