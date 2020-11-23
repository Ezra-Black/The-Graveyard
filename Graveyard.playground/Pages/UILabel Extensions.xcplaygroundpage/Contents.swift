//: [Previous](@previous)

import Foundation


extension UILabel {
    func bloomAnimation() {
        self.transform = CGAffineTransform(scaleX: 0.0001, y: 0.0001)
        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.95, initialSpringVelocity: 0, options: [], animations: {
                    self.transform = .identity
                }, completion: nil)
    }
}
//: [Next](@next)
