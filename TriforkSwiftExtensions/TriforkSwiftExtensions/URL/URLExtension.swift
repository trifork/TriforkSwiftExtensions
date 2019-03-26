//
//  URLExtension.swift
//  TriforkSwiftExtensions
//
//  Created by Thomas Kalhøj Clemensen on 28/08/2017.
//  Copyright © 2017 Trifork A/S. All rights reserved.
//

import Foundation

public extension URL {

    /// Adding paramters to URL and returns new URL.
    func adding(parameters: [String: String]) -> URL {
        
        var urlString: String = self.absoluteString
        
        if parameters.count > 0 {
            urlString += "?"
        }
        
       urlString += parameters.map { "\($0.key)=\($0.value.urlEncodedWithQuery)" }.joined(separator: "&")
        
        return URL(string: urlString) ?? self
    }
    
    /// Gets the value of a query parameter in the receiver.
    ///
    /// E.g. my-url://withSomethingCool?id=pewpew, the value of `id` will be `pewpew`.
    func valueOfQueryParameter(withName name: String) -> String? {
        
        var value: String?
        if let components: URLComponents = URLComponents(string: self.absoluteString) {
            value = components.queryItems?.first(where: { (item: URLQueryItem) -> Bool in
                item.name == name
            })?.value
        }
        return value
    }

}
