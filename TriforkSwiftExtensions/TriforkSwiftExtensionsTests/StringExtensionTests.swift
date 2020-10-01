//
//  StringExtensionTests.swift
//  TriforkSwiftExtensions
//
//  Created by Thomas Kalhøj Clemensen on 28/08/2017.
//  Copyright © 2017 Trifork A/S. All rights reserved.
//

import XCTest
@testable import TriforkSwiftExtensions

class StringExtensionTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testUrlEncodedWithQuery() {
        let string: String = "http://my-important-url.com?withCoolParameters=coolParamters&andOtherStuffWithSpaces=some stuff"
        XCTAssertEqual("http://my-important-url.com?withCoolParameters=coolParamters&andOtherStuffWithSpaces=some%20stuff", string.urlEncodedWithQuery)
    }
    
    func testUrlEncoded() {
        let string: String = "http://my-important-url.com?withCoolParameters=coolParamters&andOtherStuffWithSpaces=some stuff"
        XCTAssertEqual("http%3A%2F%2Fmy-important-url.com%3FwithCoolParameters%3DcoolParamters%26andOtherStuffWithSpaces%3Dsome%20stuff", string.urlEncoded)
    }
    
    func testBase64Encoded() {
        let string: String = "This is a very cool string. Including emojis 🚀"
        XCTAssertEqual("VGhpcyBpcyBhIHZlcnkgY29vbCBzdHJpbmcuIEluY2x1ZGluZyBlbW9qaXMg8J+agA==", string.base64Encoded)
    }
    
    func testDecodeBase64() {
        let string: String = "VGhpcyBpcyBhIHZlcnkgY29vbCBzdHJpbmcuIEluY2x1ZGluZyBlbW9qaXMg8J+agA=="
        XCTAssertEqual("This is a very cool string. Including emojis 🚀", string.decodeBase64)
    }
    
    func testToURL() {
        let urlString: String = "http://trifork.com"
        XCTAssertEqual(urlString, urlString.toURL()?.absoluteString)
    }
    
    func testToData() {
        let string: String = "Test string"
        let data: Data? = string.toData()
        let data2: Data? = string.data(using: .utf8)
        XCTAssertEqual(data?.hashValue,data2?.hashValue)
    }
    
    func testLength() {
        let string: String = "Another test string 🎈"
        XCTAssertEqual(string.length, 21)
    }
    
    func testMatchesRegExObject() {
        let regExHtmlPattern: String = "([*_])(.+?)\\1" //Note that the RegEx format of iOS needs special treatment.
        XCTAssertFalse("THERE IS NO ASTERISKS OR UNDERSCORES IN ME 😤".isMatching(regEx: regExHtmlPattern, options: .caseInsensitive))
        XCTAssertTrue("Hey-Hey! _Look_ at *me*!".isMatching(regEx: regExHtmlPattern, options: .caseInsensitive))
        XCTAssertFalse("I *wish I could be_ just as cool as the string above.".isMatching(regEx: regExHtmlPattern, options: .caseInsensitive))
    }
    
    func testMatchesRegExString() {
        let emailPattern: String = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}" //Note that the RegEx format of iOS needs special treatment.
        XCTAssertFalse("tkc[at]trifork[dot]com".isMatching(regEx: emailPattern))
        XCTAssertTrue("tkc@trifork.com".isMatching(regEx: emailPattern))
        XCTAssertFalse("tkc@triforkcom".isMatching(regEx: emailPattern))
    }

    func testMatchesWithThreeNames() {
        let namePattern: String = "Thomas" //Note that the RegEx format of iOS needs special treatment.
        XCTAssertEqual("Find my name: Thomas. So my name is Thomas. Are there any Thomases here?".matches(regEx: namePattern).count, 3)
    }

    func testAllMatchesWithThreeUrls() {
        let urls: String = """
                            https://trifork.com/blog
                            https://trifork.com/jobs
                            https://trifork.com/about
                            """

        let urlPattern = "https://trifork.com/[\\S]+"
        XCTAssertEqual(urls.matches(regEx: urlPattern).count, 3)
    }

    func testAllMatchesWithOneName() {
        let namePattern: String = "Thomas" //Note that the RegEx format of iOS needs special treatment.
        XCTAssertEqual("Find my name: Thomas.".matches(regEx: namePattern).count, 1)
    }
    
    func testIsEmail() {
        XCTAssertTrue("tkc@trifork.com".isEmail)
        XCTAssertTrue("test@test.test".isEmail)
        XCTAssertTrue("a@b.cd".isEmail)
        XCTAssertTrue("a@b.c".isEmail) // Allowed but currently there are no top domains with one character
        XCTAssertFalse("tkc[at]trifork[dot]com".isEmail)
        XCTAssertFalse("tkc@trifork[dot]com".isEmail)
        XCTAssertFalse("tkc[at]trifork.com".isEmail)
        XCTAssertFalse("tkc@triforkcom".isEmail)
        XCTAssertFalse("tkc@trifork".isEmail)
        XCTAssertFalse("tkctrifork.com".isEmail)
        XCTAssertFalse("a@.....trifork.com".isEmail)
        XCTAssertFalse("sdfsdf@sdf.dk.....d@".isEmail)
    }
    
    func testIsPhoneNumber() {
        XCTAssertTrue("+4587328787".isPhoneNumber)
        XCTAssertTrue("+45 8732 8787".isPhoneNumber)
        XCTAssertTrue("+45 87 32 87 87".isPhoneNumber)
        XCTAssertTrue("+49 30 120 895 940".isPhoneNumber)
        XCTAssertTrue("+31 (0)20 260 0302".isPhoneNumber)
        XCTAssertTrue("+31 20 486 2036".isPhoneNumber)
        XCTAssertTrue("+48 124 46 7127".isPhoneNumber)
        XCTAssertTrue("+46 70 445 08 63".isPhoneNumber)
        XCTAssertTrue("+41 44 768 32 32".isPhoneNumber)
        XCTAssertTrue("+44 20 3393 8242".isPhoneNumber)
        XCTAssertTrue("+1 415-486-4800".isPhoneNumber)
        XCTAssertFalse("+1 415-486-4800a".isPhoneNumber)
        XCTAssertFalse("+1 123".isPhoneNumber)
        XCTAssertFalse("1234".isPhoneNumber)
    }
    
    func testConvertStringToAttributed() {
        let font = UIFont.systemFont(ofSize: 12)
        let color = UIColor.magenta
        
        let letterSpacing: CGFloat = 5.0
        let lineSpacing: CGFloat = 3.0
        let lineHeight: CGFloat = 10.0
        
        let textAlignment: NSTextAlignment = .center
        let lineBreakMode: NSLineBreakMode = .byWordWrapping
        
        let string = "This is my awesome string"
        let attributedString: NSMutableAttributedString = string.convertToAttributed(withOptions: [
            .font(font),
            .textColor(color),
            .letterSpacing(letterSpacing),
            .lineSpacing(lineSpacing),
            .lineHeight(lineHeight),
            .textAlignment(textAlignment),
            .lineBreakMode(lineBreakMode)
        ])
        
        let attributes: [NSAttributedString.Key: Any] = attributedString.attributes(at: 0, effectiveRange: nil)
        XCTAssert((attributes[NSAttributedString.Key.paragraphStyle] as? NSParagraphStyle)?.lineSpacing == lineSpacing, "The line spacing should be \(lineSpacing)")
        XCTAssert((attributes[NSAttributedString.Key.paragraphStyle] as? NSParagraphStyle)?.minimumLineHeight == lineHeight, "The line height should be \(lineHeight)")
        XCTAssert((attributes[NSAttributedString.Key.paragraphStyle] as? NSParagraphStyle)?.maximumLineHeight == lineHeight, "The line height should be \(lineHeight)")
        XCTAssert((attributes[NSAttributedString.Key.paragraphStyle] as? NSParagraphStyle)?.alignment == textAlignment, "The text alignment should be \(textAlignment)")
        XCTAssert((attributes[NSAttributedString.Key.paragraphStyle] as? NSParagraphStyle)?.lineBreakMode == lineBreakMode, "The line break mode should be \(lineBreakMode)")
        
        XCTAssert((attributes[NSAttributedString.Key.font] as? UIFont)?.fontName == font.fontName, "The font name should be \(font.fontName)")
        XCTAssert((attributes[NSAttributedString.Key.font] as? UIFont)?.pointSize == font.pointSize, "The size should be \(String(describing: font.pointSize))")
        XCTAssert((attributes[NSAttributedString.Key.foregroundColor] as? UIColor) == color, "The color should be \(color.description)")
        XCTAssert((attributes[NSAttributedString.Key.kern] as? CGFloat) == letterSpacing, "The letter spacing should be \(String(describing: letterSpacing))")
    }
}
