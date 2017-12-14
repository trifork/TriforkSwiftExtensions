//
//  EncodableExtension.swift
//  TriforkSwiftExtensions
//
//  Created by Thomas Kalhøj Clemensen on 14/12/2017.
//  Copyright © 2017 Trifork A/S. All rights reserved.
//

import Foundation

public extension Encodable {
    
    /// Returns a dictionary representing the data from the receiver.
    public func toDictionary() -> [String: Any]? {
        let dictionary: [String: Any]?
        if let data: Data = try? JSONEncoder().encode(self) {
            dictionary = (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)) as? [String: Any]
        }
        else {
            dictionary = nil
        }
        return dictionary
    }
}
