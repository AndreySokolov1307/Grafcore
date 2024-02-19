//
//  EmailInputView.swift
//  LogIn
//
//  Created by Андрей Соколов on 19.02.2024.
//

import SwiftUI

struct EmailInputView: View {
    @Binding var emailAddress: String
    
    var body: some View {
        TextField(
            UIConstants.strings.emailAddressPlaceholder,
            text: $emailAddress)
        .inputViewStyle
        .background(Color(UIConstants.colors.greyBackground!))
        .cornerRadius(8)
        .padding(.horizontal, 25)
        .overlay {
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color(UIConstants.colors.grey2!), lineWidth: 1)
                .padding(.horizontal, 24)
        }
    }
}

struct EmailInputView_Previews: PreviewProvider {
    static var previews: some View {
        EmailInputView(emailAddress: .constant(""))
    }
}
