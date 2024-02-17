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
    }

    enum colors {
        static let cerisePink = UIColor(named: "cerisePink")
        static let shadowGrey = UIColor(named: "shadowGrey")
    }
    
    enum images {
        static let logInPerson = UIImage(named: "person")
        static let logInTitle = UIImage(named: "title")
        static let sendMoney = UIImage(named: "sendMoney")
        static let payBills = UIImage(named: "payBills")
        static let payMerchants = UIImage(named: "payMerchants")
    }
    
    enum numbers {
        static let initialPageIndex = 0
        static let lastPageIndex = 2
    }
}
