//
//  CGRectExtension.swift
//  TriforkSwiftExtensions
//
//  Created by Kim de Vos on 02/10/2018.
//  Copyright © 2018 Trifork A/S. All rights reserved.
//

import Foundation

extension CGRect {
    /// Return mid point of rect
    public var midPoint: CGPoint {
        return CGPoint(x: midX, y: midY)
    }
}
