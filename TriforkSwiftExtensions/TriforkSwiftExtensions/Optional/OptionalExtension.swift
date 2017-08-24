//
//  OptionalExtension.swift
//  TriforkSwiftExtensions
//
//  Created by Kasper Martin Tvede on 24/08/2017.
//  Copyright © 2017 Trifork A/S. All rights reserved.
//

import Foundation

extension Optional {
    
    /// Passes the receiver into `action` as a parameter iff the receiver is not `nil`, otherwise the result of this function will be `nil`
    func passToOrNil<ReturnType>(action : (Wrapped)->ReturnType?) -> ReturnType? {
        if let safeT = self {
            return action(safeT)
        }
        return nil
    }
}
