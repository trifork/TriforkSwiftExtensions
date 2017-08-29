//
//  TSELoggerTests.swift
//  TriforkSwiftExtensions
//
//  Created by Thomas Kalhøj Clemensen on 29/08/2017.
//  Copyright © 2017 Trifork A/S. All rights reserved.
//

import XCTest
@testable import TriforkSwiftExtensions

class TSELoggerTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        TSELogger.customLogErrorHandler = nil
        super.tearDown()
    }
    
    func testLogMessage() {
        let expect = expectation(description: "customLogErrorHandlerInvocation")
        XCTAssertNil(TSELogger.customLogErrorHandler)
        
        TSELogger.customLogErrorHandler = { (message: String) in
            expect.fulfill()
        }
        XCTAssertNotNil(TSELogger.customLogErrorHandler)
        
        let view: UIView = UIView(frame: CGRect(x: 0, y:0, width: 50, height: 10))
        view.circle()
        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
}
