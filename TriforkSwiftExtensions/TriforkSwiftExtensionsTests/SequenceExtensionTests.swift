//
//  SequenceExtensionTests.swift
//  TriforkSwiftExtensionsTests
//
//  Created by Kim de Vos on 29/10/2020.
//  Copyright © 2020 Trifork A/S. All rights reserved.
//

import XCTest
@testable import TriforkSwiftExtensions

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

    func testSortedByKeyPath() {
        let sequence = SequenceTestElement.testSequence()
        let sorted = sequence.sorted(by: \.date)
        XCTAssertEqual(sorted.first?.date, Date(timeIntervalSince1970: 0))
        XCTAssertEqual(sorted.last?.date, Date(timeIntervalSince1970: 7))

        let sorted2 = sequence.sorted(by: \.date, using: >)
        XCTAssertEqual(sorted2.first?.date, Date(timeIntervalSince1970: 7))
        XCTAssertEqual(sorted2.last?.date, Date(timeIntervalSince1970: 0))
    }

    func testMinByKeyPath() {
        let sequence = SequenceTestElement.testSequence()
        let min = sequence.min(by: \.date)
        XCTAssertEqual(min?.date, Date(timeIntervalSince1970: 0))
    }

    func testMaxByKeyPath() {
        let sequence = SequenceTestElement.testSequence()
        let max = sequence.max(by: \.date)
        XCTAssertEqual(max?.date, Date(timeIntervalSince1970: 7))
    }
}


private struct SequenceTestElement {
    let date: Date

    static func testSequence() -> [SequenceTestElement] {
        [
            SequenceTestElement(date: Date(timeIntervalSince1970: 7)),
            SequenceTestElement(date: Date(timeIntervalSince1970: 0)),
            SequenceTestElement(date: Date(timeIntervalSince1970: 2)),
            SequenceTestElement(date: Date(timeIntervalSince1970: 1))
        ]
    }
}
