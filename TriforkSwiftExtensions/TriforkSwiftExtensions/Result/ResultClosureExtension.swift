//
//  ResultClosureExtension.swift
//  TriforkSwiftExtensions
//
//  Created by Thomas Kalhøj Clemensen on 02/05/2019.
//  Copyright © 2019 Trifork A/S. All rights reserved.
//

import Foundation

public extension Result {
    
    /// `handler` is only called upon success, with the value as parameter.
    ///
    /// Returns the receiver, to allow further operations, e.g. `failure(_:)`
    @discardableResult
    func success(_ handler: ((Success) -> Void)) -> Result<Success, Failure> {
        if case let .success(value) = self {
            handler(value)
        }
        return self
    }
    
    /// `handler` is only called upon failure, with the error as parameter.
    ///
    /// Returns the receiver, to allow further operations, e.g. `success(_:)`
    @discardableResult
    func failure(_ handler: ((Failure) -> Void)) -> Result<Success, Failure> {
        if case let .failure(error) = self {
            handler(error)
        }
        return self
    }
    
    /// Returns a `Result.success(Void())` statement.
    ///
    /// Useful when handling operations, which can fail, but does not return anything.
    static func success() -> Result<Void, Failure> {
        return .success(Void())
    }
}
