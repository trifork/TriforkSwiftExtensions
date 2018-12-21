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
    public mutating func removeElement(_ element: Element) {
        guard let index: Int = self.index(of: element) else {  return }
        self.remove(at: index)
        self.removeElement(element) //Recursive call to remove multiple instances of the same element.
    }
    
    /// Removes multiple elements from receiver, by comparing with the `Equatable` interface.
    public mutating func removeElements(inArray array: [Element]) {
        guard !array.isEmpty else { return }
        removeAll(where: { array.contains($0) })
    }
    
    
    /// Iterates over the receiver and invokes the doThis closure for every element with element and index
    public func forEach(_ body: ((Element, Int) -> Void)) {
        for (index, element) in self.enumerated() {
            body(element, index)
        }
    }

}
