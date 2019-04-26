//
//  UITextViewExtensionTest.swift
//  TriforkSwiftExtensionsTests
//
//  Created by Kim de Vos on 26/04/2019.
//  Copyright © 2019 Trifork A/S. All rights reserved.
//

import XCTest
@testable import TriforkSwiftExtensions

class UITextViewExtensionTests: XCTestCase {

    func testZeroInset() {
        let textView = UITextView()

        XCTAssertNotEqual(textView.textContainerInset, .zero)
        XCTAssertNotEqual(textView.textContainer.lineFragmentPadding, 0)

        textView.setZeroInset()

        XCTAssertEqual(textView.textContainerInset, .zero)
        XCTAssertEqual(textView.textContainer.lineFragmentPadding, 0)
    }
}
