//
//  ReusableTests.swift
//  TriforkSwiftExtensionsTests
//
//  Created by Kim de Vos on 04/02/2019.
//  Copyright © 2019 Trifork A/S. All rights reserved.
//

import XCTest

class ReusableTests: XCTestCase {

    var tableView: UITableView!

    override func setUp() {
        super.setUp()

        tableView = UITableView()
    }


    func testRegisterCell() {
        tableView.register(cell: CellItem.self)

        let cell = tableView.dequeue(CellItem.self)

        XCTAssertNotNil(cell)
    }

    func testNonRegisterCell() {
        let cell = tableView.dequeue(CellItem.self)

        XCTAssertNil(cell)
    }

    func testRegisterHeader() {
        tableView.register(headerFooter: HeaderItem.self)

        let header = tableView.dequeueReusableHeaderFooterView(HeaderItem.self)

        XCTAssertNotNil(header)
    }

    func testNonRegisterHeader() {
        let header = tableView.dequeueReusableHeaderFooterView(HeaderItem.self)

        XCTAssertNil(header)
    }

}

fileprivate class CellItem: UITableViewCell { }
fileprivate class HeaderItem: UITableViewHeaderFooterView { }
