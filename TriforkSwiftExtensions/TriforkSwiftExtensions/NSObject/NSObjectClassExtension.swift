//
//  NSObjectClassExtension.swift
//  TriforkSwiftExtensions
//
//  Created by Thomas Kalhøj Clemensen on 28/08/2017.
//  Copyright © 2017 Trifork A/S. All rights reserved.
//

import Foundation

public extension NSObject {
    
    /// Returns the name of the receiver's class.
    public var nameOfClass: String {
        return String(describing: type(of: self)).components(separatedBy: ".").last ?? "Unknown"
    }
}
