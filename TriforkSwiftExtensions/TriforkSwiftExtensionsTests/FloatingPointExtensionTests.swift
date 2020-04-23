//
//  FloatingPointExtensionTests.swift
//  TriforkSwiftExtensionsTests
//
//  Created by Kim de Vos on 29/05/2019.
//  Copyright © 2019 Trifork A/S. All rights reserved.
//

import XCTest

final class FloatingPointExtensionTests: XCTestCase {

    func testRoundToNearestFloat() {
        XCTAssertEqual(Float(2015).round(toNearest: 10), 2020)
        XCTAssertEqual(Float(2015).round(toNearest: 100), 2000)
        XCTAssertEqual(Float(2014).round(toNearest: 10), 2010)
        XCTAssertEqual(Float(2049).round(toNearest: 100), 2000)
        XCTAssertEqual(Float(2049.2).round(toNearest: 0.25), 2049.25)
        XCTAssertEqual(Float(2049.1).round(toNearest: 0.25), 2049.0)
    }

    func testRoundToNearestCGFloat() {
        XCTAssertEqual(CGFloat(2015).round(toNearest: 10), 2020)
        XCTAssertEqual(CGFloat(2015).round(toNearest: 100), 2000)
        XCTAssertEqual(CGFloat(2014).round(toNearest: 10), 2010)
        XCTAssertEqual(CGFloat(2049).round(toNearest: 100), 2000)
        XCTAssertEqual(CGFloat(2049.2).round(toNearest: 0.25), 2049.25)
        XCTAssertEqual(CGFloat(2049.1).round(toNearest: 0.25), 2049.0)
    }

    func testRoundToNearestDouble() {
        XCTAssertEqual(Double(2015).round(toNearest: 10), 2020)
        XCTAssertEqual(Double(2015).round(toNearest: 100), 2000)
        XCTAssertEqual(Double(2014).round(toNearest: 10), 2010)
        XCTAssertEqual(Double(2049).round(toNearest: 100), 2000)
        XCTAssertEqual(Double(2049.2).round(toNearest: 0.25), 2049.25)
        XCTAssertEqual(Double(2049.1).round(toNearest: 0.25), 2049.0)
    }

}
