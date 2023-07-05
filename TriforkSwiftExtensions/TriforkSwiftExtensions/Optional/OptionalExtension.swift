//
//  OptionalExtension.swift
//  TriforkSwiftExtensions

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
        if let wrapped = self {
            doBlock(wrapped)
        }
    }
    
    /// Unwraps a double nilable value into a single nilable value.
    func flattern<T>() -> T? where Wrapped == T? {
        return flatMap { (wrapped: Wrapped) in
            wrapped
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

