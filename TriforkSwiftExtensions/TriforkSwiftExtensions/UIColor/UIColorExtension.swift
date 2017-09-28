//
//  UIColorExtension.swift
//  TriforkSwiftExtensions
//
//  Created by Thomas Kalhøj Clemensen on 28/09/2017.
//  Copyright © 2017 Trifork A/S. All rights reserved.
//

import Foundation

public extension UIColor {
    ///
    /// Accepts color string of the form: rgb 158 159 165
    ///
    public convenience init?(rgb: String) {
        let parts = rgb.allMatches(withRegularExpression: "rgb ([0-9]+) ([0-9]+) ([0-9]+)")
        if parts.count == 3 {
            let ints: [CGFloat] = parts.map { CGFloat(Int($0)!) }
            self.init(red: ints[0]/255.0, green: ints[1]/255.0, blue: ints[2]/255.0, alpha: 1)
        } else {
            return nil
        }
    }
}
