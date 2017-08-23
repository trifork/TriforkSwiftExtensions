//
//  ArrayRemoveExtension.swift
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
        }
    }
    
    /// Removes multiple elements from receiver, by comparing with the `Equatable` interface.
    public mutating func removeElements(inArray array: [Element]) {
        for object: Element in array {
            self.removeElement(object)
        }
    }
}
