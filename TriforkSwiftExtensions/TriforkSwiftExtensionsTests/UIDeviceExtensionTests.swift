import XCTest
@testable import TriforkSwiftExtensions

class UIDeviceExtensionTests: XCTestCase {
    
    func testModelName() {
        let validSimulatorNames: [String] = ["x84_64", "arm64"]
        XCTAssert(validSimulatorNames.contains(UIDevice.current.modelName))
    }
}
