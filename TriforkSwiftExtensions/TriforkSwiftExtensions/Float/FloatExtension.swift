//
//  FloatExtension.swift
//  TriforkSwiftExtensions
//
//  Created by Thomas Kalhøj Clemensen on 28/08/2017.
//  Copyright © 2017 Trifork A/S. All rights reserved.
//

import Foundation

public extension Float {
    
    /// Returns the receiver as a string with a number of maximum significant digits
    ///
    /// Examples:
    /// - 45.34234 with `maxDigits` set to 4, becomes "45.34"
    /// - 47 with `maxDigits` set to 4, becomes "47"
    public func string(withMaxDigits maxDigits: Int) -> String? {
        return Double(self).string(withMaxDigits: maxDigits)
    }
    
    /// Returns the receiver as a string with a number significant digits
    ///
    /// Examples:
    /// - 45.34234 with `maxDigits` set to 4, becomes "45.34"
    /// - 47 with `maxDigits` set to 4, becomes "47.00"
    public func string(withDigits digits: Int) -> String? {
        return Double(self).string(withDigits: digits)
    }

}
