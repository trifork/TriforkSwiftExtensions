//
//  StringExtension.swift
//  TriforkSwiftExtensions
//
//  Created by Thomas Kalhøj Clemensen on 28/08/2017.
//  Copyright © 2017 Trifork A/S. All rights reserved.
//

import Foundation

public extension String {
    
    //MARK: - Encoding
    
    /// Returns a new and URL encoded instance of the receiver, without URL encoding query characters like :, ?, &, /, etc.
    public var urlEncodedWithQuery: String {
        return self.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? self
    }
    
    /// Returns a url encoded strings with alphanumerics as allowed characters
    public var urlEncoded: String {
        let allowedCharacterSet: CharacterSet = CharacterSet(charactersIn: "!*'();:@&=+$,/?%#[] ").inverted
        return self.addingPercentEncoding(withAllowedCharacters: allowedCharacterSet) ?? self
    }
    
    /// Returns a base64 encoded instance of the receiver.
    public var base64Encoded: String? {
        return self.data(using: .utf8)?.base64EncodedString()
    }
    
    /// Returns a string decoded from the base64 encoded receiver, returns `nil` if the receiver is not base64 encoded.
    public var decodeBase64: String? {
        let result: String?
        if let data: Data = Data(base64Encoded: self, options: .ignoreUnknownCharacters) {
            result = String(data: data, encoding: .utf8)
        }
        else {
            result = nil
        }
        return result
    }
    
    //MARK: - Conversion
    
    /// Creates a URL instance from the receiver. Returns `nil` if the string is an invalid URL.
    public func toURL() -> URL? {
        return URL(string: self)
    }
    
    /// Converts the receiver to UTF-8 encoded `Data` instance.
    public func toData() -> Data? {
        return self.data(using: .utf8)
    }
    
    //MARK: - RegEx
    
    /// Check if the receiver matches the regular expression defined in a string format.
    /// 
    /// The check is case insensitive
    public func matches(withRegularExpression regExp: String) -> Bool {
        let result: Bool
        do {
            let matcher: NSRegularExpression = try NSRegularExpression(pattern: regExp, options: .caseInsensitive)
            result = self.matches(withRegularExpression: matcher)
        } catch let error as NSError {
            result = false
            TSELogger.log(message: "Unable to create regular expression from: \(regExp): \(error.localizedDescription)")
        }
        return result
    }
    
    /// Checks if the receiver matches a regular expression.
    public func matches(withRegularExpression regExp: NSRegularExpression) -> Bool {
        let searchRange: NSRange = NSRange(location: 0, length: self.length)
        return regExp.numberOfMatches(in: self, options: NSRegularExpression.MatchingOptions(), range: searchRange) > 0
    }
    
    /// Returns all components from the regular expression matching
    public func allMatches(withRegularExpression pattern: String) -> [String] {
        if let matcher = try? NSRegularExpression(pattern: pattern, options: NSRegularExpression.Options()) {
            let str = self as NSString
            var matches = [String]()
            matcher.enumerateMatches(in: self, options: NSRegularExpression.MatchingOptions(), range: NSMakeRange(0, str.length), using: { (optResult, flags, stop) -> Void in
                if let result = optResult, result.numberOfRanges > 1 {
                    for t in (1 ... (result.numberOfRanges - 1)) {
                        let s = str.substring(with: result.range(at: t))
                        matches.append(s)
                    }
                }
            })
            return matches
        }
        return []
    }
    
    //MARK: - Validation
    /// Checks if the string contains valid phone number
    public var isPhoneNumber: Bool {
        let detector: NSDataDetector? = try? NSDataDetector(types: NSTextCheckingResult.CheckingType.phoneNumber.rawValue)
        return detector?.matches(in: self, options: [], range: NSMakeRange(0, self.length)).count ?? 0 > 0
    }
    
    /// Check if the string contains a valid email
    public var isEmail: Bool {
        return self.matches(withRegularExpression: "(?:[a-z0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[a-z0-9!#$%\\&'*+/=?\\^_`{|}~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])$")
    }
    
    //MARK: - Other
    
    /// Returns the number of characters in the string.
    public var length: Int {
        return self.count
    }
}
