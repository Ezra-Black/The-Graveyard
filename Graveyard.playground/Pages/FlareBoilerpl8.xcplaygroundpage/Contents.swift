//flare animation
func flare(_ level: PasswordStrength) {
    var view: UIView
    
    switch level {
    case .weak:
        view = weakView
    case .medium:
        view = mediumView
    case .strong:
        view = strongView
    }
    
    let animationBlock = {
        UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.7) {
            view.transform = CGAffineTransform(scaleX: 1.0, y: 1.7)
        }
        UIView.addKeyframe(withRelativeStartTime: 0.7, relativeDuration: 0.3) {
            view.transform = .identity
        }
    }
    
    UIView.animateKeyframes(withDuration: 0.7, delay: 0, options: [], animations: animationBlock, completion: nil)
}
