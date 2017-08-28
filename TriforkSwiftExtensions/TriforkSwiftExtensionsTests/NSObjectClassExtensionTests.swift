//
//  NSObjectClassExtensionTests.swift
//  TriforkSwiftExtensions
//
//  Created by Thomas Kalhøj Clemensen on 28/08/2017.
//  Copyright © 2017 Trifork A/S. All rights reserved.
//

import XCTest
import UIKit
@testable import TriforkSwiftExtensions

class MyTestClass: NSObject {
    
}

class NSObjectClassExtensionTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testNameOfClass() {
        let view: UIView = UIView()
        XCTAssertEqual(view.nameOfClass, "UIView")
        
        let testClass: MyTestClass = MyTestClass()
        XCTAssertEqual(testClass.nameOfClass, "MyTestClass")
    }
    
}
