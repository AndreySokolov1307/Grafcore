import Foundation

enum ValidationResult {
    case success
    case failure
}

class Validator {
    static func validateEmail(_ email: String) -> ValidationResult {
        let string = email.trimmingCharacters(in: .whitespacesAndNewlines)
        let emailRegex = #"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"#
        
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return  emailPredicate.evaluate(with: string) ? .success : .failure
    }

    static func validatePassword(_ password: String) -> ValidationResult {
        let passwordRegex = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,}$" // minimum 8 characters, at least  1 alphabet, and 1 number
        
        let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
        return passwordPredicate.evaluate(with: password) ? .success : .failure
    }
}
