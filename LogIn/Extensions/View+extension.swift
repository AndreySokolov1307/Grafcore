import SwiftUI

extension View {
    var inputViewStyle: some View {
        self
            .foregroundColor(Color(UIConstants.colors.grey3!))
            .bold()
            .padding(.horizontal, 16)
            .frame(height: 47)
            .font(.custom(UIConstants.fontsNames.notoSansBold, size: 16))
    }
    
    var inputViewOverlayStyle: some View {
        self
            .background(Color(UIConstants.colors.greyBackground!))
            .cornerRadius(8)
            .textInputAutocapitalization(.never)
    }
}
