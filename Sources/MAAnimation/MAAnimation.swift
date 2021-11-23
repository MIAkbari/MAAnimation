import UIKit

public extension UIView {
    
    func animation(with durcation: TimeInterval, callback: @escaping () -> Void) {
        UIView.animate(withDuration: durcation, delay: 0.4) {
            callback()
        }
    }
    
    /// setupCenterX
    /// - Parameters:
    ///   - view: main view for view animation
    ///   - align: Align for position
    func setupCenterX(animation view: UIView, align: AlignView.X = .empty) {
        let outViewWidth: CGFloat = 200

        if align == .right {
            self.center.x -= view.bounds.width + outViewWidth
        } else if align == .left {
            self.center.x += view.bounds.width + outViewWidth
        } else if align == .outLeft {
            self.center.x += -view.bounds.width - outViewWidth
        } else if align == .outRight {
            self.center.x -= -view.bounds.width - outViewWidth
        }
    }

    /// setupCenterY
    /// - Parameters:
    ///   - view: main view for view animation
    ///   - align: Align for position
    func setupCenterY(animation view: UIView, align: AlignView.Y = .empty) {
        let outViewHeight: CGFloat = +UIScreen.main.bounds.height

        if align == .top {
            self.center.y += view.bounds.height + outViewHeight
        } else if align == .bottom {
            self.center.y -= view.bounds.height + outViewHeight
        } else if align == .out {
            self.center.y += -view.bounds.height - outViewHeight
        }
    }
}

extension UIView {
    
    /// Shake Animation
    /// - Parameters:
    ///   - position: position from x, y
    ///   - duration: speed run
    func shake(position: Position = .x, duration: CFTimeInterval = 5.0) {
        let animation = CASpringAnimation(keyPath: "position.\(position.rawValue)")
        animation.damping = 1
        animation.fromValue = position == .y ? self.layer.position.y : self.layer.position.x
        animation.toValue = position == .y ? self.layer.position.y - 100.0 : self.layer.position.x - 100.0
        animation.duration = duration
        self.layer.add(animation, forKey: "shake")
    }
}

extension UIView {
    public enum AlignView {}
    public enum Position: String {
        case x = "x"
        case y = "y"
    }
}

extension UIView.AlignView {

    public enum X: Int {
        case right = 0
        case left
        case outLeft
        case outRight
        case empty
    }

    public enum Y: Int {
        case top = 0
        case bottom
        case out
        case empty
    }
}


public func mainDelay(durcation: TimeInterval, execute: @escaping ()-> Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + durcation) {
        execute()
    }
}
