//
//  FloatingPointExtensions.swift
//  TriforkSwiftExtensions
//
//  Created by Kim de Vos on 29/05/2019.
//  Copyright © 2019 Trifork A/S. All rights reserved.
//

import Foundation

extension FloatingPoint {

    /// Rouding a number to nearest number provided
    ///
    /// *Example*
    /// ```
    /// 2015.round(toNearest: 10) -> 2020
    /// ```
    /// - Parameter toNearest: Number to round to
    /// - Returns: Rounded number
    public func round(toNearest: Self) -> Self {
        return Foundation.round(self / toNearest) * toNearest
    }
}
