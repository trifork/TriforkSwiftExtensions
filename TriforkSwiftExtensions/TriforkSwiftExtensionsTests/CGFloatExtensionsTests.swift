//
//  CGFloatConstantsTests.swift
//  TriforkSwiftExtensionsTests
//
//  Created by Thomas Kalhøj Clemensen on 17/07/2018.
//  Copyright © 2018 Trifork A/S. All rights reserved.
//

import XCTest

class CGFloatExtensionsTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testPiConstants() {
        XCTAssertEqual(CGFloat.π, CGFloat.pi)
        XCTAssertEqual(CGFloat.🥧, CGFloat.pi)
        XCTAssertEqual(CGFloat.🥧🥧, CGFloat.pi*2)
    }
    
}
