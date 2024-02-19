import UIKit

final class WelocomeViewController: UIViewController {
    
    private var logInView: WelcomeView!
    
    override func loadView() {
        logInView = WelcomeView()
        self.view = logInView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        addTargets()
    }
    
    private func addTargets() {
        logInView.logInButton.addTarget(self, action: #selector(didTapLogInButton), for: .touchUpInside)
    }
    
    @objc func didTapLogInButton() {
        let vc = PageViewController(transitionStyle: .scroll,
                                    navigationOrientation: .horizontal)
        navigationController?.pushViewController(vc, animated: true)
    }
}

