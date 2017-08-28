//
//  DoubleExtension.swift
//  TriforkSwiftExtensions
//
//  Created by Thomas Kalhøj Clemensen on 28/08/2017.
//  Copyright © 2017 Trifork A/S. All rights reserved.
//

import Foundation

public extension Double {
    
    /// Returns the receiver as a string with a number of maximum significant digits
    ///
    /// Examples:
    /// - 45.34234 with `maxDigits` set to 4, becomes "45.34"
    /// - 47 with `maxDigits` set to 4, becomes "47"
    public func string(withMaxDigits maxDigits: Int) -> String? {
        let formatter = NumberFormatter()
        formatter.maximumSignificantDigits = maxDigits
        return formatter.string(from: NSNumber(value: self))
    }
    
    /// Returns the receiver as a string with a number significant digits
    ///
    /// Examples:
    /// - 45.34234 with `maxDigits` set to 4, becomes "45.34"
    /// - 47 with `maxDigits` set to 4, becomes "47.00"
    public func string(withDigits digits: Int) -> String? {
        let formatter = NumberFormatter()
        formatter.maximumSignificantDigits = digits
        formatter.minimumSignificantDigits = digits
        return formatter.string(from: NSNumber(value: self))
    }
}
