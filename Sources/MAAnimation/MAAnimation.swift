import UIKit

public extension UIView {
    
    func animation(with durcation: TimeInterval, callback: @escaping () -> Void) {
        UIView.animate(withDuration: durcation, delay: 0.4) {
            callback()
        }
    }

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
    public enum AlignView {}
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

func mainDelay(durcation: TimeInterval, execute: @escaping ()-> Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + durcation) {
        execute()
    }
}
