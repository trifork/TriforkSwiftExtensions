//
//  UIScrollViewExtensionTests.swift
//  TriforkSwiftExtensionsTests
//
//  Created by Kim de Vos on 02/10/2018.
//  Copyright © 2018 Trifork A/S. All rights reserved.
//

import XCTest

class UIScrollViewExtensionTests: XCTestCase {

    func testScrollAndContentInset() {
        let scrollView = UIScrollView()
        let contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)

        scrollView.contentAndScrollInset = contentInset

        XCTAssert(scrollView.contentInset == contentInset)
        XCTAssert(scrollView.scrollIndicatorInsets == contentInset)

    }
}
