import Foundation

extension Error {

    /// Returns true if it's a network error
    public var isNetworkError: Bool {
        let error = self as NSError
        let networkErrors: [Int] = [NSURLErrorNetworkConnectionLost,
                                    NSURLErrorNotConnectedToInternet,
                                    NSURLErrorCannotLoadFromNetwork,
                                    NSURLErrorSecureConnectionFailed,
                                    NSURLErrorInternationalRoamingOff,
                                    NSURLErrorTimedOut]

        return error.domain == NSURLErrorDomain && networkErrors.contains(error.code)
    }

    /// recursively gets all underlying error(s)'s description(s)
    ///
    /// - Returns: a string describing all errors including the underlying ones
    func getDeepDescription(
        separator: String = "| Underlying reason: "
    ) -> String {
        guard let underlyingError: Error = underlyingError else {
            return localizedDescription
        }
        return localizedDescription + separator + underlyingError.getDeepDescription()
    }

    /// - Returns: the "cause" / underlying reason for this error, if any exists.
    public var underlyingError: Error? {
        let nsError: NSError = self as NSError
        return nsError.userInfo["NSUnderlyingError"] as? Error
    }

}
