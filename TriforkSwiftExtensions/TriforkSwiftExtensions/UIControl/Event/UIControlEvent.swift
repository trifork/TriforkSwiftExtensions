import Foundation
import UIKit

extension UIControl.Event {

    static let touchEndedEvents: UIControl.Event = [
        UIControl.Event.touchUpInside,
        UIControl.Event.touchCancel,
        UIControl.Event.touchDragExit,
        UIControl.Event.touchDragOutside
    ]
}
