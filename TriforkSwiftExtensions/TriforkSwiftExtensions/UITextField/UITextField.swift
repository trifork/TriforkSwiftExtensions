import Foundation
import Foundation
import UIKit

extension UITextField {

    func resignOnReturn() {
        addTarget(self, action: #selector(onReturnResign), for: UIControl.Event.editingDidEndOnExit)
    }

    @IBAction private func onReturnResign() {
        resignFirstResponder()
    }

}
