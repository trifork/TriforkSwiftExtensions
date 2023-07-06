import XCTest
@testable import TriforkSwiftExtensions

class OptionalExtensionTests: XCTestCase {
    
    func testPassTo(){
        var receiver : String? = ""
        
        var optValue : String? = nil
        receiver.passToOrNil(action: {optValue = $0})
        XCTAssertEqual(optValue, receiver)
        
        receiver = nil
        receiver.passToOrNil(action: {optValue = $0})
        XCTAssertEqual(optValue, "") //should not have changed due to action only called with nonnull argument
    }
    
    func testDoWith() {
        var receiver: String? = ""
        receiver.doWith { (unwrapped: String) in
            XCTAssertEqual(receiver, unwrapped)
        }
        receiver = nil
        receiver.doWith { (unwrapped: String) in
            XCTAssert(false, "This should not be called")
        }
    }
    
    func testIsNilOrEmptyString() {
        var optionalString: String? = nil
        XCTAssertTrue(optionalString.isNilOrEmpty)
        optionalString = ""
        XCTAssertTrue(optionalString.isNilOrEmpty)
        optionalString = "👻"
        XCTAssertFalse(optionalString.isNilOrEmpty)
    }

    func testIsNilOrEmptyCollection() {
        var optionalCollection: [Int]? = nil
        XCTAssertTrue(optionalCollection.isNilOrEmpty)
        optionalCollection = []
        XCTAssertTrue(optionalCollection.isNilOrEmpty)
        optionalCollection = [1, 2, 3]
        XCTAssertFalse(optionalCollection.isNilOrEmpty)
    }
    
    func testFlattern() {
        let fullNil: String?? = nil
        XCTAssertNil(fullNil.flattern())
        
        let notNil: String?? = "test"
        XCTAssertEqual("test",notNil.flattern())
    }
    
}
