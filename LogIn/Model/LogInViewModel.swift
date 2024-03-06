import Combine
import SwiftUI

class LoginViewModel: ObservableObject {
    private var subscriptions: Set<AnyCancellable> = []
    
    @Published var emailAddress = ""
    @Published var password = ""
    @Published var emailValidation: ValidationResult = .failure
    @Published var passwordVaidation: ValidationResult = .failure
    @Published var canSubmit: ValidationResult = .failure
    
    init() {
        $emailAddress
            .map { email in
                return Validator.validateEmail(email)
            }
            .assign(to: \.emailValidation, on: self)
            .store(in: &subscriptions)
        
        $password
            .map { password in
                return Validator.validatePassword(password)
            }
            .assign(to: \.passwordVaidation, on: self)
            .store(in: &subscriptions)
        
        Publishers.CombineLatest($emailValidation, $passwordVaidation)
            .map { (emailValidation, passwordVaidation) -> ValidationResult in
                return (emailValidation == .success && passwordVaidation == .success) ? .success : .failure
            }
            .assign(to: \.canSubmit, on: self)
            .store(in: &subscriptions)
    }
    
    var emailTintColor: Color {
        if emailAddress == "" {
            return Color(uiColor: UIConstants.colors.grey2!)
        }
        return emailValidation == .success ? Color(uiColor: UIConstants.colors.green!) : Color(uiColor: UIConstants.colors.cerisePink3!)
    }
    
    var passwordTintColor: Color {
        if password == "" {
            return Color(uiColor: UIConstants.colors.grey2!)
        }
        return passwordVaidation == .success ? Color(uiColor: UIConstants.colors.green!) : Color(uiColor: UIConstants.colors.cerisePink3!)
    }
    
    var emailImage: Image {
        return emailValidation == .success ? Image(asset: Assets.Images.success) : Image(asset: Assets.Images.failure)
    }
    
    func continueButtonTapped() {
       //ACTION
    }
}

