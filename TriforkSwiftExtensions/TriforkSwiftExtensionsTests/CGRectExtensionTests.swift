//
//  CGRectExtensionTests.swift
//  TriforkSwiftExtensionsTests
//
//  Created by Kim de Vos on 02/10/2018.
//  Copyright © 2018 Trifork A/S. All rights reserved.
//

import XCTest
@testable import TriforkSwiftExtensions

class CGRectExtensionTests: XCTestCase {

    func testMidPoint() {
        var rect = CGRect(x: 0, y: 0, width: 10, height: 10)

        XCTAssert(rect.midPoint == CGPoint(x: 5, y: 5))

        rect.origin = CGPoint(x: 5.5, y: 2.5)

        XCTAssert(rect.midPoint == CGPoint(x: 10.5, y: 7.5))
    }

}
