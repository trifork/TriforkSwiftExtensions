//
//  NSMutableAttributedStringExtensionTests.swift
//  TriforkSwiftExtensions
//
//  Created by Thomas Kalhøj Clemensen on 23/08/2017.
//  Copyright © 2017 Trifork A/S. All rights reserved.
//

import XCTest
@testable import TriforkSwiftExtensions

class NSMutableAttributedStringExtensionTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testAppendTextFontColor() {
        let attributedString: NSMutableAttributedString = NSMutableAttributedString()
        XCTAssert(attributedString.length == 0)
        
        let text: String = "A very testy string"
        attributedString.appendString(text: text, withFont: UIFont.boldSystemFont(ofSize: 15.0), andColor: UIColor.magenta)
        XCTAssert(attributedString.string == text)
        
        let attributes: [NSAttributedString.Key: Any] = attributedString.attributes(at: 0, effectiveRange: nil)
        self.assert(attributes: attributes, fontName: ".SFUI-Semibold", fontSize: 15.0, color: UIColor.magenta)
        
        let text2: String = "something after that"
        attributedString.appendString(text: text2, withFont: UIFont.systemFont(ofSize: 50.0), andColor: nil)
        
        let attributes2: [NSAttributedString.Key: Any] = attributedString.attributes(at: text.count, effectiveRange: nil)
        
        let iOSVersionMajor: Int = ProcessInfo().operatingSystemVersion.majorVersion
        let expectedFontName: String
        if iOSVersionMajor > 9 {
            expectedFontName = ".SFUI-Regular"
        }
        else {
            expectedFontName = ".SFUIDisplay-Regular"
        }
        
        self.assert(attributes: attributes2, fontName: expectedFontName, fontSize: 50.0, color: nil)
        
        //Check index 0 again, to make sure the attributes weren't changed after 'attributes2' was used.
        let attributes3: [NSAttributedString.Key: Any] = attributedString.attributes(at: 0, effectiveRange: nil)
        self.assert(attributes: attributes3, fontName: ".SFUI-Semibold", fontSize: 15.0, color: UIColor.magenta)
    }
    
    func testInitWithLineSpacing() {
        let lineSpacing: CGFloat = 6.0
        let attributedString: NSMutableAttributedString = NSMutableAttributedString(string: "text", withLineSpacing: lineSpacing)
        let attributes: [NSAttributedString.Key: Any] = attributedString.attributes(at: 0, effectiveRange: nil)
        XCTAssert((attributes[NSAttributedString.Key.paragraphStyle] as? NSParagraphStyle)?.lineSpacing == lineSpacing, "The line spacing should be \(lineSpacing)")
    }
    
    func testSetLineHeihgtAndLineSpacing() {
        let lineSpacing: CGFloat = 6.0
        let lineHeight: CGFloat = 3.0
        let attributedString: NSMutableAttributedString = NSMutableAttributedString(string: "text")
        attributedString.set(lineHeight: lineHeight, lineSpacing: lineSpacing)
        self.assert(lineSpacing: lineSpacing, lineHeight: lineHeight, forAttributedString: attributedString)
        
        let attributedString2: NSMutableAttributedString = NSMutableAttributedString(string: "text")
        attributedString2.set(lineHeight: lineHeight)
        self.assert(lineSpacing: 0, lineHeight: lineHeight, forAttributedString: attributedString2)
        
        let attributedString3: NSMutableAttributedString = NSMutableAttributedString(string: "text")
        attributedString3.set(lineHeight: nil, lineSpacing: lineSpacing)
        self.assert(lineSpacing: lineSpacing, lineHeight: 0, forAttributedString: attributedString3)
        
        let attributedString4: NSMutableAttributedString = NSMutableAttributedString(string: "text")
        attributedString4.set(lineHeight: nil, lineSpacing: nil)
        self.assert(lineSpacing: 0, lineHeight: 0, forAttributedString: attributedString4)
    }
    
    private func assert(lineSpacing: CGFloat, lineHeight: CGFloat, forAttributedString attributedString: NSMutableAttributedString) {
        let attributes: [NSAttributedString.Key: Any] = attributedString.attributes(at: 0, effectiveRange: nil)
        XCTAssert((attributes[NSAttributedString.Key.paragraphStyle] as? NSParagraphStyle)?.lineSpacing == lineSpacing, "The line spacing should be \(lineSpacing)")
        XCTAssert((attributes[NSAttributedString.Key.paragraphStyle] as? NSParagraphStyle)?.minimumLineHeight == lineHeight, "The line height should be \(lineHeight)")
        XCTAssert((attributes[NSAttributedString.Key.paragraphStyle] as? NSParagraphStyle)?.maximumLineHeight == lineHeight, "The line height should be \(lineHeight)")
    }
    
    private func assert(attributes: [NSAttributedString.Key: Any], fontName: String?, fontSize: CGFloat?, color: UIColor?) {
        XCTAssert((attributes[NSAttributedString.Key.font] as? UIFont)?.fontName == fontName, "The font name should be \(fontName ?? "nil")")
        XCTAssert((attributes[NSAttributedString.Key.font] as? UIFont)?.pointSize == fontSize, "The size should be \(String(describing: fontSize))")
        XCTAssert((attributes[NSAttributedString.Key.foregroundColor] as? UIColor) == color, "The color should be \(color?.description ?? "nil")")
    }
}
