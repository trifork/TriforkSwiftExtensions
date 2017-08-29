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
    public var compileDate: Date? {
        let date: Date?
        if  let bundleName: String = self.bundleName,
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
    
    
    /// Returns the name of the active build configuration when the app was built
    public var buildConfiguration: String {
        return self.infoDictionary?["Configuration"] as? String ?? "Unknown"
    }
    
    /// Returns the bundle name of the app.
    public var bundleName: String? {
        return self.infoDictionary?["CFBundleName"] as? String
    }
    
    /// Returns the version of the app.
    public var version: String? {
        return self.infoDictionary?["CFBundleShortVersionString"] as? String
    }
    
    /// Returns the build number of the app.
    public var buildNumber: String? {
        return self.infoDictionary?["CFBundleVersion"] as? String
    }
    
    /// Returns the version string of the app in the format: VERSION (BUILDNUMBER)
    public var versionString: String {
        return "\(self.version ?? "N/A") (\(self.buildNumber ?? "N/A"))"
    }
}
