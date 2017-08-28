//
//  CollectionExtensionTests.swift
//  TriforkSwiftExtensions
//
//  Created by Thomas Kalhøj Clemensen on 23/08/2017.
//  Copyright © 2017 Trifork A/S. All rights reserved.
//

import XCTest
@testable import TriforkSwiftExtensions

class CollectionExtensionTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testSafeIndex() {
        let array: [Int] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
        
        XCTAssert(array[safe: 0] == 1)
        XCTAssert(array[safe: -1] == nil)
        XCTAssert(array[safe: -100000] == nil)
        XCTAssert(array[safe: 5] == 6)
        XCTAssert(array[safe: 9] == 10)
        XCTAssert(array[safe: 10] == nil)
        XCTAssert(array[safe: 100000] == nil)
    }
}
