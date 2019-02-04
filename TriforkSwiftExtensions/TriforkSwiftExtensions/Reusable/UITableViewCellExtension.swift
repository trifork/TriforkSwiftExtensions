//
//  UITableViewCellExtension.swift
//  TriforkSwiftExtensions
//
//  Created by Kim de Vos on 01/02/2019.
//  Copyright © 2019 Trifork A/S. All rights reserved.
//

import UIKit

extension UITableViewCell: Reusable {
    public static var id: String {
        return NSStringFromClass(self)
    }

    public static var nibName: String {
        return NSStringFromClass(self)
    }
}
