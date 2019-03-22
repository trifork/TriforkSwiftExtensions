//
//  UITableViewHeaderFooterViewExtension.swift
//  TriforkSwiftExtensions
//
//  Created by Kim de Vos on 04/02/2019.
//  Copyright © 2019 Trifork A/S. All rights reserved.
//

import UIKit

extension UITableViewHeaderFooterView {

    /// Id of header or footer view. Used to register and deque
    static var id: String {
        return NSStringFromClass(self)
    }
}
