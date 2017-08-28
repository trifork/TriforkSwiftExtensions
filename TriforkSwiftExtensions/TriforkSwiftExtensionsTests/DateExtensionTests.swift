//
//  DateExtensionTests.swift
//  TriforkSwiftExtensions
//
//  Created by Thomas Kalhøj Clemensen on 28/08/2017.
//  Copyright © 2017 Trifork A/S. All rights reserved.
//

import XCTest

class DateExtensionTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testToStringWithStyles() {
        let locale: Locale = Locale(identifier: "en-US")
        let date: Date = Date(timeIntervalSince1970: 1503924052)
        XCTAssertEqual(date.toString(locale: locale), "")
        
        //Date only
        XCTAssertEqual(date.toString(dateStyle: .short, locale: locale), "8/28/17")
        XCTAssertEqual(date.toString(dateStyle: .medium, locale: locale), "Aug 28, 2017")
        XCTAssertEqual(date.toString(dateStyle: .long, locale: locale), "August 28, 2017")
        XCTAssertEqual(date.toString(dateStyle: .full, locale: locale), "Monday, August 28, 2017")
        
        //Time only
        XCTAssertEqual(date.toString(timeStyle: .short, locale: locale), "2:40 PM")
        XCTAssertEqual(date.toString(timeStyle: .medium, locale: locale), "2:40:52 PM")
        XCTAssertEqual(date.toString(timeStyle: .long, locale: locale), "2:40:52 PM GMT+2")
        XCTAssertEqual(date.toString(timeStyle: .full, locale: locale), "2:40:52 PM Central European Summer Time")
        
        //Both
        XCTAssertEqual(date.toString(dateStyle: .short, timeStyle: .short, locale: locale), "8/28/17, 2:40 PM")
        XCTAssertEqual(date.toString(dateStyle: .medium, timeStyle: .medium, locale: locale), "Aug 28, 2017, 2:40:52 PM")
        XCTAssertEqual(date.toString(dateStyle: .long, timeStyle: .long, locale: locale), "August 28, 2017 at 2:40:52 PM GMT+2")
        XCTAssertEqual(date.toString(dateStyle: .full, timeStyle: .full, locale: locale), "Monday, August 28, 2017 at 2:40:52 PM Central European Summer Time")
        
        XCTAssertEqual(date.toString(dateStyle: .short, timeStyle: .full, locale: locale), "8/28/17, 2:40:52 PM Central European Summer Time")
    }
    
}
