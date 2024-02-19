import SwiftUI

extension View {
    var inputViewStyle: some View {
        self
            .foregroundColor(Color(UIConstants.colors.grey3!))
            .bold()
            .padding(.horizontal, 16)
            .frame(height: 49)
            .font(.custom(UIConstants.fontsNames.notoSansBold, size: 16))
    }
}
