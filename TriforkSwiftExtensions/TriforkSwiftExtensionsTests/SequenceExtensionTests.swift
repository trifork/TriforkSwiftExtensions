//
//  SequenceExtensionTests.swift
//  TriforkSwiftExtensionsTests
//
//  Created by Kim de Vos on 29/10/2020.
//  Copyright © 2020 Trifork A/S. All rights reserved.
//

import XCTest

#if canImport(Combine)
import Combine
#endif

class SequenceExtensionTests: XCTestCase {

    #if canImport(Combine)
    @available(iOS 13.0, *)
    func testCancelSequence() {
        let cancellables = [MockCancellable(), MockCancellable(), MockCancellable()]

        cancellables.cancel()

        XCTAssertTrue(cancellables.allSatisfy { $0.didCancel })
    }

    private class MockCancellable: Cancellable {
        var didCancel = false

        func cancel() {
            didCancel = true
        }
    }
    #endif
}
