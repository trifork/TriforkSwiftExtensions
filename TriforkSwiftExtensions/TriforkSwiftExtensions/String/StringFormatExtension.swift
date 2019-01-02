//
//  StringFormatExtension.swift
//  TriforkSwiftExtensions
//
//  Created by Thomas Kalhøj Clemensen on 02/01/2019.
//  Copyright © 2019 Trifork A/S. All rights reserved.
//

import Foundation

/// Defines formatting options for strings
public enum StringFormatOption {
    case lineHeight(CGFloat)
    case lineSpacing(CGFloat)
    case font(UIFont)
    case textColor(UIColor)
    case letterSpacing(CGFloat)
}

public extension String {
    
    /// Converts the receiver into a `NSMutableAttributedString` based on the provided options.
    ///
    /// Note that you can build project-specific option-sets by implementing an extension with static functions on `Sequence where Element == StringFormatOption`
    public func convertToAttributed(withOptions options: [StringFormatOption]) -> NSMutableAttributedString {
        let attributedString: NSMutableAttributedString = NSMutableAttributedString(string: self)
        let paragraphStyle: NSMutableParagraphStyle = NSMutableParagraphStyle()
        options.forEach { (option: StringFormatOption) in
            self.format(forOption: option, forAttributedString: attributedString, withParagraphStyle: paragraphStyle)
        }
        attributedString.addAttribute(.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: attributedString.length))
        return attributedString
    }
    
    private func format(forOption option: StringFormatOption, forAttributedString attributedString: NSMutableAttributedString, withParagraphStyle paragraphStyle: NSMutableParagraphStyle) {
        let range: NSRange = NSRange(location: 0, length: attributedString.length)
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
        }
    }
}
