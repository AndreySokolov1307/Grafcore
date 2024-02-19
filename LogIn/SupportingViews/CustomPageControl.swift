import UIKit
import SnapKit

class CustomPageControll: UIView {
    
    let leftContol: CustomControll = {
        let control = CustomControll()
        return control
    }()
    
    let rightControl: CustomControll = {
        let control = CustomControll()
        return control
    }()
    
    let midleControl: CustomControll = {
        let control = CustomControll()
        return control
    }()
    
    lazy var controls = [leftContol, midleControl, rightControl]
    let lastIndex = 2
    
    var currentIndex = 0 {
        didSet {
            if currentIndex > 2 {
                currentIndex = 0
            }
            var selectedIndex = 0
            for (index, control) in controls.enumerated() {
                if index != currentIndex {
                    control.toNormalState()
                } else {
                    selectedIndex = index
                }
            }
            controls[selectedIndex].toSelectedState()
        }
    }
  

    
    let hStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 8
        stack.alignment = .fill
        stack.distribution = .fillProportionally
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(hStack)
        hStack.addArrangedSubview(leftContol)
        hStack.addArrangedSubview(midleControl)
        hStack.addArrangedSubview(rightControl)
        
        hStack.snp.makeConstraints { make in
            make.top.bottom.left.right.equalToSuperview()
        }
        leftContol.toSelectedState()
    }
}
