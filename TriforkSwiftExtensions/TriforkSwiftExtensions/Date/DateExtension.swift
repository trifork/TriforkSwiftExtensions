//
//  DateExtension.swift
//  TriforkSwiftExtensions
//
//  Created by Thomas Kalhøj Clemensen on 28/08/2017.
//  Copyright © 2017 Trifork A/S. All rights reserved.
//

import Foundation

public extension Date {
    
    private struct Formatter {
        static let iso8601WithMs: DateFormatter = {
            let formatter = DateFormatter()
            formatter.calendar = Calendar(identifier: .iso8601)
            formatter.locale = Locale(identifier: "en_US_POSIX")
            formatter.timeZone = TimeZone(secondsFromGMT: 0)
            formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ"
            return formatter
        }()
        
        static let iso8601WithoutMs: DateFormatter = {
            let formatter = DateFormatter()
            formatter.calendar = Calendar(identifier: .iso8601)
            formatter.locale = Locale(identifier: "en_US_POSIX")
            formatter.timeZone = TimeZone(secondsFromGMT: 0)
            formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
            return formatter
        }()
    }
    
    /// Converts receiver to string with given style.
    ///
    /// Both date and time styles defaults to none, which means they will not be included in the string
    ///
    /// This function respects the device's localization and timeZone settings unless other are passed.
    /// 
    /// - short:    "8/28/17",                  "2:40 PM"
    /// - medium:   "Aug 28, 2017",             "2:40:52 PM"
    /// - long:     "August 28, 2017",          "2:40:52 PM GMT+2"
    /// - full:     "Monday, August 28, 2017",  "2:40:52 PM Central European Summer Time"
    func toString(dateStyle: DateFormatter.Style = .none, timeStyle: DateFormatter.Style = .none, locale: Locale? = nil, timeZone: TimeZone? = nil) -> String {
        let dateFormatter: DateFormatter = DateFormatter()
        
        if let locale: Locale = locale {
            dateFormatter.locale = locale
        }
        if let timeZone: TimeZone = timeZone {
            dateFormatter.timeZone = timeZone
        }
        
        dateFormatter.timeStyle = timeStyle
        dateFormatter.dateStyle = dateStyle
        return dateFormatter.string(from: self)
    }
    
    /// Converts receiver to a string of the ISO8601 format.
    func asISO8601String() -> String {
        return Formatter.iso8601WithMs.string(from: self)
    }
    
    
    /// Constructs a Date instance based on a ISO8601 formatted string.
    static func dateFrom(iso8601String: String) -> Date? {
        return Formatter.iso8601WithMs.date(from: iso8601String)
    }
    
    /// Converts receiver to a string of the ISO8601 format.
    func asISO8601WithoutMsString() -> String {
        return Formatter.iso8601WithoutMs.string(from: self)
    }

    /// Constructs a Date instance based on a ISO8601 formatted string.
    static func dateFrom(iso8601StringWithoutMs: String) -> Date? {
        return Formatter.iso8601WithoutMs.date(from: iso8601StringWithoutMs)
    }
    
    /// Asks `Calendar.current` whether the instance is today.
    var isToday: Bool {
        return Calendar.current.isDateInToday(self)
    }
    
    /// Asks `Calendar.current` whether the instance is tomorrow.
    var isTomorrow: Bool {
        return Calendar.current.isDateInTomorrow(self)
    }
    
    /// Asks `Calendar.current` whether the instance is yesterday.
    var isYesterday: Bool {
        return Calendar.current.isDateInYesterday(self)
    }

    /// Returns the amount of whole days (24hours) difference between two dates.
    var daysAgo: Int? {
        return Calendar.current.dateComponents([.day], from: self, to: Date()).day
    }

    @available(*, deprecated, message: "This property is deprecated. Use startOfDay instead")
    /// Returns a copy of the receiver, where the hours, minutes, seconds and nanoseconds are set to zero.
    var midnightDate: Date {
        var date: Date = self
        for component: Calendar.Component in [.hour, .minute, .second, .nanosecond] {
            let componentValue: Int = Calendar.current.component(component, from: date)
            date = Calendar.current.date(byAdding: component, value: -componentValue, to: date) ?? date
        }
        return date
    }
    
    var startOfYear: Date {
        alignTo(resolution: .year)
    }
    
    var startOfMonth: Date {
        alignTo(resolution: .month)
    }
    
    var startOfDay: Date {
        alignTo(resolution: .day)
    }
    
    var startOfHour: Date {
        alignTo(resolution: .hour)
    }
    
    var startOfMinute: Date {
        alignTo(resolution: .minute)
    }
    
    var startOfSecond: Date {
        alignTo(resolution: .second)
    }
    
    func date(byAdding component: Calendar.Component, value: Int) -> Date {
        return Calendar.current.date(byAdding: component, value: value, to: self) ?? self
    }
    
    func date(bySubtracting component: Calendar.Component, value: Int) -> Date {
        Calendar.current.date(byAdding: component, value: -value, to: self) ?? self
    }
    
    func alignTo(resolution: Calendar.Component) -> Date {
        var dateComponents = Calendar.current.dateComponents(Set([.year, .month, .day, .hour, .minute, .second, .nanosecond, .timeZone]), from: self)
        switch resolution {
        case .year:
            dateComponents.setValue(0, for: .month)
            dateComponents.setValue(0, for: .day)
            dateComponents.setValue(0, for: .hour)
            dateComponents.setValue(0, for: .minute)
            dateComponents.setValue(0, for: .second)
            dateComponents.setValue(0, for: .nanosecond)
        case .month:
            dateComponents.setValue(0, for: .day)
            dateComponents.setValue(0, for: .hour)
            dateComponents.setValue(0, for: .minute)
            dateComponents.setValue(0, for: .second)
            dateComponents.setValue(0, for: .nanosecond)
        case .day:
            dateComponents.setValue(0, for: .hour)
            dateComponents.setValue(0, for: .minute)
            dateComponents.setValue(0, for: .second)
            dateComponents.setValue(0, for: .nanosecond)
        case .hour:
            dateComponents.setValue(0, for: .minute)
            dateComponents.setValue(0, for: .second)
            dateComponents.setValue(0, for: .nanosecond)
        case .minute:
            dateComponents.setValue(0, for: .second)
            dateComponents.setValue(0, for: .nanosecond)
        case .second:
            dateComponents.setValue(0, for: .nanosecond)
        default:
            break
        }
        return NSCalendar.current.date(from: dateComponents) ?? self
    }
}

