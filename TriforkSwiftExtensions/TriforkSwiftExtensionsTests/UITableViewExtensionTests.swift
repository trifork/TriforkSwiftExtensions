//
//  UITableViewExtensionTests.swift
//  TriforkSwiftExtensionsTests
//
//  Created by Kim de Vos on 24/05/2019.
//  Copyright © 2019 Trifork A/S. All rights reserved.
//

import XCTest

class UITableViewExtensionTests: XCTestCase {
    var tableView: UITableView!

    override func setUp() {
        super.setUp()

        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: 100, height: 200), style: .grouped)
    }

    func testHeaderHeight() {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 200))

        tableView.tableHeaderView = headerView

        headerView.heightAnchor.constraint(equalToConstant: 20.0).isActive = true

        tableView.updateHeaderViewHeight()

        XCTAssertEqual(tableView.tableHeaderView?.bounds.height, 20)
        XCTAssertEqual(tableView.tableHeaderView?.bounds.width, 100)
    }

    func testFooterHeight() {
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 200))

        tableView.tableFooterView = footerView

        footerView.heightAnchor.constraint(equalToConstant: 30.0).isActive = true

        tableView.updateFooterViewHeight()

        XCTAssertEqual(tableView.tableFooterView?.bounds.height, 30)
        XCTAssertEqual(tableView.tableFooterView?.bounds.width, 100)
    }
}
