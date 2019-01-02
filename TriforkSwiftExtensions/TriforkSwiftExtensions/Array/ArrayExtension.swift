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
    public mutating func removeElement(_ element: Element) {
        if let index: Int = self.index(of: element) {
            self.remove(at: index)
            self.removeElement(element) //Recursive call to remove multiple instances of the same element.
        }
    }
    
    /// Removes multiple elements from receiver, by comparing with the `Equatable` interface.
    public mutating func removeElements(inArray array: [Element]) {
        for object: Element in array {
            self.removeElement(object)
        }
    }
    
    
    /// Iterates over the receiver and invokes the doThis closure for every element with element and index
    public func forEach(_ body: ((Element, Int) -> Void)) {
        for (index, element) in self.enumerated() {
            body(element, index)
        }
    }
    
    // Returns a new `Array` made by appending a given element to the `Array`.
    func appending(_ newElement: Element) -> Array<Element> {
        var a: Array<Element> = Array(self)
        a.append(newElement)
        return a
    }
}
