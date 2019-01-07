//
//  NumericExtension.swift
//  TriforkSwiftExtensions
//
//  Created by Kim de Vos on 21/12/2018.
//  Copyright © 2018 Trifork A/S. All rights reserved.
//

import Foundation

public extension Numeric {
    /// Returns the receiver as a string with a number of maximum significant digits
    ///
    /// Examples:
    /// - 45.34234 with `maxDigits` set to 4, becomes "45.34"
    /// - 47 with `maxDigits` set to 4, becomes "47"
    public func string(withMaxDigits maxDigits: Int) -> String? {
        let formatter = NumberFormatter()
        formatter.maximumSignificantDigits = maxDigits
        return formatter.string(from: self as! NSNumber)
    }

    /// Returns the receiver as a string with a number significant digits
    ///
    /// Examples:
    /// - 45.34234 with `maxDigits` set to 4, becomes "45.34"
    /// - 47 with `maxDigits` set to 4, becomes "47.00"
    public func string(withDigits digits: Int) -> String? {
        guard let number = self as? NSNumber else { return nil }
        let formatter = NumberFormatter()
        formatter.maximumSignificantDigits = digits
        formatter.minimumSignificantDigits = digits
        return formatter.string(from: number)
    }
}
