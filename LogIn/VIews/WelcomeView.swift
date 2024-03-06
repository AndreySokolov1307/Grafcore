import UIKit
import SnapKit

class WelcomeView: UIView {
    
    let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Assets.Images.logInTitle.image
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let personImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Assets.Images.logInPerson.image
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let logInButton = MainButton(title: Strings.logInButtonTitle,
                                 color: UIConstants.colors.cerisePink!)

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        backgroundColor = .white
        addSubview(logoImageView)
        addSubview(personImageView)
        addSubview(logInButton)
        addSubview(logInButton)
        
        logoImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(162)
            make.centerX.equalToSuperview()
            make.height.equalTo(37)
            make.width.equalTo(172)
        }
        
        personImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(305)
            make.centerX.equalToSuperview()
            make.height.equalTo(138)
            make.width.equalTo(164)
        }
        
        logInButton.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(529)
            make.left.right.equalToSuperview().inset(24)
            make.height.equalTo(49)
        }
    }
}
