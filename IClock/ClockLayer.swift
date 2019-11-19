import UIKit



class ClockLayer: CALayer {
    
    //private let arrowLayer = CALayer()
    private let hourLayer = CALayer()
    private let minuteLayer = CALayer()
    private let secondLayer = CALayer()
    private let circle = CAShapeLayer()
    private var addedCardinalPoints = false
    
    override init() {
        super.init()
        addSublayer(circle)
        addSublayer(hourLayer)
        addSublayer(minuteLayer)
        addSublayer(secondLayer)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSublayers() {
        guard frame != CGRect.zero else { return }
        circle.fillColor = UIColor(red: 0.9, green: 0.95, blue: 0.93, alpha: 0.9).cgColor
        circle.strokeColor = UIColor.gray.cgColor
        let path = CGMutablePath()
        path.addEllipse(in: self.bounds.insetBy(dx: 3, dy: 3))
        circle.path = path
//        print(bounds)
        circle.frame = bounds
//        print("b: \(circle.bounds) : f: \(circle.frame)")
//        circle.position = CGPoint(x: bounds.midX, y: bounds.midY)
        
        if !addedCardinalPoints {
//            let points = ["12","1","2","3","4","5","6","7","8","9","10","11"]
//
//            for index in 0..<points.count {
//                let textLayer = CATextLayer()
//                textLayer.font = UIFont.init(name: "Cochin", size: 14)
//                    textLayer.string = points[index]
//                            //textLayer.backgroundColor = UIColor.orange.withAlphaComponent(0.5).cgColor
//                textLayer.bounds = CGRect(x: 0, y: 0, width: 70, height: 40)
//                textLayer.position = CGPoint(x: bounds.midX, y: bounds.midY)
//                let vertex: CGFloat = circle.bounds.midY / textLayer.bounds.height
//
//                textLayer.anchorPoint = CGPoint(x: 0.5, y: vertex)
//                textLayer.alignmentMode = .center
//                textLayer.foregroundColor = UIColor.black.cgColor
//                textLayer.setAffineTransform(CGAffineTransform(rotationAngle: CGFloat(Double(index) * .pi / 6.0)))
            let twelveLayer = CATextLayer()
            twelveLayer.string = "12"
            twelveLayer.foregroundColor = UIColor.black.cgColor
            twelveLayer.frame = CGRect(x: bounds.midX - 20, y: bounds.minY, width: 40, height: 40)
            circle.addSublayer(twelveLayer)
            
            let oneLayer = CATextLayer()
            oneLayer.string = "1"
            oneLayer.foregroundColor = UIColor.black.cgColor
            oneLayer.frame = CGRect(x: bounds.midX - 20, y: bounds.minY, width: 40, height: 40)
            circle.addSublayer(twelveLayer)
            
            let twoLayer = CATextLayer()
            twoLayer.string = "2"
            twoLayer.foregroundColor = UIColor.black.cgColor
            twoLayer.frame = CGRect(x: bounds.midX - 20, y: bounds.minY, width: 40, height: 40)
            circle.addSublayer(twoLayer)
            
            let threeLayer = CATextLayer()
            threeLayer.string = "3"
            threeLayer.foregroundColor = UIColor.black.cgColor
            threeLayer.frame = CGRect(x: bounds.midX - 20, y: bounds.minY, width: 40, height: 40)
            circle.addSublayer(threeLayer)
            
            let fourLayer = CATextLayer()
            fourLayer.string = "12"
            fourLayer.foregroundColor = UIColor.black.cgColor
            fourLayer.frame = CGRect(x: bounds.midX - 20, y: bounds.minY, width: 40, height: 40)
            circle.addSublayer(fourLayer)
            
            let fiveLayer = CATextLayer()
            fiveLayer.string = "12"
            fiveLayer.foregroundColor = UIColor.black.cgColor
            fiveLayer.frame = CGRect(x: bounds.midX - 20, y: bounds.minY, width: 40, height: 40)
            circle.addSublayer(fiveLayer)
            
            let sixLayer = CATextLayer()
            sixLayer.string = "12"
            sixLayer.foregroundColor = UIColor.black.cgColor
            sixLayer.frame = CGRect(x: bounds.midX - 20, y: bounds.minY, width: 40, height: 40)
            circle.addSublayer(sixLayer)
            
            let twelveLayer = CATextLayer()
            twelveLayer.string = "12"
            twelveLayer.foregroundColor = UIColor.black.cgColor
            twelveLayer.frame = CGRect(x: bounds.midX - 20, y: bounds.minY, width: 40, height: 40)
            circle.addSublayer(twelveLayer)
            
            let twelveLayer = CATextLayer()
            twelveLayer.string = "12"
            twelveLayer.foregroundColor = UIColor.black.cgColor
            twelveLayer.frame = CGRect(x: bounds.midX - 20, y: bounds.minY, width: 40, height: 40)
            circle.addSublayer(twelveLayer)
            
            let twelveLayer = CATextLayer()
            twelveLayer.string = "12"
            twelveLayer.foregroundColor = UIColor.black.cgColor
            twelveLayer.frame = CGRect(x: bounds.midX - 20, y: bounds.minY, width: 40, height: 40)
            circle.addSublayer(twelveLayer)
            
            let twelveLayer = CATextLayer()
            twelveLayer.string = "12"
            twelveLayer.foregroundColor = UIColor.black.cgColor
            twelveLayer.frame = CGRect(x: bounds.midX - 20, y: bounds.minY, width: 40, height: 40)
            circle.addSublayer(twelveLayer)
            
            let twelveLayer = CATextLayer()
            twelveLayer.string = "12"
            twelveLayer.foregroundColor = UIColor.black.cgColor
            twelveLayer.frame = CGRect(x: bounds.midX - 20, y: bounds.minY, width: 40, height: 40)
            circle.addSublayer(twelveLayer)
            
                
            //}
            addedCardinalPoints = true
        }
        
        
        hourLayer.bounds = bounds
        hourLayer.position = CGPoint(x: bounds.midX, y: bounds.midY)
        hourLayer.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        hourLayer.contents = hourHand()?.cgImage
        
        minuteLayer.bounds = bounds
        minuteLayer.position = CGPoint(x: bounds.midX, y: bounds.midY)
        minuteLayer.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        minuteLayer.contents = minuteHand()?.cgImage
        
        secondLayer.bounds = bounds
        secondLayer.position = CGPoint(x: bounds.midX, y: bounds.midY)
        secondLayer.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        secondLayer.contents = secondHand()?.cgImage
    }
    
    func hourHand() -> UIImage? {
        let scale = UIScreen.main.scale
        UIGraphicsBeginImageContextWithOptions(frame.size, false, scale)
        
        guard let ctx = UIGraphicsGetCurrentContext() else { return nil }
        ctx.move(to: CGPoint(x: frame.midX, y: 50))
        ctx.addLine(to: CGPoint(x: frame.midX, y: frame.midY))
        ctx.setLineWidth(16)
        ctx.strokePath()
        
        // Arrow head
        //ctx.setFillColor(UIColor.red.cgColor)
        ctx.move(to: CGPoint(x: frame.midX - 12, y: 50))
        ctx.addLine(to: CGPoint(x: frame.midX, y: 25))
        ctx.addLine(to: CGPoint(x: frame.midX + 12, y: 50))
        ctx.fillPath()
        
        
        
        let hour = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return hour
    }
    
    func minuteHand() -> UIImage? {
        let scale = UIScreen.main.scale
        UIGraphicsBeginImageContextWithOptions(frame.size, false, scale)
        
        guard let ctx = UIGraphicsGetCurrentContext() else { return nil }
        ctx.setFillColor(UIColor.gray.cgColor)
        ctx.setStrokeColor(UIColor.gray.cgColor)
        ctx.move(to: CGPoint(x: frame.midX, y: 50))
        ctx.addLine(to: CGPoint(x: frame.midX, y: frame.midY))
        ctx.setLineWidth(8)
        
        ctx.strokePath()
        
        // Arrow head
        //ctx.setFillColor(UIColor.yellow.cgColor)
        ctx.move(to: CGPoint(x: frame.midX - 5, y: 50))
        ctx.addLine(to: CGPoint(x: frame.midX, y: 25))
        ctx.addLine(to: CGPoint(x: frame.midX + 5, y: 50))
        ctx.fillPath()
        
        
        let minute = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return minute
    }
    func secondHand() -> UIImage? {
        let scale = UIScreen.main.scale
        UIGraphicsBeginImageContextWithOptions(frame.size, false, scale)
        
        guard let ctx = UIGraphicsGetCurrentContext() else { return nil }
        ctx.setFillColor(UIColor.red.cgColor)
        ctx.setStrokeColor(UIColor.red.cgColor)

        ctx.move(to: CGPoint(x: frame.midX, y: 75))
        ctx.addLine(to: CGPoint(x: frame.midX, y: frame.midY))
        ctx.setLineWidth(3)
        ctx.strokePath()
        
        // Arrow head
        //ctx.setFillColor(UIColor.red.cgColor)
        ctx.move(to: CGPoint(x: frame.midX - 2, y: 75))
        ctx.addLine(to: CGPoint(x: frame.midX, y: 50))
        ctx.addLine(to: CGPoint(x: frame.midX + 2, y: 75))
        ctx.fillPath()
        
        
        
        let second = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return second
    }
    
    func rotateTime(hour: CGAffineTransform?, minute: CGAffineTransform?, second: CGAffineTransform?){
        if let h = hour{
        hourLayer.setAffineTransform(h)
        }
        if let m = minute{
            minuteLayer.setAffineTransform(m)

        }
        if let s = second{
            secondLayer.setAffineTransform(s)

        }
    }
    
    func rotateArrowWithTransform(_ transform: CGAffineTransform) {
        CATransaction.setAnimationDuration(1.0)
        //arrowLayer.setAffineTransform(transform)
    }
    
}
