//
//  ArrayRemoveExtensionTests.swift
//  TriforkSwiftExtensions
//
//  Created by Thomas Kalhøj Clemensen on 23/08/2017.
//  Copyright © 2017 Trifork A/S. All rights reserved.
//

import XCTest
@testable import TriforkSwiftExtensions

class ArrayExtensionTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testRemoveObject() {
        var numbers: [Int] = [1, 2, 3, 4]
        numbers.removeElement(1)
        XCTAssert(numbers == [2, 3, 4], "Element '1' should have been removed.")
        
        let object1: NSObject = NSObject()
        let object2: NSObject = NSObject()
        let object3: NSObject = NSObject()
        var objects: [NSObject] = [object1, object2, object3]
        objects.removeElement(object3)
        XCTAssert(objects == [object1, object2], "Element 'object3' should have been removed.")
        
        objects = [object1, object2, object3]
        objects.removeElement(object2)
        XCTAssert(objects == [object1, object3], "Element 'object2' should have been removed.")
        
        objects = [object1, object2, object2, object3, object3, object3, object3, object3]
        objects.removeElement(object3)
        XCTAssert(objects == [object1, object2, object2])
    }
    
    func testRemoveObjects() {
        var numbers: [Int] = [1, 2, 3, 3, 3, 4, 4]
        numbers.removeElements(inArray: [2, 3, 4])
        XCTAssert(numbers == [1], "Element '2', '3' and '4' should have been removed.")
        
        let object1: NSObject = NSObject()
        let object2: NSObject = NSObject()
        let object3: NSObject = NSObject()
        var objects: [NSObject] = [object1, object1, object1, object2, object3]
        objects.removeElements(inArray: [object1, object2])
        XCTAssert(objects == [object3], "Element 'object1' and 'object2' should have been removed.")
    }
    
    func testForeach() {
        let strings: [String] = ["0", "1", "2", "3", "4"]
        var i: Int = 0
        strings.forEach { (element: String, index: Int) in
            XCTAssertEqual(i, index)
            XCTAssertEqual(element, strings[safe: index])
            i += 1
        }
    }
    
    func testAppending() {
        let array: [String] = ["0", "1"]
        let array2: [String] = array.appending("2")
        XCTAssert(array.count == 2, "This array should only contain 2 elements")
        XCTAssert(array2.count == 3, "This array should contains 3 elements")
    }
    
}
