import Foundation
import UIKit
extension UIFont {

    var isItalic: Bool {
        fontDescriptor.symbolicTraits.contains(.traitItalic)
    }

    var isBold: Bool {
        fontDescriptor.symbolicTraits.contains(.traitBold)
    }
}
