import UIKit

class CustomControl: UIControl {

    //MARK: Properties

    var value: Int = 1

    //MARK: Components

    private let componentDimension: CGFloat = 40.0
    private let componentCount = 5
    private let componentActiveColor = UIColor.black
    private let componentInactiveColor = UIColor.gray
    private var components: [UILabel] = []

    override var intrinsicContentSize: CGSize {
      let componentsWidth = CGFloat(componentCount) * componentDimension
      let componentsSpacing = CGFloat(componentCount + 1) * 8.0
      let width = componentsWidth + componentsSpacing
      return CGSize(width: width, height: componentDimension)
    }



    func setup() {
      backgroundColor = .clear
      frame = CGRect(origin: .zero, size: intrinsicContentSize)
      for index in 1 ... componentCount {

        let label = UILabel()
        addSubview(label)
        components.append(label)


        let offset = CGFloat(index - 1) * componentDimension + CGFloat(index) * 8.0
        let origin = CGPoint(x: offset , y: 0)
        let componentSize = CGSize(width: componentDimension, height: componentDimension)
        label.frame = CGRect(origin: origin, size: componentSize)
        label.tag = index // the control's value for that component


        label.font = UIFont.boldSystemFont(ofSize: 32)
        label.text = "✮"
        label.textAlignment = .center
        switch index {
        case 1:  label.textColor = componentActiveColor
        default: label.textColor = componentInactiveColor
        }
      }
    }

    required init?(coder aCoder: NSCoder) {
      super.init(coder: aCoder)
      setup()
    }



    func updateValue(at touch: UITouch) {

      let beforeValue = value


      let touchPoint = touch.location(in: self)
      for component in components {
        if component.frame.contains(touchPoint) && component.tag != value {
          value = component.tag
          for index in 1 ... componentCount {
            switch index <= value {
            case true:
              components[index - 1].textColor = componentActiveColor
            case false:
              components[index - 1].textColor = componentInactiveColor
            }
          }


          component.performFlare()
        }
      }
      if value != beforeValue {
        sendActions(for: .valueChanged)
      }
    }


    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
      updateValue(at: touch)
      return true
    }


    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
      let touchPoint = touch.location(in: self)
      if bounds.contains(touchPoint) {
        updateValue(at: touch)
        sendActions(for: .touchDragInside)
      } else {
        sendActions(for: .touchDragOutside)
      }
      return true
    }

    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
      guard let touch = touch else {
        NSLog("Error no touch")
        return
      }

      let touchPoint = touch.location(in: self)
      if bounds.contains(touchPoint) {
        updateValue(at: touch)
        sendActions(for: .touchUpInside)
      } else {
        sendActions(for: .touchUpOutside)
      }
    }
    override func cancelTracking(with event: UIEvent?) {
      sendActions(for: .touchCancel)
    }
}

extension UIView {

  func performFlare() {
    func flare()   { transform = CGAffineTransform(scaleX: 1.6, y: 1.6) }
    func unflare() { transform = .identity }

    UIView.animate(withDuration: 0.3,
                   animations: { flare() },
                   completion: { _ in UIView.animate(withDuration: 0.1) { unflare() }})
  }
}
