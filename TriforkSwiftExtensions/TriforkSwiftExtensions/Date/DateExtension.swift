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
        static let iso8601: DateFormatter = {
            let formatter = DateFormatter()
            formatter.calendar = Calendar(identifier: .iso8601)
            formatter.locale = Locale(identifier: "en_US_POSIX")
            formatter.timeZone = TimeZone(secondsFromGMT: 0)
            formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ"
            return formatter
        }()
    }
    
    /// Converts receiver to string with given style.
    ///
    /// Both date and time styles defaults to none, which means they will not be included in the string
    ///
    /// This function respects the device's localization settings unless another is passed.
    /// 
    /// - short:    "8/28/17",                  "2:40 PM"
    /// - medium:   "Aug 28, 2017",             "2:40:52 PM"
    /// - long:     "August 28, 2017",          "2:40:52 PM GMT+2"
    /// - full:     "Monday, August 28, 2017",  "2:40:52 PM Central European Summer Time"
    public func toString(dateStyle: DateFormatter.Style = .none, timeStyle: DateFormatter.Style = .none, locale: Locale? = nil) -> String {
        let dateFormatter: DateFormatter = DateFormatter()
        
        if let locale: Locale = locale {
            dateFormatter.locale = locale
        }
        
        dateFormatter.timeStyle = timeStyle
        dateFormatter.dateStyle = dateStyle
        return dateFormatter.string(from: self)
    }
    
    /// Converts receiver to a string of the ISO8601 format.
    public func asISO8601String() -> String {
        return Formatter.iso8601.string(from: self)
    }
    
    
    /// Constructs a Date instance based on a ISO8601 formatted string.
    public static func dateFrom(iso8601String: String) -> Date? {
        return Formatter.iso8601.date(from: iso8601String)
    }
}

