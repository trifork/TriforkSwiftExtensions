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

    func testScrollToFirstPage() {
        let scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))

        scrollView.contentSize = CGSize(width: 30, height: 10)

        scrollView.scroll(toPage: 0)
        XCTAssertEqual(scrollView.contentOffset, CGPoint(x: 0, y: 0))
    }

    func testScrollToValidPage() {
        let scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))

        scrollView.contentSize = CGSize(width: 30, height: 10)

        scrollView.scroll(toPage: 1)
        XCTAssertEqual(scrollView.contentOffset, CGPoint(x: 10, y: 0))
    }

    func testScrollToLastPage() {
        let scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))

        scrollView.contentSize = CGSize(width: 30, height: 10)

        scrollView.scroll(toPage: 2)
        XCTAssertEqual(scrollView.contentOffset, CGPoint(x: 20, y: 0))
    }

    func testScrollToInvalidPage() {
        let scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))

        scrollView.contentSize = CGSize(width: 30, height: 10)

        scrollView.scroll(toPage: 3)
        XCTAssertEqual(scrollView.contentOffset, CGPoint(x: 0, y: 0))
    }
}
