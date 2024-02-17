import UIKit
import SnapKit

class CustomPageControll: UIPageControl {
    
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
    
    var currentIndex = 0 {
        didSet {
            if currentIndex > 2 {
                currentIndex = 0
            }
            for (index, control) in controls.enumerated() {
                if index == currentIndex {
                    control.toSelectedState()
                } else {
                    control.toNormalState()
                }
            }
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
        numberOfPages = 3
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
