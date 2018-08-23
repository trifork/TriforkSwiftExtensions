//
//  UIApplicationExtensions.swift
//  TriforkSwiftExtensions
//
//  Created by Thomas Kalhøj Clemensen on 17/07/2018.
//  Copyright © 2018 Trifork A/S. All rights reserved.
//

import Foundation
import UIKit

public extension UIApplication {
    
    /// Calls `phoneNumber` by using the tel:// scheme.
    public func callPhoneNumber(phoneNumber: String) {
        self.openSafe(url: "tel://\(phoneNumber)", options: nil, completionHandler: nil)
    }
    
    
    /// Check whether the current device supports the tel:// scheme
    public func canOpenPhoneUrl() -> Bool {
        let canOpen: Bool
        
        if let phoneTestUrl: URL = URL(string: "tel://") {
            canOpen = self.canOpenURL(phoneTestUrl)
        }
        else {
            canOpen = false
        }
        
        return canOpen
    }
    
    
    /// Opens `address` in Apple Maps.
    public func openAppleMaps(address: String) {
        self.openSafe(url: "https://maps.apple.com/?q=\(address.urlEncoded)", options: nil, completionHandler: nil)
    }
    
    /// Opens `address` in Google maps if available. If `useAppleMApsIfUnable` is `true` the function will fallback to Apple Maps, if Google Maps is not available. Otherwise the function will do nothing.
    public func openGoogleMaps(address: String, useAppleMapsIfUnable: Bool = false) {
        openSafe(url: "comgooglemaps://?q=\(address.urlEncoded)", options: nil) { [weak self] (success: Bool) -> Void in
            if !success && useAppleMapsIfUnable {
                self?.openAppleMaps(address: address)
            }
        }
    }
    
    /// Opens a url safe by validating the `url` parameter as a valid URL-object and asks the application if it can open the `url`.
    ///
    /// If the `canOpenUrl` check fails the method will do nothing.
    public func openSafe(url: String, options: [String: Any]?, completionHandler: ((Bool) -> Void)?) {
        if let safeUrl = URL(string: url) {
            self.openSafe(url: safeUrl, options: nil, completionHandler: completionHandler)
        } else {
            completionHandler?(false)
            TSELogger.log(message: "Could not create link, url is not valid, was : \"\(url)\"")
        }
    }
    
    /// Opens a url safe by asking the application if it can open the `url`.
    ///
    /// If the `canOpenUrl` check fails the method will do nothing.
    public func openSafe(url: URL, options: [String: Any]?, completionHandler: ((Bool) -> Void)?) {
        if !self.canOpenURL(url) {
            TSELogger.log(message: "could not open url :\(url.absoluteString)")
            completionHandler?(false)
        }
        if #available(iOS 10.0, *) {
            open(url, options: options ?? [:], completionHandler: completionHandler)
        } else {
            completionHandler?(openURL(url))
        }
    }
    
    /// Recursively searches for the top most view controller based on a view controller as starting point.
    ///
    /// 1. Checks for UINavigationController's visibleViewController
    /// 2. Checks for selected UITabBarController's selectedViewController
    /// 3. Check for presented view controllers.
    static func topViewController(controller: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let navigationController = controller as? UINavigationController {
            return topViewController(controller: navigationController.visibleViewController)
        }
        if let tabController = controller as? UITabBarController {
            if let selected = tabController.selectedViewController {
                return topViewController(controller: selected)
            }
        }
        if let presented = controller?.presentedViewController {
            return topViewController(controller: presented)
        }
        return controller
    }
}
