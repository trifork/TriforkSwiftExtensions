//
//  Reusable.swift
//  TriforkSwiftExtensions
//
//  Created by Kim de Vos on 01/02/2019.
//  Copyright © 2019 Trifork A/S. All rights reserved.
//

import UIKit

public protocol Reusable where Self: UIView {
    static var id: String { get }

    static var nibName: String { get }
}
