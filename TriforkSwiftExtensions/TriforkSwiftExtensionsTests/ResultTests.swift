//
//  ResultTests.swift
//  TriforkSwiftExtensionsTests
//
//  Created by Thomas Kalhøj Clemensen on 02/05/2019.
//  Copyright © 2019 Trifork A/S. All rights reserved.
//

import XCTest

enum ResultTestError: Error {
    case failed
}

class ResultTests: XCTestCase {
    
    func testSuccess() {
        self.generateResult(shouldFail: false)
            .success({ (value: Int) in
                XCTAssertEqual(value, 1337)
            })
            .failure({ (error: ResultTestError) in
                XCTFail("This should never be called in this scenario!")
            })
    }
    
    func testFailure() {
        self.generateResult(shouldFail: true)
            .success({ (value: Int) in
                XCTFail("This should never be called in this scenario!")
            })
            .failure({ (error: ResultTestError) in
                XCTAssertEqual(error, .failed)
            })
    }
    
    func testVoidSuccess() {
        let result: Result<Void, ResultTestError> = .success()
        switch result {
        case .success:
            break
        case .failure:
            XCTFail("This should not fail.")
        }
    }
    
    //MARK: - 
    private func generateResult(shouldFail: Bool) -> Result<Int, ResultTestError> {
        if shouldFail {
            return .failure(.failed)
        } else {
            return .success(1337)
        }
    }
    
}
