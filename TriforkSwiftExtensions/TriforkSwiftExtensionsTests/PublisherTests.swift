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

    private var cancelBag = Set<AnyCancellable>()

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        cancelBag.removeAll()
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

    func testZipIf() {
        let expectationFalseCondition = XCTestExpectation(description: "False expectation never returned")
        let expectationTrueCondition = XCTestExpectation(description: "True expectation never returned")

        let publisher = Just("🥳").setFailureType(to: Error.self)
        publisher.zipIf(false, ForceFailPublisher(), fallbackOutput: "🥤")
            .sink(receiveCompletion: { (completion) in
                switch completion {
                case .failure:
                    XCTFail("Shouldn't fail")
                case .finished:
                    expectationFalseCondition.fulfill()
                }
            }, receiveValue: { (result) in
                XCTAssertEqual(result.0, "🥳")
                XCTAssertEqual(result.1, "🥤")
            })
            .store(in: &cancelBag)


        publisher.zipIf(true, Just("🍾").setFailureType(to: Error.self), fallbackOutput: "🥤")
            .sink(receiveCompletion: { (completion) in
                switch completion {
                case .failure:
                    XCTFail("Shouldn't fail")
                case .finished:
                    expectationTrueCondition.fulfill()
                }
            }, receiveValue: { (result) in
                XCTAssertEqual(result.0, "🥳")
                XCTAssertEqual(result.1, "🍾")
            })
            .store(in: &cancelBag)

        wait(for: [expectationFalseCondition, expectationTrueCondition], timeout: 1.0)
    }

    func testFlatMapIf() {
        let expectationFalseCondition = XCTestExpectation(description: "False expectation never returned")
        let expectationTrueCondition = XCTestExpectation(description: "True expectation never returned")

        let publisher = Just("🥳").setFailureType(to: Error.self)
        publisher.flatMapIf(false, ForceFailPublisher(), fallbackOutput: "🥤")
            .sink(receiveCompletion: { (completion) in
                switch completion {
                case .failure:
                    XCTFail("Shouldn't fail")
                case .finished:
                    expectationFalseCondition.fulfill()
                }
            }, receiveValue: { (result) in
                XCTAssertEqual(result, "🥤")
            })
            .store(in: &cancelBag)

        publisher.flatMapIf(true, Just("🍾").setFailureType(to: Error.self), fallbackOutput: "🥤")
            .sink(receiveCompletion: { (completion) in
                switch completion {
                case .failure:
                    XCTFail("Shouldn't fail")
                case .finished:
                    expectationTrueCondition.fulfill()
                }
            }, receiveValue: { (result) in
                XCTAssertEqual(result, "🍾")
            })
            .store(in: &cancelBag)

        wait(for: [expectationFalseCondition, expectationTrueCondition], timeout: 1.0)
    }
}

@available(iOS 13, *)
private struct ForceFailPublisher: Publisher {

    typealias Output = String
    typealias Failure = Error

    init() {
        failTest()
    }

    func receive<S>(subscriber: S) where S : Subscriber, Self.Failure == S.Failure, Self.Output == S.Input {
        failTest()
    }

    private func failTest() {
        XCTFail("This publisher should never be constructed!")
    }
}

#endif
