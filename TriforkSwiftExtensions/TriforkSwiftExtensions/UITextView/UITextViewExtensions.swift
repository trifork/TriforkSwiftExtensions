//
//  UITextViewExtensions.swift
//  TriforkSwiftExtensions
//
//  Created by Kim de Vos on 26/04/2019.
//  Copyright © 2019 Trifork A/S. All rights reserved.
//

import UIKit

extension UITextView {
    func setTextContainerInsetToZero() {
        textContainerInset = .zero
        textContainer.lineFragmentPadding = 0
    }
}
