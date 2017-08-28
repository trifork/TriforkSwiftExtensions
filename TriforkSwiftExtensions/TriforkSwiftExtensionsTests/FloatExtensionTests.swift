//
//  FloatExtensionTests.swift
//  TriforkSwiftExtensions
//
//  Created by Thomas Kalhøj Clemensen on 28/08/2017.
//  Copyright © 2017 Trifork A/S. All rights reserved.
//

import XCTest
@testable import TriforkSwiftExtensions

class FloatExtensionsTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testStringMaximumDigits() {
        var float: Float = 56.4546789965
        XCTAssertEqual(float.string(withMaxDigits: 4), "56.45")
        XCTAssertEqual(float.string(withMaxDigits: 7), "56.45468")
        XCTAssertEqual(float.string(withMaxDigits: 2), "56")
        float = 46
        XCTAssertEqual(float.string(withMaxDigits: 4), "46")
        
    }
    
    func testStringDigits() {
        var float: Float = 56.4546789965
        XCTAssertEqual(float.string(withDigits: 4), "56.45")
        float = 46
        XCTAssertEqual(float.string(withDigits: 4), "46.00")
    }
    
}
