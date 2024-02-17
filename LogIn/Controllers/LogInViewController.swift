import UIKit

final class LogInViewController: UIViewController {
    
    private var logInView: LogInView!
    
    override func loadView() {
        logInView = LogInView()
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

