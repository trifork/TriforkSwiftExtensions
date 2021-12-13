//
//  PublisherExtensions.swift
//  TriforkSwiftExtensions
//
//  Created by Kim de Vos on 14/11/2020.
//  Copyright © 2020 Trifork A/S. All rights reserved.
//

import Foundation

/// Xcode 13 release has a known error for Combine code and armv7 architectures.
/// https://developer.apple.com/documentation/Xcode-Release-Notes/xcode-13-release-notes
///
/// Swift libraries depending on Combine may fail to build for targets including armv7 and i386 architectures. (82183186, 82189214)
/// Workaround: Use an updated version of the library that isn’t impacted (if available) or remove armv7 and i386 support (for example, increase the deployment target of the library to iOS 11 or higher).
#if canImport(Combine) &&  !(os(iOS) && (arch(i386) || arch(arm))) //canImport(Combine) && is64Bit
import Combine

@available(iOS 13.0, *)
extension Publisher {
    /// Receives on `DispatchQueue.main`
    public func receiveOnMain() -> Publishers.ReceiveOn<Self, DispatchQueue> {
        return self.receive(on: DispatchQueue.main)
    }

    /// Zips conditionally based on `condition`.
    /// Uses `Just` with fallback value if `condition` is `false`
    public func zipIf<P>(
        _ condition: @autoclosure () -> Bool,
        _ constructPublisher: @autoclosure () -> P,
        fallbackOutput: P.Output) -> Publishers.Zip<Self, AnyPublisher<P.Output, P.Failure>> where P : Publisher, P.Failure == Self.Failure {
        let publisher = PublisherHelper.conditional(condition: condition(), constructPublisher: constructPublisher(), fallbackOutput: fallbackOutput)
        return zip(publisher)
    }

    /// FlatMaps conditionally based on `condition`
    /// Uses `Just` with fallback value if `condition` is `false`
    public func flatMapIf<P>(
        _ condition: @escaping @autoclosure () -> Bool,
        _ constructPublisher: @escaping (Self.Output) -> P,
        fallbackOutput: P.Output) -> Publishers.FlatMap<AnyPublisher<P.Output, P.Failure>, Self> where P : Publisher, Self.Failure == P.Failure {
        self.flatMap { (output) in
            PublisherHelper.conditional(condition: condition(), constructPublisher: constructPublisher(output), fallbackOutput: fallbackOutput)
        }
    }
}

@available(iOS 13.0, *)
private final class PublisherHelper {

    /// Takes a bool (as autoclosure) which indicates whether the publisher should be constructed.
    /// If the `condition` returns `true` the publisher will be constructed, otherwise it will fallback on
    /// a `Just` publisher with `fallbackOutput`
    static func conditional<P>(
        condition: @autoclosure () -> Bool,
        constructPublisher: @autoclosure () -> P,
        fallbackOutput: P.Output) -> AnyPublisher<P.Output, P.Failure> where P : Publisher {
        if condition() {
            return constructPublisher().eraseToAnyPublisher()
        } else {
            return Just(fallbackOutput)
                .setFailureType(to: P.Failure.self)
                .eraseToAnyPublisher()
        }
    }
}
#endif
