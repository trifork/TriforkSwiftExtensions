//
//  URLExtensionTests.swift
//  TriforkSwiftExtensions
//
//  Created by Thomas Kalhøj Clemensen on 28/08/2017.
//  Copyright © 2017 Trifork A/S. All rights reserved.
//

import XCTest

class URLExtensionTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testAddingParamters() {
        let parameters: [String: String] = [
            "text": "Cool text with some spaces in it 😎",
            "auth-token":"verysecrettokenthatnobodyknows",
            "favorite-emoji": "🐳"
        ]
        let url: URL = URL(string: "http://www.trifork.com")!
        XCTAssertEqual("http://www.trifork.com?favorite-emoji=%F0%9F%90%B3&text=Cool%20text%20with%20some%20spaces%20in%20it%20%F0%9F%98%8E&auth-token=verysecrettokenthatnobodyknows", url.adding(parameters: parameters).absoluteString)
    }
    
}
