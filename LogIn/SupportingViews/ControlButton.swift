import UIKit

class CustomControll: UIControl {
    
    lazy var widthConstraint = widthAnchor.constraint(greaterThanOrEqualToConstant: 15)
    
    lazy var toSelectedState: () -> Void = { [weak self] in
        guard let self = self, !self.isSelected else { return }
        self.isSelected = true
        self.widthConstraint.constant = 80
        UIView.animate(withDuration: 0.1) {
            self.backgroundColor = UIConstants.colors.cerisePink
            self.superview?.layoutIfNeeded()
        }
    }
    
    lazy var toNormalState: () -> Void = { [weak self] in
        guard let self = self,
              self.isSelected  else { return }
        self.isSelected = false
        self.widthConstraint.constant = 15
        UIView.animate(withDuration: 0.1, delay: 0) {
            self.backgroundColor = .white
            self.superview?.layoutIfNeeded()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        backgroundColor = .white
        layer.borderWidth = 1.5
        layer.cornerRadius = 4
        layer.borderColor = UIConstants.colors.cerisePink?.cgColor
        widthConstraint.isActive = true
    }
}

