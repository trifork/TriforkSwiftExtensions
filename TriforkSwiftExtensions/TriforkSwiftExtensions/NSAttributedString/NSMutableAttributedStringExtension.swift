//
//  NSMutableAttributedStringExtension.swift
//  TriforkSwiftExtensions
//
//  Created by Thomas Kalhøj Clemensen on 23/08/2017.
//  Copyright © 2017 Trifork A/S. All rights reserved.
//

import Foundation
import UIKit

public extension NSMutableAttributedString {
    
    /// Appends an attributed string to the receiver with a specified font and color
    public func appendString(text: String, withFont font: UIFont?, andColor color: UIColor?) {
        
        var attributes: [NSAttributedStringKey: Any] = [NSAttributedStringKey: Any]()
        if let font: UIFont = font {
            attributes[NSAttributedStringKey.font] = font
        }
        
        if let color: UIColor = color {
            attributes[NSAttributedStringKey.foregroundColor] = color
        }
        
        let attributedString: NSAttributedString = NSAttributedString(string: text, attributes: attributes)
        self.append(attributedString)
    }
}
