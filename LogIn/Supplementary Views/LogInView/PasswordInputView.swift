import SwiftUI

enum FieldType {
    case secure
    case plain
}

struct PasswordInputView: View {
    @Binding  var password: String
    @State private var isSecured: Bool = true
    @FocusState var focus: FieldType?
    
    var body: some View {
        HStack(spacing: 0) {
            Group {
                if isSecured {
                    SecureField(
                        UIConstants.strings.passwordPlaceholder,
                        text: $password)
                    .inputViewStyle
                } else {
                    TextField(
                        UIConstants.strings.passwordPlaceholder,
                        text: $password)
                    .inputViewStyle
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

struct PasswordInputView_Previews: PreviewProvider {
    static var previews: some View {
        PasswordInputView(password: .constant("Test value") )
    }
}
