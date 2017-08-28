//
//  URLExtension.swift
//  TriforkSwiftExtensions
//
//  Created by Thomas Kalhøj Clemensen on 28/08/2017.
//  Copyright © 2017 Trifork A/S. All rights reserved.
//

import Foundation

public extension URL {
    
    public func adding(parameters: [String: String]) -> URL {
        
        var urlString: String = self.absoluteString
        
        if parameters.count > 0 {
            urlString += "?"
        }
        
        var i: Int = 0
        for key: String in parameters.keys {
            
            i += 1
            
            if let value: String = parameters[key] {
                urlString += "\(key)=\(value.urlEncodedWithQuery)"
            }
            
            if i < parameters.keys.count {
                urlString += "&"
            }
        }
        
        return URL(string: urlString) ?? self
    }
}
