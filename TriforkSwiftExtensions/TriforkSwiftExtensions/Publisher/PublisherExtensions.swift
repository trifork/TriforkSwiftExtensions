//
//  PublisherExtensions.swift
//  TriforkSwiftExtensions
//
//  Created by Kim de Vos on 14/11/2020.
//  Copyright © 2020 Trifork A/S. All rights reserved.
//

import Foundation

#if canImport(Combine)
import Combine

@available(iOS 13.0, *)
extension Publisher {
    public func receiveOnMain() -> Publishers.ReceiveOn<Self, DispatchQueue> {
        return self.receive(on: DispatchQueue.main)
    }
}
#endif
