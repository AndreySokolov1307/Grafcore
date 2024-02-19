import UIKit
import SnapKit


class WelcomeView: UIView {
    
    let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIConstants.images.logInTitle
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let personImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIConstants.images.logInPerson
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let logInButton: UIButton = {
       let button = UIButton()
        button.backgroundColor = UIConstants.colors.cerisePink
        button.setTitle(UIConstants.strings.logInButtonTitle, for: .normal)
        button.titleLabel?.font = UIFont(name: UIConstants.fontsNames.notoSansBold, size: 18)
        button.layer.cornerRadius = 8
        button.layer.shadowOffset = CGSize(width: 0, height: 3)
        button.layer.shadowRadius = 2
        button.layer.shadowColor = UIConstants.colors.greyShadow?.cgColor
        button.layer.shadowOpacity = 0.6
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

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
