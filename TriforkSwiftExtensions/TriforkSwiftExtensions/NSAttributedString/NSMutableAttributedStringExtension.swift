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
        
        var attributes: [NSAttributedString.Key: Any] = [NSAttributedString.Key: Any]()
        if let font: UIFont = font {
            attributes[NSAttributedString.Key.font] = font
        }
        
        if let color: UIColor = color {
            attributes[NSAttributedString.Key.foregroundColor] = color
        }
        
        let attributedString: NSAttributedString = NSAttributedString(string: text, attributes: attributes)
        self.append(attributedString)
    }
    
    /// Adds a paragraph style to the receiver with the lineheight
    public func setLineHeight(lineHeight: CGFloat) {
        let paragraphStyle: NSMutableParagraphStyle = NSMutableParagraphStyle()
        paragraphStyle.minimumLineHeight = lineHeight
        paragraphStyle.maximumLineHeight = lineHeight
        self.addAttribute(.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: self.string.count))
    }
    
    /// Initializes an attributed string with line spacing
    public convenience init(string: String, withLineSpacing lineSpacing: CGFloat) {
        self.init(string: string)
        let textParagraphStyle: NSMutableParagraphStyle = NSMutableParagraphStyle()
        textParagraphStyle.lineSpacing = lineSpacing
        self.addAttribute(.paragraphStyle, value:textParagraphStyle, range:NSMakeRange(0, self.length))
    }
    
    /// Optionally sets lineHeight and/or lineSpacing
    public func set(lineHeight: CGFloat? = nil, lineSpacing: CGFloat? = nil) {
        let paragraphStyle: NSMutableParagraphStyle = NSMutableParagraphStyle()
        if let lineHeight: CGFloat = lineHeight {
            paragraphStyle.minimumLineHeight = lineHeight
            paragraphStyle.maximumLineHeight = lineHeight
        }
        if let lineSpacing: CGFloat = lineSpacing {
            paragraphStyle.lineSpacing = lineSpacing
        }
        self.addAttribute(.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: self.string.count))
    }
}
