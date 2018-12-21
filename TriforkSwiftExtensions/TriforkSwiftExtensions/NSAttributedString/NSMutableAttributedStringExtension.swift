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

}
