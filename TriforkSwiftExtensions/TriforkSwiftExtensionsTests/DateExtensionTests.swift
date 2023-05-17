//
//  DateExtensionTests.swift
//  TriforkSwiftExtensions
//
//  Created by Thomas Kalhøj Clemensen on 28/08/2017.
//  Copyright © 2017 Trifork A/S. All rights reserved.
//

import XCTest

class DateExtensionTests: XCTestCase {
    
    private var testDate: Date = Date(timeIntervalSince1970: 1503924052)
    
    override func setUp() {
        super.setUp()

        testDate = Date(timeIntervalSince1970: 1503924052)
    }

    func testToStringWithStyles() {
        let locale: Locale = Locale(identifier: "en-US")
        let timeZone: TimeZone = TimeZone(identifier: "Europe/Copenhagen")!
        XCTAssertEqual(self.testDate.toString(locale: locale), "")
        
        //Date only
        XCTAssertEqual(self.testDate.toString(dateStyle: .short, locale: locale, timeZone: timeZone), "8/28/17")
        XCTAssertEqual(self.testDate.toString(dateStyle: .medium, locale: locale, timeZone: timeZone), "Aug 28, 2017")
        XCTAssertEqual(self.testDate.toString(dateStyle: .long, locale: locale, timeZone: timeZone), "August 28, 2017")
        XCTAssertEqual(self.testDate.toString(dateStyle: .full, locale: locale, timeZone: timeZone), "Monday, August 28, 2017")
        
        //Time only
        XCTAssertEqual(self.testDate.toString(timeStyle: .short, locale: locale, timeZone: timeZone), "2:40 PM")
        XCTAssertEqual(self.testDate.toString(timeStyle: .medium, locale: locale, timeZone: timeZone), "2:40:52 PM")
        XCTAssertEqual(self.testDate.toString(timeStyle: .long, locale: locale, timeZone: timeZone), "2:40:52 PM GMT+2")
        XCTAssertEqual(self.testDate.toString(timeStyle: .full, locale: locale, timeZone: timeZone), "2:40:52 PM Central European Summer Time")
        
        //Both
        XCTAssertEqual(self.testDate.toString(dateStyle: .short, timeStyle: .short, locale: locale, timeZone: timeZone), "8/28/17, 2:40 PM")
        XCTAssertEqual(self.testDate.toString(dateStyle: .medium, timeStyle: .medium, locale: locale, timeZone: timeZone), "Aug 28, 2017 at 2:40:52 PM")
        XCTAssertEqual(self.testDate.toString(dateStyle: .long, timeStyle: .long, locale: locale, timeZone: timeZone), "August 28, 2017 at 2:40:52 PM GMT+2")
        XCTAssertEqual(self.testDate.toString(dateStyle: .full, timeStyle: .full, locale: locale, timeZone: timeZone), "Monday, August 28, 2017 at 2:40:52 PM Central European Summer Time")
        
        XCTAssertEqual(self.testDate.toString(dateStyle: .short, timeStyle: .full, locale: locale, timeZone: timeZone), "8/28/17, 2:40:52 PM Central European Summer Time")
    }
    
    func testAsISO8601String() {
        XCTAssertEqual(self.testDate.asISO8601String(), "2017-08-28T12:40:52.000Z")
    }
    
    func testFromIso8601String() {
        XCTAssertEqual(self.testDate, Date.dateFrom(iso8601String: "2017-08-28T12:40:52.000Z"))
    }
    
    func testAsISO8601StringWithoutMs() {
        XCTAssertEqual(self.testDate.asISO8601WithoutMsString(), "2017-08-28T12:40:52Z")
    }
    
    func testFromISO8601StringWihtoutMs() {
        XCTAssertEqual(self.testDate, Date.dateFrom(iso8601StringWithoutMs: "2017-08-28T12:40:52Z"))
    }
    
    func testIsToday() {
        XCTAssert(!self.testDate.isToday, "The date shouldn't be today")
        XCTAssert(Date().isToday, "The date should be today")
    }
    
    func testIsTomorrow() {
        XCTAssert(!self.testDate.isTomorrow, "The date shouldn't be tomorrow")
        XCTAssert(Date().addingTimeInterval(3600*24).isTomorrow, "The date should be tomorrow")
    }
    
    func testIsYesterday() {
        XCTAssert(!self.testDate.isYesterday, "The date shouldn't be yesterday")
        XCTAssert(Date().addingTimeInterval(-3600*24).isYesterday, "The date should be yesterday")
    }
    
    func testMidnightDate() {
        XCTAssert(Date().midnightDate.isToday, "Midnight should still be today!")
        XCTAssert(!Date().midnightDate.isYesterday, "Midnight should not be yesterday!")
        
        let equalComponents: [Calendar.Component] = [.year, .month, .day, .quarter, .timeZone, .era, .weekday, .weekOfMonth, .weekOfYear]
        
        for component: Calendar.Component in equalComponents {
            let originalValue: Int = Calendar.current.component(component, from: self.testDate)
            let midnightValue: Int = Calendar.current.component(component, from: self.testDate.midnightDate)
            XCTAssertEqual(originalValue, midnightValue)
        }
        
        let zeroComponents: [Calendar.Component] = [.hour, .minute, .second, .nanosecond]
        for component: Calendar.Component in zeroComponents {
            let midnightValue: Int = Calendar.current.component(component, from: self.testDate.midnightDate)
            XCTAssertEqual(midnightValue, 0)
        }
    }

    func testDaysAgoWithTodayDate() {
        let date = Date()

        XCTAssertEqual(date.daysAgo, 0)
    }

    func testDaysAgoWithYesterdayDate() {
        let date = Date().date(bySubtracting: .day, value: 1)

        XCTAssertEqual(date.daysAgo, 1)
    }

    func testDaysAgoWithAWeekAgo() {
        let date = Date().date(bySubtracting: .day, value: 7)

        XCTAssertEqual(date.daysAgo, 7)
    }
    
    func testDaysAgoWithLessThan24HoursInTheFuture() {
        let date = Date().date(byAdding: .day, value: 1)
        XCTAssertEqual(date.daysAgo, 0)
    }
    
    func testDaysAgoWithMoreThan24HoursInTheFuture() {
        let date = Date().date(byAdding: .day, value: 1).date(byAdding: .second, value: 1)
        XCTAssertEqual(date.daysAgo, -1)
    }

    func testDateByAddingOneDay() {
        let date1 = Date().date(byAdding: .day, value: 1)
        let date2 = testDate.date(byAdding: .day, value: 1)

        XCTAssertTrue(date1.isTomorrow)
        XCTAssertEqual(date2.timeIntervalSince1970, testDate.timeIntervalSince1970 + (3600 * 24))
    }

    func testDateByAddingOneNegativeDay() {
        let date1 = Date().date(byAdding: .day, value: -1)
        let date2 = testDate.date(byAdding: .day, value: -1)

        XCTAssertTrue(date1.isYesterday)
        XCTAssertEqual(date2.timeIntervalSince1970, testDate.timeIntervalSince1970 - (3600 * 24))
    }

    func testDateByAddingTwoSeconds() {
        let date = testDate.date(byAdding: .second, value: 2)

        XCTAssertEqual(date.timeIntervalSince1970, testDate.timeIntervalSince1970 + 2)
    }
    
    func testDateBySubtractingOneDay() {
        let date1 = Date().date(bySubtracting: .day, value: 1)
        let date2 = testDate.date(bySubtracting: .day, value: 1)

        XCTAssertTrue(date1.isYesterday)
        XCTAssertEqual(date2.timeIntervalSince1970, testDate.timeIntervalSince1970 - (3600 * 24))
    }

    func testDateBySubtractingOneNegativeDay() {
        let date1 = Date().date(bySubtracting: .day, value: -1)
        let date2 = testDate.date(bySubtracting: .day, value: -1)

        XCTAssertTrue(date1.isTomorrow)
        XCTAssertEqual(date2.timeIntervalSince1970, testDate.timeIntervalSince1970 + (3600 * 24))
    }

    func testDateBySubtractingSeconds() {
        let date = testDate.date(bySubtracting: .second, value: 2)

        XCTAssertEqual(date.timeIntervalSince1970, testDate.timeIntervalSince1970 - 2)
    }
    
    func testStartOfYear() {
        let danishCalendar = Calendar(identifier: .iso8601)
        
        var dateComponents = DateComponents()
        dateComponents.minute = 50
        dateComponents.hour = 12
        dateComponents.day = 17
        dateComponents.month = 5
        dateComponents.year = 2023
        let date = danishCalendar.date(from: dateComponents)
        
        var expectedDateComponents = DateComponents()
        expectedDateComponents.minute = 0
        expectedDateComponents.hour = 0
        expectedDateComponents.day = 0
        expectedDateComponents.month = 0
        expectedDateComponents.year = 2023
        let expectedDate = danishCalendar.date(from: expectedDateComponents)
        
        XCTAssertEqual(date?.startOfYear ?? Date(), expectedDate)
    }
    
    func testStartOfMonth() {
        let danishCalendar = Calendar(identifier: .iso8601)
        
        var dateComponents = DateComponents()
        dateComponents.minute = 50
        dateComponents.hour = 12
        dateComponents.day = 17
        dateComponents.month = 5
        dateComponents.year = 2023
        let date = danishCalendar.date(from: dateComponents)
        
        var expectedDateComponents = DateComponents()
        expectedDateComponents.minute = 0
        expectedDateComponents.hour = 0
        expectedDateComponents.day = 0
        expectedDateComponents.month = 5
        expectedDateComponents.year = 2023
        let expectedDate = danishCalendar.date(from: expectedDateComponents)
        
        XCTAssertEqual(date?.startOfMonth ?? Date(), expectedDate)
    }
    
    func testStartOfDay() {
        let danishCalendar = Calendar(identifier: .iso8601)
        
        var dateComponents = DateComponents()
        dateComponents.minute = 50
        dateComponents.hour = 12
        dateComponents.day = 17
        dateComponents.month = 5
        dateComponents.year = 2023
        let date = danishCalendar.date(from: dateComponents)
        
        var expectedDateComponents = DateComponents()
        expectedDateComponents.minute = 0
        expectedDateComponents.hour = 0
        expectedDateComponents.day = 17
        expectedDateComponents.month = 5
        expectedDateComponents.year = 2023
        let expectedDate = danishCalendar.date(from: expectedDateComponents)
        
        XCTAssertEqual(date?.startOfDay ?? Date(), expectedDate)
    }
    
    func testStartOfMinute() {
        let danishCalendar = Calendar(identifier: .iso8601)
        
        var dateComponents = DateComponents()
        dateComponents.second = 10
        dateComponents.minute = 50
        dateComponents.hour = 12
        dateComponents.day = 17
        dateComponents.month = 5
        dateComponents.year = 2023
        let date = danishCalendar.date(from: dateComponents)
        
        var expectedDateComponents = DateComponents()
        expectedDateComponents.second = 0
        expectedDateComponents.minute = 50
        expectedDateComponents.hour = 12
        expectedDateComponents.day = 17
        expectedDateComponents.month = 5
        expectedDateComponents.year = 2023
        let expectedDate = danishCalendar.date(from: expectedDateComponents)
        
        XCTAssertEqual(date?.startOfMinute ?? Date(), expectedDate)
    }
    
    func testStartOfSeconds() {
        let danishCalendar = Calendar(identifier: .iso8601)
        
        var dateComponents = DateComponents()
        dateComponents.nanosecond = 45
        dateComponents.second = 10
        dateComponents.minute = 50
        dateComponents.hour = 12
        dateComponents.day = 17
        dateComponents.month = 5
        dateComponents.year = 2023
        let date = danishCalendar.date(from: dateComponents)
        
        var expectedDateComponents = DateComponents()
        expectedDateComponents.nanosecond = 0
        expectedDateComponents.second = 10
        expectedDateComponents.minute = 50
        expectedDateComponents.hour = 12
        expectedDateComponents.day = 17
        expectedDateComponents.month = 5
        expectedDateComponents.year = 2023
        let expectedDate = danishCalendar.date(from: expectedDateComponents)
        
        XCTAssertEqual(date?.startOfSecond ?? Date(), expectedDate)
    }
}
