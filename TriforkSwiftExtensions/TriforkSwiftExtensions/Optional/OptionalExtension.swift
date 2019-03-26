//
//  OptionalExtension.swift
//  TriforkSwiftExtensions
//
//  Created by Kasper Martin Tvede on 24/08/2017.
//  Copyright © 2017 Trifork A/S. All rights reserved.
//

import Foundation

extension Optional {
    
    /// Passes the receiver into `action` as a parameter if the receiver is not `nil`, otherwise the result of this function will be `nil`
    public func passToOrNil<ReturnType>(action : (Wrapped)->ReturnType?) -> ReturnType? {
        switch self {
        case .some(let wrapped): return action(wrapped)
        case .none: return nil
        }
    }
    
    /// Unwraps receiver and passes it as parameter in the `doBlock`. If the receiver is nil, then the block will not be invoked.
    public func doWith(_ doBlock: (Wrapped) -> ()) {
        switch self {
        case .some(let wrapped):
            doBlock(wrapped)
        case .none:
            break
        }
    }
}

public extension Optional where Wrapped == String {
    
    /// Returns `true` if the Optional string is either nil or empty.
    var isNilOrEmpty: Bool {
        return self?.trimmingCharacters(in: .whitespaces).isEmpty ?? true
    }
}

public extension Optional where Wrapped: Collection {

    /// Returns `true` if the Optional Collection is either nil or empty.
    var isNilOrEmpty: Bool {
        return self?.isEmpty ?? true
    }
}
