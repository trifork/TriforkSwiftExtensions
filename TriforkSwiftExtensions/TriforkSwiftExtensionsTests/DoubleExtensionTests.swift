//
//  DoubleExtensionTests.swift
//  TriforkSwiftExtensions
//
//  Created by Thomas Kalhøj Clemensen on 28/08/2017.
//  Copyright © 2017 Trifork A/S. All rights reserved.
//

import XCTest

class DoubleExtensionsTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testStringMaximumDigits() {
        var double: Double = 56.4546789965
        XCTAssertEqual(double.string(withMaxDigits: 4), "56.45")
        XCTAssertEqual(double.string(withMaxDigits: 7), "56.45468")
        XCTAssertEqual(double.string(withMaxDigits: 2), "56")
        double = 46
        XCTAssertEqual(double.string(withMaxDigits: 4), "46")
        
    }
    
    func testStringDigits() {
        var double: Double = 56.4546789965
        XCTAssertEqual(double.string(withDigits: 4), "56.45")
        double = 46
        XCTAssertEqual(double.string(withDigits: 4), "46.00")
    }
    
}
