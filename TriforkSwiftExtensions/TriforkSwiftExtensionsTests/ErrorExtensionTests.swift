//
//  ErrorExtensionTests.swift
//  TriforkSwiftExtensionsTests
//
//  Created by Kim de Vos on 09/09/2019.
//  Copyright © 2019 Trifork A/S. All rights reserved.
//

import XCTest
@testable import TriforkSwiftExtensions

final class ErrorExtensionTests: XCTestCase {


    func testIsNetworkError() {
        [NSURLErrorNetworkConnectionLost,
         NSURLErrorNotConnectedToInternet,
         NSURLErrorCannotLoadFromNetwork,
         NSURLErrorSecureConnectionFailed,
         NSURLErrorInternationalRoamingOff,
         NSURLErrorTimedOut]
            .forEach { 
                let error = NSError(domain: NSURLErrorDomain, code: $0, userInfo: nil)
                XCTAssertTrue(error.isNetworkError)
        }

        [NSURLErrorNetworkConnectionLost,
         NSURLErrorNotConnectedToInternet,
         NSURLErrorCannotLoadFromNetwork,
         NSURLErrorSecureConnectionFailed,
         NSURLErrorInternationalRoamingOff]
            .forEach {
                let error = NSError(domain: "Random-code", code: $0, userInfo: nil)
                XCTAssertFalse(error.isNetworkError)
        }

        [NSURLErrorHTTPTooManyRedirects,
         NSURLErrorBadServerResponse,
         NSURLErrorUserAuthenticationRequired,
         NSURLErrorUserCancelledAuthentication]
            .forEach {
                let error = NSError(domain: NSURLErrorDomain, code: $0, userInfo: nil)
                XCTAssertFalse(error.isNetworkError)
        }
    }
}
