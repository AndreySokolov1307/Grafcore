import SwiftUI

struct PasswordInputView: View {
    @Binding  var password: String
    @State private var isSecured: Bool = true
    var tintColor: Color
    
    var body: some View {
        HStack(spacing: 0) {
            Group {
                if isSecured {
                    SecureField(
                        Strings.passwordPlaceholder,
                        text: $password)
                    .autocorrectionDisabled(true)
                    .inputViewStyle
                } else {
                    TextField(
                        Strings.passwordPlaceholder,
                        text: $password)
                    .autocorrectionDisabled(true)
                    .inputViewStyle
                }
                Button {
                    isSecured.toggle()
                } label: {
                    Image(asset: Assets.Images.eyeSlash)
                        .renderingMode(.original)
                        .padding(.horizontal, 16)
                }
            }
        }
        .inputViewOverlayStyle
        .overlay {
            RoundedRectangle(cornerRadius: 8)
                .stroke(tintColor, lineWidth: 1)
        }
    }
}

struct PasswordInputView_Previews: PreviewProvider {
    static var previews: some View {
        PasswordInputView(password: .constant("Test value"), tintColor: .red )
    }
}
