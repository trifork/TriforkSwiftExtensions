import Foundation

public extension String {

    //MARK: - Encoding

    /// Returns a new and URL encoded instance of the receiver, without URL encoding query characters like :, ?, &, /, etc.
    var urlEncodedWithQuery: String {
        addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? self
    }

    /// Returns a url encoded strings with alphanumerics as allowed characters
    var urlEncoded: String {
        let allowedCharacterSet: CharacterSet = CharacterSet(charactersIn: "!*'();:@&=+$,/?%#[] ").inverted
        return addingPercentEncoding(withAllowedCharacters: allowedCharacterSet) ?? self
    }

    /// Returns a base64 encoded instance of the receiver.
    var base64Encoded: String? {
        data(using: .utf8)?.base64EncodedString()
    }

    /// Returns a string decoded from the base64 encoded receiver, returns `nil` if the receiver is not base64 encoded.
    var decodeBase64: String? {
        guard let validData: Data = Data(base64Encoded: self, options: .ignoreUnknownCharacters) else {
            return nil
        }
        return String(data: validData, encoding: .utf8)
    }

    //MARK: - Conversion

    /// Creates a URL instance from the receiver. Returns `nil` if the string is an invalid URL.
    func toURL() -> URL? {
        URL(string: self)
    }

    /// Converts the receiver to UTF-8 encoded `Data` instance.
    func toData() -> Data? {
        data(using: .utf8)
    }

    //MARK: - RegEx

    /// Check if the receiver matches the regular expression defined in a string format.
    ///
    /// - Parameters:
    ///   - regExp: Regular expression to match
    ///   - options: Options the expression uses. Default is empty
    /// - Returns: return `true` if there is one match or more.
    func isMatching(regEx regExp: String, options: NSRegularExpression.Options = []) -> Bool {
        do {
            let matcher: NSRegularExpression = try NSRegularExpression(pattern: regExp, options: options)
            let searchRange = NSRange(location: 0, length: length)
            return matcher.firstMatch(in: self, options: [], range: searchRange) != nil
        } catch let error as NSError {
            TSELogger.log(message: "Unable to create regular expression from: \(regExp): \(error.localizedDescription)")
            return false
        }
    }

    /// Returns all components from the regular expression matching
    ///
    /// - Parameter pattern: regular expression. If not valid it return an empty array.
    /// - Returns: A list of possible results. First item in list is full match, the rest is possible groups.
    func matches(regEx pattern: String) -> [String] {
        guard let matcher = try? NSRegularExpression(pattern: pattern, options: []) else {
            return []
        }

        return matcher.matches(in: self, options: [], range: NSRange(location: 0, length: self.count))
                      .flatMap { result -> [String] in
                          var values = [String]()
                          for i in 0..<result.numberOfRanges {
                              guard let range = Range(result.range(at: i), in: self) else {
                                  continue
                              }
                              values.append(String(self[range]))
                          }

                          return values
                      }
    }

    //MARK: - Validation
    /// Checks if the string contains valid phone number
    var isPhoneNumber: Bool {
        let detector: NSDataDetector? = try? NSDataDetector(types: NSTextCheckingResult.CheckingType.phoneNumber.rawValue)
        return detector?.matches(in: self, options: [], range: NSMakeRange(0, length)).count ?? 0 > 0
    }

    /// Check if the string contains a valid email
    var isEmail: Bool {
        isMatching(regEx: "^(?:[a-z0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[a-z0-9!#$%\\&'*+/=?\\^_`{|}~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])$")
    }

    //MARK: - Other

    /// Returns the number of characters in the string.
    var length: Int {
        count
    }


    ///tells if this string only consists of whitespacesAndNewlines and is not empty
    /// - See: CharacterSet.whitespacesAndNewlines
    /// - Returns: true if this string only contains CharacterSet.whitespacesAndNewlines, false otherwise
    func isBlank() -> Bool {
        //if it has any "non whitespaces" then its not blank, and if it is nil, then only if it is empty is it blank.
        isEmptyOrBlank() && isNotEmpty
    }

    ///tells if this string is empty or only containing whitespacesAndNewlines
    func isEmptyOrBlank() -> Bool {
        //if it has any "non whitespaces" then its not blank, and if it is nil then either there are nothing (empty) or its only whitespace.
        rangeOfCharacter(from: CharacterSet.whitespacesAndNewlines.inverted) == nil
    }

    ///tells if this is not empty (length = 0) or blank (only whitespaces and newlines)
    func isNotEmptyOrBlank() -> Bool {
        !isEmptyOrBlank()
    }

}
