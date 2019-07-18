//
//  BoolExtension.swift
//  TriforkSwiftExtensions
//
//  Created by Thomas Kalhøj Clemensen on 18/07/2019.
//  Copyright © 2019 Trifork A/S. All rights reserved.
//

import Foundation

public extension Bool {
    
    /// Converts receiver to either `0.0` or `1.0` as a `CGFloat`
    func toAlpha() -> CGFloat {
        return self ? 1.0 : 0.0
    }
}
