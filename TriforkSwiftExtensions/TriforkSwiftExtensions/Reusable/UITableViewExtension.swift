//
//  UITableViewExtension.swift
//  TriforkSwiftExtensions
//
//  Created by Kim de Vos on 01/02/2019.
//  Copyright © 2019 Trifork A/S. All rights reserved.
//

import UIKit

extension UITableView {

    /// Returns a reusable table-view cell object for the specified reuse identifier and type and adds it to the table.
    ///
    /// - Parameter cellClass: Cell type
    /// - Returns: A cell of the given type
    public func dequeue<Cell: Reusable>(_ cellClass: Cell.Type) -> Cell? {
        return dequeueReusableCell(withIdentifier: Cell.id) as? Cell
    }

    /// Returns a reusable header or footer view located by its identifier.
    ///
    /// - Parameter headerFooterClass:
    /// - Returns: A header or footer view of the given type
    public func dequeueReusableHeaderFooterView<HeaderFooterView: Reusable>(_ headerFooterClass: HeaderFooterView.Type) -> HeaderFooterView? {
        return dequeueReusableHeaderFooterView(withIdentifier: headerFooterClass.id) as? HeaderFooterView
    }

    /// Registers a cell with default cell id
    ///
    /// - Parameter cellClass: A cell type
    public func register<Cell: Reusable>(cell cellClass: Cell.Type) {
        self.register(cellClass, forCellReuseIdentifier: cellClass.id)
    }

    /// Registers a header or footer with default header or footer id
    ///
    /// - Parameter cellClass: A cell type
    public func register<HeaderFooterView: Reusable>(headerFooter headerFooterClass: HeaderFooterView.Type) {
        self.register(headerFooterClass.self, forHeaderFooterViewReuseIdentifier: headerFooterClass.id)
    }
}
