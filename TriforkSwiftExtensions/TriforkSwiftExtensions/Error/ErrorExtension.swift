//
//  ErrorExtension.swift
//  TriforkSwiftExtensions
//
//  Created by Kim de Vos on 09/09/2019.
//  Copyright © 2019 Trifork A/S. All rights reserved.
//

import Foundation

extension Error {

    /// Returns true if it's a network error
    public var isNetworkError: Bool {
        let error = self as NSError
        let networkErrors = [NSURLErrorNetworkConnectionLost,
                             NSURLErrorNotConnectedToInternet,
                             NSURLErrorCannotLoadFromNetwork,
                             NSURLErrorSecureConnectionFailed,
                             NSURLErrorInternationalRoamingOff,
                             NSURLErrorTimedOut]

        return error.domain == NSURLErrorDomain && networkErrors.contains(error.code)
    }
}
