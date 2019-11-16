import UIKit

class ClockView: UIView {
    
    private let clockLayer = ClockLayer()
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        layer.addSublayer(clockLayer)
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        layer.addSublayer(clockLayer)
    }
    
    override func draw(_ rect: CGRect) {
        clockLayer.frame = rect
    }

    func timePassed(hour: Int, minute: Int, second: Int){
        let transformHour = CGAffineTransform(rotationAngle: CGFloat(Double(hour) * .pi / 6.0))
        let transformMinute = CGAffineTransform(rotationAngle: CGFloat(Double(minute) * .pi / 30.0))
        let transformSecond = CGAffineTransform(rotationAngle: CGFloat(Double(second) * .pi / 30.0))
        clockLayer.rotateTime(hour: transformHour, minute: transformMinute, second: transformSecond)
    }
    
    
    func compassDirectionPressed(_ direction: String) {
        
        let transform: CGAffineTransform
        
        switch direction.uppercased() {
        case "N":
            transform = CGAffineTransform(rotationAngle: CGFloat(4 * Double.pi) / 2.0)
        case "E":
            transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi) / 2.0)
        case "S":
            transform = CGAffineTransform(rotationAngle: CGFloat(2 * Double.pi) / 2.0)
        case "W":
            transform = CGAffineTransform(rotationAngle: CGFloat(3 * Double.pi) / 2.0)
        default:
            transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi) / 2.0)
        }
        
        clockLayer.rotateArrowWithTransform(transform)
    }

}
