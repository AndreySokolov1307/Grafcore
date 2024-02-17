import UIKit

final class OnboardingViewController: UIViewController {
    
    private var onboardingView: OnboardingView!
    
    let titleText: String
    let subtitleText: String
    let image: UIImage
    
    init(titleText: String, subtitleText: String, image: UIImage) {
        self.titleText = titleText
        self.subtitleText = subtitleText
        self.image = image
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        onboardingView = OnboardingView()
        self.view = onboardingView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        onboardingView.titleLabel.text = titleText
        onboardingView.subTitleLabel.text = subtitleText
        onboardingView.imageView.image = image
    }
}




