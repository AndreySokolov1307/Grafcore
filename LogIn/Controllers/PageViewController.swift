import UIKit
import SwiftUI

final class PageViewController: UIPageViewController {
    
    let skipButton: UIButton = {
        let button = UIButton()
        button.setTitle(Strings.skipButtonTitle, for: .normal)
        button.setTitleColor(UIConstants.colors.cerisePink, for: .normal)
        button.titleLabel?.font = FontFamily.NotoSans.bold.font(size: 18)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    let nextButton: UIButton = {
        let button = UIButton()
        button.setTitle(Strings.skipButtonTitle, for: .normal)
        button.backgroundColor = UIConstants.colors.cerisePink
        button.layer.cornerRadius = 24
        button.titleLabel?.font = FontFamily.NotoSans.bold.font(size: 18)
        button.contentEdgeInsets = UIEdgeInsets(top: 12, left: 20, bottom: 12, right: 20)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let customPageControl = CustomPageControll()
    var pages = [OnboardingViewController]()
    let initialPageIndex = UIConstants.numbers.initialPageIndex
    let lastPageIndex = UIConstants.numbers.lastPageIndex
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPages()
        setupLayout()
        setupActions()
    }
    
    private func setupPages() {
        dataSource = self
        delegate = self
        
        for i in 0 ..< Onboarding.titles.count {
            let page = OnboardingViewController(titleText: Onboarding.titles[i],
                                                subtitleText: Onboarding.subtitles[i],
                                                image: Onboarding.images[i])
            pages.append(page)
        }
        setViewControllers([pages[initialPageIndex]],
                           direction: .forward,
                           animated: true)
    }
    
    private func setupLayout() {
        view.addSubview(nextButton)
        view.addSubview(skipButton)
        view.addSubview(customPageControl)
        navigationItem.hidesBackButton = true
        
        nextButton.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(682)
            make.right.equalToSuperview().inset(24)
        }
        
        skipButton.snp.makeConstraints { make in
            make.centerY.equalTo(nextButton.snp.centerY)
            make.left.equalToSuperview().inset(24)
        }
        
        customPageControl.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(615)
            make.height.equalTo(8)
            make.width.equalTo(126)
        }
    }
    
    private func setupActions() {
        customPageControl.controls.forEach { control in
            control.addTarget(self, action: #selector(didTapControl(sender: )), for: .touchUpInside)
        }
        nextButton.addTarget(self, action: #selector(didTapNextButton), for: .touchUpInside)
        skipButton.addTarget(self, action: #selector(didTapSkipButton), for: .touchUpInside)
    }
    
    @objc func didTapNextButton() {
        if customPageControl.currentIndex == customPageControl.lastIndex {
            let vc = UIHostingController(rootView: LogInView())
            self.navigationController?.present(vc, animated: true)
        } else {
            goToNextPage()
        }
    }
    
    @objc func didTapSkipButton() {
        goToSpecificPage(index: lastPageIndex, ofViewCOntrollers: pages)
    }
    
    @objc func didTapControl(sender: CustomControll) {
        for (index, control) in customPageControl.controls.enumerated() {
            if control == sender {
                goToSpecificPage(index: index, ofViewCOntrollers: pages)
            } else {
                control.toNormalState()
            }
        }
    }
}

//MARK: - UIPageViewControllerDataSource

extension PageViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = pages.firstIndex(of: viewController as! OnboardingViewController) else { return nil }
        
        if currentIndex == 0 {
            return nil                    // go to last
        } else {
            return pages[currentIndex - 1]// go previous
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = pages.firstIndex(of: viewController as! OnboardingViewController) else { return nil }
        
        if currentIndex < pages.count - 1 {
            return pages[currentIndex + 1] // go next
        } else {
            return nil                     // go to first
        }
    }
}

//MARK: - UIPageViewControllerDelegate

extension PageViewController: UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        guard let viewControllers = pageViewController.viewControllers else { return }
        guard let currentIndex = pages.firstIndex(of: viewControllers[0] as! OnboardingViewController) else { return }
        
        checkIfLastIndex(currentIndex)
        customPageControl.currentIndex = currentIndex
    }
}

//MARK: - Nafigation methods

extension PageViewController {
    
    func goToNextPage(animated: Bool = true, completion: ((Bool) -> Void)? = nil) {
        guard let currentPage = viewControllers?[0] else { return }
        guard let nextPage = dataSource?.pageViewController(self, viewControllerAfter: currentPage) else { return }
        
        setViewControllers([nextPage],
                           direction: .forward,
                           animated: animated,
                           completion: completion)
        customPageControl.currentIndex += 1
        checkIfLastIndex(customPageControl.currentIndex)
    }
    
    func goToSpecificPage(index: Int, ofViewCOntrollers pages: [OnboardingViewController]) {
        setViewControllers( [pages[index]],
                            direction: .forward,
                            animated: true)
        customPageControl.currentIndex = index
        checkIfLastIndex(index)
    }
    
    func checkIfLastIndex(_ index: Int) {
        if index == customPageControl.lastIndex {
            nextButton.setTitle(Strings.getStartedTitle, for: .normal)
            skipButton.isHidden = true
        } else {
            nextButton.setTitle(Strings.nextButtonTitle, for: .normal)
            skipButton.isHidden = false
        }
    }
}
