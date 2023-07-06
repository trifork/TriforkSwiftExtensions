import Foundation

extension NotificationCenter {

    /// sets the given observer. if there already is another equal observer it will be removed first
    /// This avoids double registration
    /// - Parameters:
    ///   - observer: the observer, see addObserver for more info
    ///   - selector: the callback function (selector), see addObserver for more info
    ///   - name:  the observed name, see addObserver for more info
    ///   - object: the object to pass along on selector invocation, see addObserver for more info
    func setObserver(
        observer: AnyObject,
        selector: Selector,
        name: NSNotification.Name?,
        object: AnyObject?
    ) {
        NotificationCenter.default.removeObserver(observer, name: name, object: object)
        NotificationCenter.default.addObserver(observer, selector: selector, name: name, object: object)
    }
}
