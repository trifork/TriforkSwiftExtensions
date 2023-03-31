import XCTest
@testable import TriforkSwiftExtensions

class CollectionExtensionTests: XCTestCase {

    
    func testSafeIndex() {
        let array: [Int] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
        
        XCTAssert(array[safe: 0] == 1)
        XCTAssert(array[safe: -1] == nil)
        XCTAssert(array[safe: -100000] == nil)
        XCTAssert(array[safe: 5] == 6)
        XCTAssert(array[safe: 9] == 10)
        XCTAssert(array[safe: 10] == nil)
        XCTAssert(array[safe: 100000] == nil)
    }

    func testIsNotEmpty() {
        let empty: [String] = []
        XCTAssert(empty.isNotEmpty == false, "Should not be \"not empty\" when its empty")

        let single = [""]
        XCTAssert(single.isNotEmpty, "have content, so should not be empty")

        let muliple = [42, 42, 42]
        XCTAssert(muliple.isNotEmpty, "have content, so should not be empty")
    }

}
