//
//  UIViewControllerExtension.swift
//  TriforkSwiftExtensions
//
//  Created by Thomas Kalhøj Clemensen on 28/08/2017.
//  Copyright © 2017 Trifork A/S. All rights reserved.
//

import UIKit

public extension UIViewController {
    
    /// Presents a default OK alert on the receiver. `okTitle` defaults to `"OK"` and `okAction` defaults to `nil`.
    func presentOkAlert(withTitle title: String, message: String, okTitle: String = "OK", okAction: (() -> Void)? = nil) {
        let alert: UIAlertController = UIAlertController.okAlert(title: title, message: message, okTitle: okTitle, okAction: okAction)
        alert.present(onViewController: self)
    }

}
