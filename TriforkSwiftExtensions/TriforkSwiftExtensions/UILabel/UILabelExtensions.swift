//
//  UILabelExtensions.swift
//  TriforkSwiftExtensions
//
//  Created by Thomas Kalhøj Clemensen on 02/01/2019.
//  Copyright © 2019 Trifork A/S. All rights reserved.
//

import UIKit

extension UILabel {
    
    /// Sets the `attributedText` property based on the String format options.
    func setText(_ text: String, withOptions options: [StringFormatOption]) {
        self.attributedText = text.convertToAttributed(withOptions: options)
    }
}

