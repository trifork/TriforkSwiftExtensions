//
//  EncodableExtensionTests.swift
//  TriforkSwiftExtensionsTests
//
//  Created by Thomas Kalhøj Clemensen on 14/12/2017.
//  Copyright © 2017 Trifork A/S. All rights reserved.
//

import XCTest
@testable import TriforkSwiftExtensions

fileprivate class TestCodable : Codable {
    var myProperty: String = "GoodData"
}

class EncodableExtensionTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testToDictionary() {
        let testData: TestCodable = TestCodable()
        XCTAssertEqual(testData.toDictionary()?["myProperty"] as? String, "GoodData")
    }
}
