//
//  DateExtensionTests.swift
//  TriforkSwiftExtensions
//
//  Created by Thomas Kalhøj Clemensen on 28/08/2017.
//  Copyright © 2017 Trifork A/S. All rights reserved.
//

import XCTest

class DateExtensionTests: XCTestCase {
    
    let date: Date = Date(timeIntervalSince1970: 1503924052)
    
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
        let timeZone: TimeZone = TimeZone(identifier: "Europe/Copenhagen")!
        XCTAssertEqual(self.date.toString(locale: locale), "")
        
        //Date only
        XCTAssertEqual(self.date.toString(dateStyle: .short, locale: locale, timeZone: timeZone), "8/28/17")
        XCTAssertEqual(self.date.toString(dateStyle: .medium, locale: locale, timeZone: timeZone), "Aug 28, 2017")
        XCTAssertEqual(self.date.toString(dateStyle: .long, locale: locale, timeZone: timeZone), "August 28, 2017")
        XCTAssertEqual(self.date.toString(dateStyle: .full, locale: locale, timeZone: timeZone), "Monday, August 28, 2017")
        
        //Time only
        XCTAssertEqual(self.date.toString(timeStyle: .short, locale: locale, timeZone: timeZone), "2:40 PM")
        XCTAssertEqual(self.date.toString(timeStyle: .medium, locale: locale, timeZone: timeZone), "2:40:52 PM")
        XCTAssertEqual(self.date.toString(timeStyle: .long, locale: locale, timeZone: timeZone), "2:40:52 PM GMT+2")
        XCTAssertEqual(self.date.toString(timeStyle: .full, locale: locale, timeZone: timeZone), "2:40:52 PM Central European Summer Time")
        
        //Both
        XCTAssertEqual(self.date.toString(dateStyle: .short, timeStyle: .short, locale: locale, timeZone: timeZone), "8/28/17, 2:40 PM")
        XCTAssertEqual(self.date.toString(dateStyle: .medium, timeStyle: .medium, locale: locale, timeZone: timeZone), "Aug 28, 2017 at 2:40:52 PM")
        XCTAssertEqual(self.date.toString(dateStyle: .long, timeStyle: .long, locale: locale, timeZone: timeZone), "August 28, 2017 at 2:40:52 PM GMT+2")
        XCTAssertEqual(self.date.toString(dateStyle: .full, timeStyle: .full, locale: locale, timeZone: timeZone), "Monday, August 28, 2017 at 2:40:52 PM Central European Summer Time")
        
        XCTAssertEqual(self.date.toString(dateStyle: .short, timeStyle: .full, locale: locale, timeZone: timeZone), "8/28/17, 2:40:52 PM Central European Summer Time")
    }
    
    func testAsISO8601String() {
        XCTAssertEqual(self.date.asISO8601String(), "2017-08-28T12:40:52.000Z")
    }
    
    func testFromIso8601String() {
        XCTAssertEqual(self.date, Date.dateFrom(iso8601String: "2017-08-28T12:40:52.000Z"))
    }
    
    func testAsISO8601StringWithoutMs() {
        XCTAssertEqual(self.date.asISO8601WithoutMsString(), "2017-08-28T12:40:52Z")
    }
    
    func testFromISO8601StringWihtoutMs() {
        XCTAssertEqual(self.date, Date.dateFrom(iso8601StringWithoutMs: "2017-08-28T12:40:52Z"))
    }
    
    func testIsToday() {
        XCTAssert(!self.date.isToday, "The date shouldn't be today")
        XCTAssert(Date().isToday, "The date should be today")
    }
    
    func testIsTomorrow() {
        XCTAssert(!self.date.isTomorrow, "The date shouldn't be tomorrow")
        XCTAssert(Date().addingTimeInterval(3600*24).isTomorrow, "The date should be tomorrow")
    }
    
    func testIsYesterday() {
        XCTAssert(!self.date.isYesterday, "The date shouldn't be yesterday")
        XCTAssert(Date().addingTimeInterval(-3600*24).isYesterday, "The date should be yesterday")
    }
    
    func testMidnightDate() {
        XCTAssert(Date().midnightDate.isToday, "Midnight should still be today!")
        XCTAssert(!Date().midnightDate.isYesterday, "Midnight should not be yesterday!")
        
    
        let equalComponents: [Calendar.Component] = [.year, .month, .day, .quarter, .timeZone, .era, .weekday, .weekOfMonth, .weekOfYear]
        
        for component: Calendar.Component in equalComponents {
            let originalValue: Int = Calendar.current.component(component, from: self.date)
            let midnightValue: Int = Calendar.current.component(component, from: self.date.midnightDate)
            XCTAssertEqual(originalValue, midnightValue)
        }
        
        let zeroComponents: [Calendar.Component] = [.hour, .minute, .second, .nanosecond]
        for component: Calendar.Component in zeroComponents {
            let midnightValue: Int = Calendar.current.component(component, from: self.date.midnightDate)
            XCTAssertEqual(midnightValue, 0)
        }
    }

    func testDaysAgoWithTodayDate() {
        let date = Date()

        XCTAssertEqual(date.daysAgo, 0)
    }

    func testDaysAgoWithYesterdayDate() {
        let date = Date().addingTimeInterval(-3600 * 24)

        XCTAssertEqual(date.daysAgo, 1)
    }

    func testDaysAgoWithAWeekAgo() {
        let date = Date().addingTimeInterval(-3600 * 24 * 7)

        XCTAssertEqual(date.daysAgo, 7)
    }
}
