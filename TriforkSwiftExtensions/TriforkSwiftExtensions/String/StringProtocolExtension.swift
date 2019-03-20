//
//  StringProtocolExtension.swift
//  TriforkSwiftExtensions
//
//  Created by Kim de Vos on 14/02/2019.
//  Copyright © 2019 Trifork A/S. All rights reserved.
//

public extension StringProtocol where Self.Index == String.Index {

    /// Returns nil if empty
    ///
    /// - Returns: nil if empty
    public func nilIfEmpty() -> Self? {
        return isEmpty ? nil : self
    }


    /// /// Returns a trimmmed string
    ///
    /// - Returns: Trimmed string
    public func trimmed() -> String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }

    /// Returns a new sliced string that is inbetween from and to.
    ///
    /// - Parameters:
    ///   - from: The string that the range should start at. Use nil if it should start from the beginning
    ///   - to: The string the range should end at. Use nil if it should use the end.
    /// - Returns: If there is a valid range. Nil if `from` **and** `to` is nil
    public func slicing(from: Self? = nil, to: Self? = nil) -> String? {
        if from == nil && to == nil {
            return nil
        }

        let startRange: Index
        let endRange: Index

        if let from = from {
            if let range = range(of: from) {
                startRange = range.upperBound
            } else {
                return nil
            }
        } else {
            startRange = self.startIndex
        }

        if let to = to {
            if let range = range(of: to, range: startRange..<endIndex) {
                endRange = range.lowerBound
            } else {
                return nil
            }
        } else {
            endRange = self.endIndex
        }

        return String(self[startRange..<endRange])
    }
}
