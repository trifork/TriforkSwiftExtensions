//
//  ArrayExtension.swift
//  TriforkSwiftExtensions
//
//  Created by Thomas Kalhøj Clemensen on 23/08/2017.
//  Copyright © 2017 Trifork A/S. All rights reserved.
//

import Foundation

public extension Array where Element: Equatable {
    
    /// Removes element from receiver, by comparing with the `Equatable` interface.
    /// If the same items appears multiple times in the array they will all be removed
    mutating func removeElement(_ element: Element) {
        guard let index: Int = self.firstIndex(of: element) else {  return }
        self.remove(at: index)
        self.removeElement(element) //Recursive call to remove multiple instances of the same element.
    }
    
    /// Removes multiple elements from receiver, by comparing with the `Equatable` interface.
    mutating func removeElements(inArray array: [Element]) {
        guard !array.isEmpty else { return }
        removeAll(where: { array.contains($0) })
    }
    
    
    /// Iterates over the receiver and invokes the doThis closure for every element with element and index
    func forEach(_ body: ((Element, Int) -> Void)) {
        for (index, element) in self.enumerated() {
            body(element, index)
        }
    }
}

extension Array where Element: Hashable {
    
    /// Returns a new array without duplicates.
    func unique() -> [Element] {
        let set = Set(self)
        return Array(set)
    }
    
    static func - (lhs: [Element], rhs: [Element]) -> [Element] {
        var arr = Array(lhs)
        for elem in rhs {
            arr.removeElement(elem)
        }
        return arr
    }
}

extension Array where Element == String {
    ///Returns a concatenated string, separating the elements by the given separator and ending with a given separator before the last element.
    ///
    /// The following example shows how an array of strings can be joined to a
    /// single, comma-separated and, and-separated string:
    ///
    /// let cast = ["Vivien", "Marlon", "Kim", "Karl"]
    /// let list = cast.joined(by: ", ", end: " and ")
    /// print(list)
    /// // Prints "Vivien, Marlon, Kim and Karl"

    /// - Parameter by: the initial string separator inserted between elements in the beginning of the array. *Will only be used if Array holds three or more elements.
    /// - Parameter end: the final string separator. If the Array contains only two elements, they will be separated by the end parameter.
    /// - Returns: A single, concatenated string.
    func joined(by: String, end: String) -> String {
        guard let lastElement = last else { return "" }
        
        return reduce("") { partialResult, element in
            if partialResult.isEmpty {
                return element
            } else if element == lastElement {
                return partialResult + end + element
            } else {
                return partialResult + by + element
            }
        }
    }
}

public extension Array {
    
    /// Returns a new `Array` made by appending a given element to the `Array`.
    func appending(_ newElement: Element) -> Array<Element> {
        var a: Array<Element> = Array(self)
        a.append(newElement)
        return a
    }

    /// Returns the first element of the `Array`.
    var head: Element? { first }
    
    /// Removes the first element and retuns a new `Array` containing the rest of the elements.
    var tail: [Element] { Array(dropFirst()) }
    
    /// Returns `nil` if the `Array` is empty, otherwise returning self.
    var nilIfEmpty: [Element]? { isEmpty ? nil : self }
    
    /// Splits the `Array` into two, where the first `Array` contains the elements that match the bool and the second `Array` contains the rest.
    func split(by: shouldAppendToFirst(Element) -> Bool) -> ([Element], [Element]) {
        var first: [Element] = []
        var second: [Element] = []
        
        for element in self {
            if shouldAppendToFirst(element) {
                first.append(element)
            } else {
                second.append(element)
            }
        }
        return (first, second)
    }
    
    /// Return the indexed element if within boundaries, else `nil`
    func get(index: Int) -> Element? {
        return index >= 0 && index < count ? self[index] : nil
    }
}

