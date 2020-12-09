//
//  SequenceExtensions.swift
//  TriforkSwiftExtensions
//
//  Created by Kim de Vos on 29/10/2020.
//  Copyright © 2020 Trifork A/S. All rights reserved.
//

import Foundation

#if canImport(Combine)
import Combine

@available(iOS 13.0, *)
public extension Sequence where Element: Cancellable {
    func cancel() { forEach { $0.cancel() } }
}
#endif

extension Sequence {

    /// Sorts list by key path
    func sorted<T: Comparable>(by keyPath: KeyPath<Element, T>, using comparator: (T, T) -> Bool = (<)) -> [Element] {
        sorted { a, b in
            comparator(a[keyPath: keyPath], b[keyPath: keyPath])
        }
    }

    /// max function by key path
    func max<T: Comparable>(by keyPath: KeyPath<Element, T>, using comparator: (T, T) -> Bool = (<)) -> Element? {
        self.max { a, b in
            comparator(a[keyPath: keyPath], b[keyPath: keyPath])
        }
    }

    /// min function by key path
    func min<T: Comparable>(by keyPath: KeyPath<Element, T>, using comparator: (T, T) -> Bool = (<)) -> Element? {
        self.min { a, b in
            comparator(a[keyPath: keyPath], b[keyPath: keyPath])
        }
    }
}
