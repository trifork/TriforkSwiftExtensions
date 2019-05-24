//
//  UITableViewCellExtension.swift
//  TriforkSwiftExtensions
//
//  Created by Kim de Vos on 01/02/2019.
//  Copyright © 2019 Trifork A/S. All rights reserved.
//

import UIKit

extension UITableViewCell {

    /// Id of cell. Used to register and deque
    static var id: String {
        return NSStringFromClass(self)
    }
}
