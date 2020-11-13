//
//  SequenceExtensions.swift
//  TriforkSwiftExtensions
//
//  Created by Kim de Vos on 29/10/2020.
//  Copyright © 2020 Trifork A/S. All rights reserved.
//

import Foundation

#if canImport(Combine)
import Combine

@available(iOS 13.0, *)
public extension Sequence where Element: Cancellable {
    func cancel() { forEach { $0.cancel() } }
}
#endif
