//
//  IntExtensionTests.swift
//  TriforkSwiftExtensionsTests
//
//  Created by Kim de Vos on 21/12/2018.
//  Copyright © 2018 Trifork A/S. All rights reserved.
//

import XCTest

class IntExtensionTests: XCTestCase {

    func testStringMaximumDigits() {
        var integer: Int = 56
        XCTAssertEqual(integer.string(withMaxDigits: 4), "56")
        XCTAssertEqual(integer.string(withMaxDigits: 7), "56")
        XCTAssertEqual(integer.string(withMaxDigits: 2), "56")
        integer = 46
        XCTAssertEqual(integer.string(withMaxDigits: 4), "46")

    }

    func testStringDigits() {
        let formatter: NumberFormatter = NumberFormatter()
        var float: Int = 56
        XCTAssertEqual(float.string(withDigits: 4), "56\(formatter.decimalSeparator!)00")
        float = 46
        XCTAssertEqual(float.string(withDigits: 4), "46\(formatter.decimalSeparator!)00")
    }

}
