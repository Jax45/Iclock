import UIKit
class MainView: UIView {

    override func addSubview(_ view: UIView) {
        super.addSubview(view)
        setupView(view)
    }

    private func setupView(_ view: UIView) {
        subviews.forEach { (subview) in
            if view === subview {
                view.translatesAutoresizingMaskIntoConstraints = false
                view.topAnchor.constraint(equalTo: topAnchor).isActive = true
                view.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
                view.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
                view.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
                view.setNeedsLayout()
            }
        }
    }
    
}
