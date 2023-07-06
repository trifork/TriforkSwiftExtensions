import UIKit

public extension UIView {

    /// Constructor to set `translatesAutoresizingMaskIntoConstraints` directly on init
    convenience init(translatesAutoresizingMask: Bool) {
        self.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = translatesAutoresizingMask
    }

    /// Rounds the left and right sides of the receiver.
    ///
    /// This will also turn a rectangled view into a circle if it is a square.
    func roundHorizontalEdges() {
        layer.cornerRadius = self.bounds.height / 2.0
    }
    
    /// Rounds the top and bottom sides of the receiver.
    ///
    /// This will also turn a rectangled view into a circle if it is a square.
    func roundVerticalEdges() {
        layer.cornerRadius = self.bounds.width / 2.0
    }
    
    /// Gets the current first responder of the subviews.
    func currentFirstResponder() -> UIView? {
        var firstResponder: UIView? = nil
        
        if isFirstResponder {
            firstResponder = self
        }
        else {
            for view: UIView in subviews {
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
        
        layer.mask = mask
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
        layer.add(animation, forKey: animationKey)
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
        findFirstResponder(inView: self)
    }

    /// Adds `view` as subview to `self` and sets constraints for all edges with specified inset.
    func addSubview(_ view: UIView, withEdgeInsets inset: UIEdgeInsets) {
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        NSLayoutConstraint.activate([
            view.leadingAnchor.constraint(equalTo: leadingAnchor, constant: inset.left),
            view.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -inset.right),
            view.topAnchor.constraint(equalTo: topAnchor, constant: inset.top),
            view.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -inset.bottom)
        ])
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
    func hide() {
        isHidden = true
    }

    /// Makes this view visible if it was hidden before.
    func show() {
        isHidden = false
    }

    /// Tells if this view is visible.
    /// inverse of isHidden.
    var isVisible: Bool {
        get {
            !isHidden
        }
        set {
            isHidden = !newValue
        }
    }


}
