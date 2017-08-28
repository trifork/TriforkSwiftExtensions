//
//  DataExtensionTests.swift
//  TriforkSwiftExtensions
//
//  Created by Thomas Kalhøj Clemensen on 28/08/2017.
//  Copyright © 2017 Trifork A/S. All rights reserved.
//

import XCTest
@testable import TriforkSwiftExtensions

class DataExtensionTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testToString() {
        let string: String = "Rocket! 🚀"
        let data: Data? = string.data(using: .utf8)
        XCTAssertEqual(string, data?.toString())
    }
    
    func testHexString() {
        let string: String = "Hexy Texty and other cool stuff!"
        let data: Data? = string.data(using: .utf8)
        XCTAssertEqual(data?.toHexString(), "4865787920546578747920616e64206f7468657220636f6f6c20737475666621".uppercased())
    }
    
}
