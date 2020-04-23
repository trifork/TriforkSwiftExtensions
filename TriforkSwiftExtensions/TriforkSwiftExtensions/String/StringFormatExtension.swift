//
//  StringFormatExtension.swift
//  TriforkSwiftExtensions
//
//  Created by Thomas Kalhøj Clemensen on 02/01/2019.
//  Copyright © 2019 Trifork A/S. All rights reserved.
//

import UIKit

/// Defines formatting options for strings
public enum StringFormatOption {
    /// Line height
    case lineHeight(CGFloat)
    
    /// Line spacing
    case lineSpacing(CGFloat)
    
    /// Font
    case font(UIFont)
    
    /// Text color
    case textColor(UIColor)
    
    /// Letter spacing aka. kern
    case letterSpacing(CGFloat)
    
    /// Line break mode (e.g. truncating)
    case lineBreakMode(NSLineBreakMode)
    
    /// Text alignment for the paragraph
    case textAlignment(NSTextAlignment)
}

public extension String {
    
    //MARK: - Formatting
    
    /// Converts the receiver into a `NSMutableAttributedString` based on the provided options.
    ///
    /// Note that you can build project-specific option-sets by implementing a `StringFormatOptions` class with static functions returning sets of options.
    func convertToAttributed(withOptions options: [StringFormatOption]) -> NSMutableAttributedString {
        let range: NSRange = NSRange(location: 0, length: self.count)
        return self.format(withOptions: options, inRange: range)
    }
    
    /// Converts the receiver into a `NSMutableAttributedString` based on the provided options within a specified range.
    ///
    /// Note that you can build project-specific option-sets by implementing a `StringFormatOptions` class with static functions returning sets of options.
    func format(withOptions options: [StringFormatOption], inRange range: NSRange) -> NSMutableAttributedString {
        let attributedString: NSMutableAttributedString = NSMutableAttributedString(string: self)
        let paragraphStyle: NSMutableParagraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineBreakMode = .byTruncatingTail //default to truncate tail
        options.forEach { (option: StringFormatOption) in
            self.format(forOption: option, forAttributedString: attributedString, withParagraphStyle: paragraphStyle, range: range)
        }
        attributedString.addAttribute(.paragraphStyle, value: paragraphStyle, range: range)
        return attributedString
    }
    
    /// Formats one option for an attributed string with a paragraphstyle in a specified range
    ///
    /// The range is not used if you pass an option, which is set on the paragraphstyle. It is your responsibility to add the paragraphstyle to the right range.
    func format(forOption option: StringFormatOption, forAttributedString attributedString: NSMutableAttributedString, withParagraphStyle paragraphStyle: NSMutableParagraphStyle, range: NSRange) {
        switch option {
        case .textColor(let color):
            attributedString.addAttribute(.foregroundColor, value: color, range: range)
        case .font(let font):
            attributedString.addAttribute(.font, value: font, range: range)
        case .lineHeight(let lineHeight):
            paragraphStyle.minimumLineHeight = lineHeight
            paragraphStyle.maximumLineHeight = lineHeight
        case .lineSpacing(let lineSpacing):
            paragraphStyle.lineSpacing = lineSpacing
        case .letterSpacing(let letterSpacing):
            attributedString.addAttribute(.kern, value: letterSpacing, range: range)
        case .lineBreakMode(let lineBreakMode):
            paragraphStyle.lineBreakMode = lineBreakMode
        case .textAlignment(let textAlignment):
            paragraphStyle.alignment = textAlignment
        }
    }
}
