//
//  TSELogger.swift
//  TriforkSwiftExtensions
//
//  Created by Thomas Kalhøj Clemensen on 29/08/2017.
//  Copyright © 2017 Trifork A/S. All rights reserved.
//

import Foundation

/// Class that handles log messages in the TriforkSwiftExtensions framework.
///
/// This class allows the developer to take over the log-handling by setting the `customLogErrorHandler` property.
public class TSELogger: NSObject {

    /// Will be invoked instead of the standard `print` function if set.
    ///
    /// Set this property if you want to handle error logs from the framework.
    ///
    /// Default is `nil`.
    static public var customLogErrorHandler: ((_ message: String) -> Void)? = nil
    
    static func log(message: String) {
        if let customLogErrorHandler = TSELogger.customLogErrorHandler {
            customLogErrorHandler(message)
        }
        else {
            print(message)
        }
    }
    
}
