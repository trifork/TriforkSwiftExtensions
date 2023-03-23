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
    
    func testUniqueForArrayOfInt() {
        let objectsArray: [Int] = [0, 1, 2, 3, 4, 1]
        let uniqueArray = objectsArray.unique()
        let expectedArray = uniqueArray.sorted()
        XCTAssertEqual(expectedArray, [0, 1, 2, 3, 4])
    }
    
    func testUniqueForArrayOfStrings() {
        let objectsArray: [String] = ["a", "b", "c", "d", "e", "a"]
        let uniqueArray = objectsArray.unique()
        let expectedArray = uniqueArray.sorted()
        XCTAssertEqual(expectedArray, ["a", "b", "c", "d", "e"])
    }
    
    func testJoined() {
        let testArray1 = ["Monday", "Tuesday"]
        let testArray2 = ["Monday", "Tuesday", "Wednesday", "Thursday"]
        let joinedString1 = testArray1.joined(by: ", ", end: " and ")
        let joinedString2 = testArray2.joined(by: ", ", end: " and ")
        XCTAssertEqual(joinedString1, "Monday and Tuesday")
        XCTAssertEqual(joinedString2, "Monday, Tuesday, Wednesday and Thursday")
    }
    
    func testHead() {
        let testArray = [1, 2]
        XCTAssertEqual(testArray.head, 1)
    }
    
    func testTail() {
        let testArray1 = [1, 2]
        let testArray2 = [1, 2, 3, 4, 5]
        XCTAssertEqual(testArray1.tail, [2])
        XCTAssertEqual(testArray2.tail, [2, 3, 4, 5])
    }
    
    func testNilIfEmpty() {
        let emptyArray: [Int] = []
        let testArray = [1, 2, 3, 4]
        XCTAssertNil(emptyArray.nilIfEmpty)
        XCTAssertEqual(testArray.nilIfEmpty, testArray)
    }
    
    func testSplit() {
        let testArray = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
        let splitArrays = testArray.split { $0 > 5 }
        XCTAssertEqual(splitArrays.1, [1, 2, 3, 4, 5])
        XCTAssertEqual(splitArrays.0, [6, 7, 8, 9, 10])
    }
    
    func testGet() {
        let testArray = ["Casper", "Anders", "Niels", "Thomas"]
        XCTAssertEqual(testArray.get(index: 2), "Niels")
        XCTAssertNil(testArray.get(index: 4))
    }
}
