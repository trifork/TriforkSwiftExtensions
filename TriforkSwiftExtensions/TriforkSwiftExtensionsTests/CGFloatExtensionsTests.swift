//
//  CGFloatConstantsTests.swift
//  TriforkSwiftExtensionsTests
//
//  Created by Thomas Kalhøj Clemensen on 17/07/2018.
//  Copyright © 2018 Trifork A/S. All rights reserved.
//

import XCTest

class CGFloatExtensionsTests: XCTestCase {
        
    func testPiConstants() {
        XCTAssertEqual(CGFloat.π, CGFloat.pi)
        XCTAssertEqual(CGFloat.🥧, CGFloat.pi)
        XCTAssertEqual(CGFloat.🥧🥧, CGFloat.pi*2)
    }
    
}
