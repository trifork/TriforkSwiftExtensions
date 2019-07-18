//
//  BoolExtensionTests.swift
//  TriforkSwiftExtensionsTests
//
//  Created by Thomas Kalhøj Clemensen on 18/07/2019.
//  Copyright © 2019 Trifork A/S. All rights reserved.
//

import XCTest

class BoolExtensionTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testToAlpha() {
        XCTAssertEqual(true.toAlpha(), 1.0)
        XCTAssertEqual(false.toAlpha(), 0.0)
    }

}
