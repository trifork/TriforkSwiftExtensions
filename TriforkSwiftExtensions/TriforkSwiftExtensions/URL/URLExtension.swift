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
    
    /// Gets the value of a query parameter in the receiver.
    ///
    /// E.g. my-url://withSomethingCool?id=pewpew, the value of `id` will be `pewpew`.
    public func valueOfQueryParameter(withName name: String) -> String? {
        
        var value: String?
        if let components: URLComponents = URLComponents(string: self.absoluteString) {
            value = components.queryItems?.first(where: { (item: URLQueryItem) -> Bool in
                item.name == name
            })?.value
        }
        return value
    }
}
