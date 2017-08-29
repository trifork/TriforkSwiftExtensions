//
//  UIViewExtensionTests.swift
//  TriforkSwiftExtensions
//
//  Created by Thomas Kalhøj Clemensen on 29/08/2017.
//  Copyright © 2017 Trifork A/S. All rights reserved.
//

import XCTest
@testable import TriforkSwiftExtensions

class UIViewExtensionTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testCircle() {
        let view: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 101))
        view.circle()
        XCTAssertEqual(view.layer.cornerRadius, 0.0)
        view.frame.size.height = 100
        view.circle()
        XCTAssertEqual(view.layer.cornerRadius, 50.0)
    }
    
}
