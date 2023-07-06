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
        return sorted { a, b in
            comparator(a[keyPath: keyPath], b[keyPath: keyPath])
        }
    }

    /// max function by key path
    func max<T: Comparable>(by keyPath: KeyPath<Element, T>, using comparator: (T, T) -> Bool = (<)) -> Element? {
        return self.max { a, b in
            comparator(a[keyPath: keyPath], b[keyPath: keyPath])
        }
    }

    /// min function by key path
    func min<T: Comparable>(by keyPath: KeyPath<Element, T>, using comparator: (T, T) -> Bool = (<)) -> Element? {
        return self.min { a, b in
            comparator(a[keyPath: keyPath], b[keyPath: keyPath])
        }
    }
    
    func toArray() -> [Element] {
        map { (element: Element) in
            element
        }
    }
    
    ///Filters all nil values away
    func filterNotNil<T>() -> [T] where Element == T? {
        compactMap { (element: Element) in
            element
        }
    }
    
    ///Creates a updated array of elements from this sequence, and updates those that matches the given predicate, by the given updateBy action
    func updated(
        with: any Sequence<Element>,
        predicate: (_ oldElement: Element,_ newElement: Element) -> Bool,
        updateBy: (_ oldElement: Element,_ newElement: Element) -> Element
    ) -> [Element] {
        var result: [Element] = self.toArray()
        
        with.forEach { (newElement: Element) in
            let potentialIndex = result.firstIndex { (oldElement: Element) in
                predicate(oldElement, newElement)
            }
            guard let toUpdateIndex = potentialIndex else {
                return
            }
            result[toUpdateIndex] = updateBy(result[toUpdateIndex], newElement)
        }
                
        return result
    }
}
