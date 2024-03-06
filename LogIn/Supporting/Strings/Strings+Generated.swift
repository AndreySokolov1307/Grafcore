// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum Strings {
  /// Change Password
  internal static let changePasswordButtonTitle = Strings.tr("Localizable", "changePasswordButtonTitle", fallback: "Change Password")
  /// Continue
  internal static let continueButtonTitle = Strings.tr("Localizable", "continueButtonTitle", fallback: "Continue")
  /// youremail@domain.com
  internal static let emailAddressPlaceholder = Strings.tr("Localizable", "emailAddressPlaceholder", fallback: "youremail@domain.com")
  /// Email address
  internal static let emailAddressTitle = Strings.tr("Localizable", "emailAddressTitle", fallback: "Email address")
  /// Get Started
  internal static let getStartedTitle = Strings.tr("Localizable", "getStartedTitle", fallback: "Get Started")
  /// Hello there!
  internal static let greetingsTitle = Strings.tr("Localizable", "greetingsTitle", fallback: "Hello there!")
  /// Minimum 8 characters, at least 1 alphabet and 1 number
  internal static let invalidPassword = Strings.tr("Localizable", "invalidPassword", fallback: "Minimum 8 characters, at least 1 alphabet and 1 number")
  /// Localizable.strings
  ///   LogIn
  /// 
  ///   Created by Андрей Соколов on 06.03.2024.
  internal static let logInButtonTitle = Strings.tr("Localizable", "logInButtonTitle", fallback: "Log In")
  /// Next
  internal static let nextButtonTitle = Strings.tr("Localizable", "nextButtonTitle", fallback: "Next")
  /// Send money instantly from your
  ///  Graftcore account to all networks and
  ///  banks
  internal static let onboardingOneMessage = Strings.tr("Localizable", "onboardingOneMessage", fallback: "Send money instantly from your\n Graftcore account to all networks and\n banks")
  /// Send Money
  internal static let onboardingOneTitle = Strings.tr("Localizable", "onboardingOneTitle", fallback: "Send Money")
  /// Pay by Phone at merchants with
  ///  Graftcore accounts even with
  ///  insufficient balance
  internal static let onboardingThreeMessage = Strings.tr("Localizable", "onboardingThreeMessage", fallback: "Pay by Phone at merchants with\n Graftcore accounts even with\n insufficient balance")
  /// Pay Merchants
  internal static let onboardingThreeTitle = Strings.tr("Localizable", "onboardingThreeTitle", fallback: "Pay Merchants")
  /// Pay Bills such as Water bill, Electricity,
  ///  TV subscriptions etc.
  ///  Buy airtime & bundles
  internal static let onboardingTwoMessage = Strings.tr("Localizable", "onboardingTwoMessage", fallback: "Pay Bills such as Water bill, Electricity,\n TV subscriptions etc.\n Buy airtime & bundles")
  /// Pay Bills
  internal static let onboardingTwoTitle = Strings.tr("Localizable", "onboardingTwoTitle", fallback: "Pay Bills")
  /// password
  internal static let passwordPlaceholder = Strings.tr("Localizable", "passwordPlaceholder", fallback: "password")
  /// Password
  internal static let passwordTitle = Strings.tr("Localizable", "passwordTitle", fallback: "Password")
  /// Skip
  internal static let skipButtonTitle = Strings.tr("Localizable", "skipButtonTitle", fallback: "Skip")
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension Strings {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
