import UIKit

class MainButton: UIButton {
    
    var title: String
    var color: UIColor
    
    init(title: String, color: UIColor) {
        self.title = title
        self.color = color
        super.init(frame: .zero)
        configure()
    }
    
    override var isEnabled: Bool {
        didSet {
            super.isEnabled = isEnabled
            backgroundColor = isEnabled ? color : UIConstants.colors.cerisePink3
        }
    }

    override var isHighlighted: Bool {
        didSet {
            super.isHighlighted = isHighlighted
            backgroundColor = isHighlighted ? UIConstants.colors.cerisePink5 : color
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
       backgroundColor = color
       setTitle(title, for: .normal)
       titleLabel?.font = FontFamily.NotoSans.bold.font(size: 18)
       setTitleColor(.white, for: .normal)
       setTitleColor(UIConstants.colors.grey3, for: .disabled)
       layer.cornerRadius = 8
       layer.shadowOffset = CGSize(width: 0, height: 3)
       layer.shadowRadius = 2
       layer.shadowColor = UIConstants.colors.greyShadow?.cgColor
       layer.shadowOpacity = 0.6
       translatesAutoresizingMaskIntoConstraints = false
    }
}
