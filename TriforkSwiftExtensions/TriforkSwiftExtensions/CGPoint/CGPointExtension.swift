//
//  CGPointExtension.swift
//  TriforkSwiftExtensions
//
//  Created by Kim de Vos on 02/10/2018.
//  Copyright © 2018 Trifork A/S. All rights reserved.
//

import Foundation

extension CGPoint {
    /// Returns the middle point
    public var midPoint: CGPoint {
        return CGPoint(x: midX, y: midY)
    }

    // Returns the middle of x
    public var midX: CGFloat {
        return self.x / 2.0
    }

    /// Returns the middle of Y
    public var midY: CGFloat {
        return self.y / 2.0
    }
}
