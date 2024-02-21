//
//  EmailInputView.swift
//  LogIn
//
import SwiftUI

struct EmailInputView: View {
    @Binding var emailAddress: String
    var image: Image
    var tintColor: Color
    
    var body: some View {
        HStack(spacing: 0) {
            TextField(
                UIConstants.strings.emailAddressPlaceholder,
                text: $emailAddress)
            .inputViewStyle
            if emailAddress != "" {
                image
                    .renderingMode(.template)
                    .padding(.horizontal, 16)
                    .foregroundColor(tintColor)
            }
        }
        .inputViewOverlayStyle
        .overlay {
            RoundedRectangle(cornerRadius: 8)
                .stroke(tintColor, lineWidth: 1)
        }
    }
}

struct EmailInputView_Previews: PreviewProvider {
    static var previews: some View {
        EmailInputView(emailAddress: .constant(""), image: Image(uiImage: UIConstants.images.success!), tintColor: .green)
    }
}
