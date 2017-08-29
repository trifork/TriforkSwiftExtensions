//
//  BundleExtension.swift
//  TriforkSwiftExtensions
//
//  Created by Thomas Kalhøj Clemensen on 29/08/2017.
//  Copyright © 2017 Trifork A/S. All rights reserved.
//

import Foundation

public extension Bundle {
    
    /// Returns the compile date of the app.
    var compileDate: Date? {
        let date: Date?
        if  let bundleName: String = self.infoDictionary?["CFBundleName"] as? String,
            let infoPath: String = self.path(forResource: bundleName, ofType: nil),
            let infoAttr = try? FileManager.default.attributesOfItem(atPath: infoPath),
            let infoDate = infoAttr[FileAttributeKey.creationDate] as? Date
        {
            date = infoDate
        }
        else {
            date = nil
        }
        return date
    }
    
    /// Returns the version string of the app in the format: VERSION (BUILDNUMBER)
    var versionString: String {
        let version: String = (self.infoDictionary?["CFBundleShortVersionString"] as? String) ?? "N/A"
        let buildNumber: String = (self.infoDictionary?["CFBundleVersion"] as? String) ?? "N/A"
        return "\(version) (\(buildNumber))"
    }
    
    /// Returns the name of the active build configuration when the app was built
    var buildConfiguration: String {
        return self.infoDictionary?["Configuration"] as? String ?? "Unknown"
    }
}
