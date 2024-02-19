import SwiftUI

enum FocusedField {
    case email
    case password
}

struct LogInView: View {
    @State private var emailAddress = ""
    @State private var password = ""
    @State var showPassword: Bool = false
    @FocusState var focusField: FocusedField?
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                Image(uiImage: UIConstants.images.logInTitle!)
                    .resizable()
                    .frame(width: 172, height: 37)
                    .padding(.top, 106)
                Text(UIConstants.strings.greetingsTitle)
                    .font(.system(size: 24,weight: .bold))
                    .foregroundColor(Color(UIConstants.colors.grey!))
                    .padding(.top, 16)
                HStack {
                    Text(UIConstants.strings.emailAddressTitle)
                        .padding(.horizontal, 24)
                        .font(.system(size: 16))
                    Spacer()
                }
                .padding(.bottom, 4)
                .padding(.top, 32)
                TextField(
                    UIConstants.strings.emailAddressPlaceholder,
                    text: $emailAddress)
                .tint(Color(UIConstants.colors.grey2!))
                .bold()
                .padding(.horizontal, 16)
                .frame(height: 49)
                .background(Color(UIConstants.colors.greyBackground!))
                .cornerRadius(8)
                .padding(.horizontal, 25)
                .overlay {
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color(UIConstants.colors.grey2!), lineWidth: 1)
                        .padding(.horizontal, 24)
                }
                .padding(.bottom, 16)
                HStack {
                    Text(UIConstants.strings.passwordTitle)
                        .padding(.horizontal, 24)
                        .font(.system(size: 16))
                    Spacer()
                }
                .padding(.bottom, 4)
                CustomInputView(text: $password)
                Button {
                    print("continue")
                } label: {
                    Text(UIConstants.strings.continueButtonTitle)
                        .foregroundColor(.white)
                        .font(.system(size: 18,weight: .bold))
                        .frame(maxWidth: .infinity)
                        .frame(height: 49)
                }
                .background(content: {
                    Color(UIConstants.colors.cerisePink3!)
                        .cornerRadius(8)
                        .shadow(color: Color(UIConstants.colors.greyShadow!),
                                radius: 2, x: 0, y: 3)
                })
                .padding([.horizontal, .top], 24)
                .padding(.bottom, 12)
                .cornerRadius(8)
                Button {
                    print("change password")
                } label: {
                    Text(UIConstants.strings.changePasswordButtonTitle)
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(Color(UIConstants.colors.deepViolet!))
                }
                .padding(.top, 12)
                Spacer()
            }
        }
    }
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView()
    }
}

enum FieldType {
    case secure
    case plain
}

struct CustomInputView: View {
    @Binding  var text: String
    @State private var isSecured: Bool = true
    @FocusState var focus: FieldType?
    
    var body: some View {
        HStack(spacing: 0) {
            Group {
                if isSecured {
                    SecureField(
                        UIConstants.strings.passwordPlaceholder,
                        text: $text)
                    .tint(Color(UIConstants.colors.grey2!))
                    .bold()
                    .padding(.horizontal, 16)
                    .frame(height: 49)
                } else {
                    TextField(
                        UIConstants.strings.passwordPlaceholder,
                        text: $text)
                    .tint(Color(UIConstants.colors.grey2!))
                    .bold()
                    .padding(.horizontal, 16)
                    .frame(height: 49)
                }
                Button {
                    isSecured.toggle()
                    focus = isSecured ? .secure : .plain
                } label: {
                    Image(uiImage: UIConstants.images.eyeSlash!)
                        .renderingMode(.original)
                        .padding(.horizontal, 16)
                }
            }
        }
        .background(Color(UIConstants.colors.greyBackground!))
        .padding(.horizontal, 25)
        .cornerRadius(8)
        .overlay {
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color(UIConstants.colors.grey2!), lineWidth: 1)
                .padding(.horizontal, 24)
        }
    }
}
