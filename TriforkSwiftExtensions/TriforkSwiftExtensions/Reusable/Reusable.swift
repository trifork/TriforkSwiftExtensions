//
//  Reusable.swift
//  TriforkSwiftExtensions
//
//  Created by Kim de Vos on 01/02/2019.
//  Copyright © 2019 Trifork A/S. All rights reserved.
//

import UIKit

/// Make your `UITableViewCell` and `UICollectionViewCell` subclasses
/// conform to this protocol when they are *not* NIB-based but only code-based
/// for easier register and dequeue.
public protocol Reusable where Self: UIView {

    /// The reuse identifier to use when registering and later dequeuing a reusable cell
    static var id: String { get }
}
