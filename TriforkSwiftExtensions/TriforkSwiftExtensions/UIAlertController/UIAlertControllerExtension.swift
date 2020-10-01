//
//  UIAlertControllerExtension.swift
//  TriforkSwiftExtensions
//
//  Created by Thomas Kalhøj Clemensen on 28/08/2017.
//  Copyright © 2017 Trifork A/S. All rights reserved.
//

import UIKit

public extension UIAlertController {
    
    /// Constructs an OK-alert with a `title` and `message`. The `okTitle` can be set to support localization, if not set it will default to `"OK"`.
    static func okAlert(title: String, message: String, okTitle: String = "OK", okAction: (() -> Void)? = nil) -> UIAlertController {
        let alert: UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(title: okTitle, style: .default, action: okAction)
        return alert
    }
    
    /// Presents the receiver on a parent view controller with a custom `tintColor`. 
    ///
    /// The `tintColor` defaults to `nil`, which will give the Apple standard.
    func present(onViewController viewController: UIViewController, tintColor: UIColor? = nil) {
        self.view.tintColor = tintColor
        viewController.present(self, animated: true, completion: {
            self.view.tintColor = tintColor
        })
    }
    
    /// Adds an action to the receiver.
    @discardableResult
    func addAction(title: String, style: UIAlertAction.Style, action: (() -> Void)?) -> UIAlertAction {
        let alertAction: UIAlertAction = UIAlertAction(title: title, style: style, handler: { (_) in
            action?()
        })
        self.addAction(alertAction)
        return alertAction
    }

}
