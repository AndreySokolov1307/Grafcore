import SwiftUI

struct LogInView: View {
    @ObservedObject var viewModel = LoginViewModel()
    
    var logo: some View {
            Image(uiImage: UIConstants.images.logInTitle!)
                .resizable()
                .frame(width: 172, height: 37)
                .padding(.top, 106)
    }
    
    var greetings: some View {
        Text(UIConstants.strings.greetingsTitle)
            .font(.custom(UIConstants.fontsNames.notoSansBold, size: 24))
            .padding(.top, 16)
    }
    
    var emailInput: some View {
        VStack(spacing: 0) {
            HStack {
                Text(UIConstants.strings.emailAddressTitle)
                    .font(.system(size: 16))
                Spacer()
            }
            .padding(.bottom, 4)
            .padding(.top, 32)
            EmailInputView(emailAddress: $viewModel.emailAddress,
                           image: viewModel.emailImage,
                           tintColor: viewModel.emailTintColor)
            .padding(.bottom, 16)
        }
    }
    
    var passwordInput: some View {
        VStack(spacing: 0) {
            HStack {
                Text(UIConstants.strings.passwordTitle)
                    .font(.system(size: 16))
                Spacer()
            }
            .padding(.bottom, 4)
            PasswordInputView(password: $viewModel.password,
                              tintColor: viewModel.passwordTintColor)
            if viewModel.passwordVaidation == .failure, viewModel.password != "" {
                HStack {
                    Text(UIConstants.strings.invalidPassword)
                        .font(.system(size: 16))
                        .padding(.top, 4)
                        .fixedSize(horizontal: false, vertical: true)
                    Spacer()
                }
            }
        }
    }
    
    var countinueButton: some View {
        MainButtonViewRepresentable(title: UIConstants.strings.continueButtonTitle,
                                    color: UIConstants.colors.cerisePink3!, onTap: {
            viewModel.continueButtonTapped()
        })
        .disabled( viewModel.canSubmit == .failure ? true : false)
        .frame(height: 49)
        .padding(.top, 24)
        .padding(.bottom, 12)
    }
    
    var changePasswordButton: some View {
        Button {
            // ACTION
        } label: {
            Text(UIConstants.strings.changePasswordButtonTitle)
                .font(.custom(UIConstants.fontsNames.notoSansBold, size: 16))
                .foregroundColor(Color(UIConstants.colors.deepViolet!))
        }
        .padding(.top, 12)
    }
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                logo
                greetings
                emailInput
                passwordInput
                countinueButton
                changePasswordButton
                Spacer()
            }
            .padding(.horizontal, 24)
        }
    }
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView()
    }
}
