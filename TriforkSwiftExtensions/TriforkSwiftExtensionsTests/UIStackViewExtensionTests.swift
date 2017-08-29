//
//  UIStackViewExtensionTests.swift
//  TriforkSwiftExtensions
//
//  Created by Thomas Kalhøj Clemensen on 29/08/2017.
//  Copyright © 2017 Trifork A/S. All rights reserved.
//

import XCTest
@testable import TriforkSwiftExtensions

class UIStackViewExtensionTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testRemoveAllArrangedViews() {
        let stackView: UIStackView = UIStackView(arrangedSubviews: [UIView(), UIView(), UIView()])
        XCTAssertEqual(stackView.arrangedSubviews.count, 3)
        stackView.removeAllArrangedViews()
        XCTAssertEqual(stackView.arrangedSubviews.count, 0)
    }
    
}
