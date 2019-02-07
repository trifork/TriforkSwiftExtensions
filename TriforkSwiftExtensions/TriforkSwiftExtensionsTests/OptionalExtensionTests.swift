//
//  OptionalExtensionTests.swift
//  TriforkSwiftExtensions
//
//  Created by Kasper Martin Tvede on 24/08/2017.
//  Copyright © 2017 Trifork A/S. All rights reserved.
//

import XCTest
@testable import TriforkSwiftExtensions

class OptionalExtensionTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testPassTo(){
        var receiver : String? = ""
        
        var optValue : String? = nil
        receiver.passToOrNil(action: {optValue = $0})
        XCTAssertEqual(optValue, receiver)
        
        receiver = nil
        receiver.passToOrNil(action: {optValue = $0})
        XCTAssertEqual(optValue, "") //should not have changed due to action only called with nonnull argument
    }
    
    func testDoWith() {
        var receiver: String? = ""
        receiver.doWith { (unwrapped: String) in
            XCTAssertEqual(receiver, unwrapped)
        }
        receiver = nil
        receiver.doWith { (unwrapped: String) in
            XCTAssert(false, "This should not be called")
        }
    }
    
    func testIsNilOrEmptyString() {
        var optionalString: String? = nil
        XCTAssertTrue(optionalString.isNilOrEmpty)
        optionalString = ""
        XCTAssertTrue(optionalString.isNilOrEmpty)
        optionalString = "👻"
        XCTAssertFalse(optionalString.isNilOrEmpty)
    }

    func testIsNilOrEmptyCollection() {
        var optionalCollection: [Int]? = nil
        XCTAssertTrue(optionalCollection.isNilOrEmpty)
        optionalCollection = []
        XCTAssertTrue(optionalCollection.isNilOrEmpty)
        optionalCollection = [1, 2, 3]
        XCTAssertFalse(optionalCollection.isNilOrEmpty)
    }
    
}
