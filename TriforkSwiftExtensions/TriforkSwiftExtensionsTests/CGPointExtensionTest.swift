//
//  CGPointExtensionTest.swift
//  TriforkSwiftExtensionsTests
//
//  Created by Kim de Vos on 02/10/2018.
//  Copyright © 2018 Trifork A/S. All rights reserved.
//

import XCTest

class CGPointExtensionTest: XCTestCase {

    func testMidX() {
        let point = CGPoint(x: 5, y: 5)

        XCTAssert(point.midX == 2.5)
    }

    func testMidY() {
        let point = CGPoint(x: 3, y: 3)

        XCTAssert(point.midY == 1.5)
    }

    func testMidPoint() {
        let point = CGPoint(x: 10, y: 10)

        XCTAssert(point.midPoint == CGPoint(x: 5, y: 5))
    }

}
