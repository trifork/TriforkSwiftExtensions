//
//  UIViewExtension.swift
//  TriforkSwiftExtensions
//
//  Created by Thomas Kalhøj Clemensen on 29/08/2017.
//  Copyright © 2017 Trifork A/S. All rights reserved.
//

import UIKit

public extension UIView {
    
    /// Rounds the left and right sides of the receiver.
    ///
    /// This will also turn a rectangled view into a circle if it is a square.
    func roundForHorizontalEdges() {
        self.layer.cornerRadius = self.bounds.height / 2.0
    }
    
    /// Rounds the top and bottom sides of the receiver.
    ///
    /// This will also turn a rectangled view into a circle if it is a square.
    func roundForVerticalEdges() {
        self.layer.cornerRadius = self.bounds.width / 2.0
    }
    
    /// Turns a square view into a circle.
    @available(*, deprecated, message: "This function has issues when AutoLayout decides the sizes (sometimes AL causes decimals in `size` which makes the extension log an error and not perform the `cornerRadius` adjustment. Replaced by `roundForHorizontalEdges` and `roundForVerticalEdges`")
    func circle() {
        if self.bounds.width == self.bounds.height {
            self.layer.cornerRadius = self.bounds.width / 2.0
        } else {
            TSELogger.log(message: "The view must be a square to make it a circle.")
        }
    }
    
    /// Gets the current first responder of the subviews.
    func currentFirstResponder() -> UIView? {
        var firstResponder: UIView? = nil
        
        if self.isFirstResponder {
            firstResponder = self
        }
        else {
            for view: UIView in self.subviews {
                firstResponder = view.currentFirstResponder()
                
                if firstResponder != nil {
                    break
                }
            }
        }
        
        return firstResponder
    }
    
    /// Rounds corners on an egde
    func roundCornersOnEdge(edge: UIRectEdge) {
        
        let mask: CAShapeLayer = CAShapeLayer()
        mask.backgroundColor = UIColor.black.cgColor
        mask.cornerRadius = self.bounds.height
        mask.frame = self.frame
        
        switch edge {
        case UIRectEdge.top:
            mask.frame.size.height *= 2
        case UIRectEdge.bottom:
            mask.frame.size.height *= 2
            mask.frame.origin.y = -self.frame.size.height
        case UIRectEdge.left:
            mask.frame.size.width *= 2
        case UIRectEdge.right:
            mask.frame.size.width *= 2
            mask.frame.origin.x = -self.frame.size.width
        default:
            break;
        }
        
        self.layer.mask = mask
    }
    
    /// Performs shake animation on view.
    func shake(withShakeDistance shakeDistance: CGFloat = 20, duration: TimeInterval = 0.6, animationKey: String = "shake") {
        let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        animation.duration = duration
        animation.values = [-shakeDistance,
                            shakeDistance,
                            -shakeDistance,
                            shakeDistance,
                            -shakeDistance/2.0,
                            shakeDistance/2.0,
                            -shakeDistance/4.0,
                            shakeDistance/4.0,
                            0.0 ]
        self.layer.add(animation, forKey: animationKey)
    }
    
    
    /// Removes all subviews in the given view
    ///
    /// May not be called in "Draw"
    func removeAllSubViews() {
        //copy to avoid modifying underlying structure at the same time as reading it.
        let ourSubViews = subviews
        ourSubViews.forEach { (view: UIView) in
            view.removeFromSuperview()
        }
    }
    
    /// Finds the first responder in the receiver and its subviews.
    func findFirstResponder() -> UIView? {
        return findFirstResponder(inView: self)
    }
    
    private func findFirstResponder(inView workingView: UIView) -> UIView? {
        var firstResponder: UIView? = nil
        if workingView.isFirstResponder {
            firstResponder = workingView
        }
        else {
            for subview: UIView in workingView.subviews {
                firstResponder = self.findFirstResponder(inView: subview)
                
                if firstResponder != nil {
                    break
                }
            }
        }
        
        return firstResponder
    }
    
    /// Makes this view hidden if it was visible before.
    public func hide() {
        isHidden = true
    }
    
    /// Makes this view visible if it was hidden before.
    public func show() {
        isHidden = false
    }
    
}
