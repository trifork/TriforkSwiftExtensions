//
//  UITableViewExtension.swift
//  TriforkSwiftExtensions
//
//  Created by Kim de Vos on 01/02/2019.
//  Copyright © 2019 Trifork A/S. All rights reserved.
//

import UIKit

extension UITableView {
    public func dequeue<T: Reusable>(_ cellClass: T.Type, ofKind kind: String? = nil, for indexPath: IndexPath) -> T {
        return dequeueReusableCell(withIdentifier: cellClass.id, for: indexPath) as! T
    }

    public func register<T: Reusable>(_ cellClass: T.Type, ofKind kind: String? = nil) {
        self.register(UINib(nibName: cellClass.nibName, bundle: nil), forCellReuseIdentifier: cellClass.id)
    }
}
