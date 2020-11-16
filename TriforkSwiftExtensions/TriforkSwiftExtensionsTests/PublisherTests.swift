//
//  PublisherTests.swift
//  TriforkSwiftExtensionsTests
//
//  Created by Kim de Vos on 14/11/2020.
//  Copyright © 2020 Trifork A/S. All rights reserved.
//


#if canImport(Combine)
import XCTest
import Combine

@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
final class PublisherTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testIsOnMain() {
        var cancelBag = Set<AnyCancellable>()

        PassthroughSubject<Void, Never>()
            .receive(on: DispatchQueue.global(qos: .background))
            .receiveOnMain()
            .sink(receiveValue: { _ in
                XCTAssertTrue(Thread.isMainThread)
            })
            .store(in: &cancelBag)
    }
}
#endif
