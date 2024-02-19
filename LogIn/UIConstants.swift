import UIKit

class UIConstants {
    enum strings {
        static let logInButtonTitle = "Log In"
        static let skipButtonTitle = "Skip"
        static let nextButtonTitle = "Next"
        static let getStartedTitle = "Get Started"
        static let onboardingOneTitle =  "Send Money"
        static let onboardingOneMessage = "Send money instantly from your\n Graftcore account to all networks and\n banks"
        static let onboardingTwoTitle = "Pay Bills"
        static let onboardingTwoMessage = "Pay Bills such as Water bill, Electricity,\n TV subscriptions etc.\n Buy airtime & bundles"
        static let onboardingThreeTitle = "Pay Merchants"
        static let onboardingThreeMessage = "Pay by Phone at merchants with\n Graftcore accounts even with\n insufficient balance"
        static let emailAddressTitle = "Email address"
        static let emailAddressPlaceholder = "youremail@domain.com"
        static let passwordTitle = "Password"
        static let passwordPlaceholder = "placeholder"
        static let continueButtonTitle = "Continue"
        static let changePasswordButtonTitle = "Change Password"
        static let greetingsTitle = "Hello there!"
    }

    enum colors {
        static let cerisePink = UIColor(named: "cerisePink")
        static let cerisePink3 = UIColor(named: "cerisePink3")
        static let greyShadow = UIColor(named: "greyShadow")
        static let greyBackground = UIColor(named: "greyBackground")
        static let grey = UIColor(named: "grey")
        static let grey2 = UIColor(named: "grey2")
        static let deepViolet = UIColor(named: "deepViolet")
    }
    
    enum images {
        static let logInPerson = UIImage(named: "person")
        static let logInTitle = UIImage(named: "title")
        static let sendMoney = UIImage(named: "sendMoney")
        static let payBills = UIImage(named: "payBills")
        static let payMerchants = UIImage(named: "payMerchants")
        static let eyeSlash = UIImage(named: "eyeSlash")
    }
    
    enum numbers {
        static let initialPageIndex = 0
        static let lastPageIndex = 2
    }
}
