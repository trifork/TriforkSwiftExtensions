//
//  UIViewExtensionTests.swift
//  TriforkSwiftExtensions
//
//  Created by Thomas Kalhøj Clemensen on 29/08/2017.
//  Copyright © 2017 Trifork A/S. All rights reserved.
//

import XCTest
@testable import TriforkSwiftExtensions

class UIViewExtensionTests: XCTestCase {
    
    func testCircle() {
        let view: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 101))
        view.circle()
        XCTAssertEqual(view.layer.cornerRadius, 0.0)
        view.frame.size.height = 100
        view.circle()
        XCTAssertEqual(view.layer.cornerRadius, 50.0)
    }
    
    func testRoundEdge() {
        let view: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 500))
        view.roundForHorizontalEdges()
        XCTAssertEqual(view.layer.cornerRadius, 250.0)
        view.roundForVerticalEdges()
        XCTAssertEqual(view.layer.cornerRadius, 50.0)
    }
    
    func testRemoveAllSubViews() {
        let emptyParent = UIView()
        XCTAssertEqual(emptyParent.subviews.count, 0)
        emptyParent.removeAllSubViews()
        XCTAssertEqual(emptyParent.subviews.count, 0)
        let child1 = UIView()
        let parent1 = UIView()
        parent1.addSubview(child1)
        XCTAssertEqual(parent1.subviews.count, 1)
        parent1.removeAllSubViews()
        XCTAssertEqual(parent1.subviews.count, 0)
        
        let parentMany = UIView()
        let childs = [UIView(), UIView(), UIView(), UIView()]
        childs.forEach({(uiView: UIView, _)  in
              parentMany.addSubview(uiView)
        })
        XCTAssertEqual(parentMany.subviews.count, childs.count)
        parentMany.removeAllSubViews()
        XCTAssertEqual(parentMany.subviews.count, 0)
        
    }
}
