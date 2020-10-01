//
//  UIAlertControllerExtensionTests.swift
//  TriforkSwiftExtensions
//
//  Created by Thomas Kalhøj Clemensen on 28/08/2017.
//  Copyright © 2017 Trifork A/S. All rights reserved.
//

import XCTest
import UIKit
@testable import TriforkSwiftExtensions

class UIAlertControllerExtensionTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testOkAlert() {
        let title: String = "Oops!"
        let message: String = "Something important!"
        
        let alert: UIAlertController = UIAlertController.okAlert(title: title, message: message)
        XCTAssertEqual(alert.title, title)
        XCTAssertEqual(alert.message, message)
        XCTAssertEqual(alert.actions.first?.title, "OK")
        
        let alert2: UIAlertController = UIAlertController.okAlert(title: title, message: message, okTitle: "OKAY")
        XCTAssertEqual(alert2.actions.first?.title, "OKAY")
    }
    
    func testAddAction() {
        let alert: UIAlertController = UIAlertController(title: "Custom", message: "Stuff", preferredStyle: .alert)
        alert.addAction(title: "Do it!", style: .default, action: nil)
        alert.addAction(title: "Delete", style: .destructive, action: nil)
        alert.addAction(title: "Cancel", style: .cancel, action: nil)
        
        XCTAssertEqual(alert.actions.count, 3)
        XCTAssertEqual(alert.actions.first?.title, "Do it!")
        XCTAssertEqual(alert.actions.first?.style, .default)
        XCTAssertEqual(alert.actions[safe: 1]?.title, "Delete")
        XCTAssertEqual(alert.actions[safe: 1]?.style, .destructive)
        XCTAssertEqual(alert.actions.last?.title, "Cancel")
        XCTAssertEqual(alert.actions.last?.style, .cancel)
    }
}
