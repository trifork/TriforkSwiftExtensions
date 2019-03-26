//
//  DataExtension.swift
//  TriforkSwiftExtensions
//
//  Created by Thomas Kalhøj Clemensen on 28/08/2017.
//  Copyright © 2017 Trifork A/S. All rights reserved.
//

import Foundation

public extension Data {
    
    /// Converts to string if possible, otherwise it returns `nil`
    func toString() -> String? {
        return String(data: self, encoding: .utf8)
    }
    
    /// Converts to hex-string.
    func toHexString() -> String {
        var string: String = String()
        
        var array: [UInt8] = [UInt8](repeating: 0x0, count: self.count)
        copyBytes(to: &array, count: self.count)
        
        for b: UInt8 in array {
            string.append(String(format: "%02X", b))
        }
        return string
    }

}
