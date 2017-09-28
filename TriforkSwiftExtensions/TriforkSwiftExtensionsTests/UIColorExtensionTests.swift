//
//  UIColorExtensionTests.swift
//  TriforkSwiftExtensionsTests
//
//  Created by Thomas Kalhøj Clemensen on 28/09/2017.
//  Copyright © 2017 Trifork A/S. All rights reserved.
//

import XCTest

class UIColorExtensionTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testRgbPattern() {
        let colorPattern: String = "rgb 255 254 253"
        if let color: UIColor = UIColor(rgb: colorPattern) {
            
            var fRed : CGFloat = 0
            var fGreen : CGFloat = 0
            var fBlue : CGFloat = 0
            var fAlpha: CGFloat = 0
            color.getRed(&fRed, green: &fGreen, blue: &fBlue, alpha: &fAlpha)
            XCTAssertEqual(fRed, 255.0/255.0)
            XCTAssertEqual(fGreen, 254.0/255.0)
            XCTAssertEqual(fBlue, 253.0/255.0)
            XCTAssertEqual(fAlpha, 255.0/255.0)
        }
        else {
            XCTFail()
        }
    }
    
}
