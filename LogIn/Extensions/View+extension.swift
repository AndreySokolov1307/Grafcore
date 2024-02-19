import SwiftUI

extension View {
    var inputViewStyle: some View {
        self
            .tint(Color(UIConstants.colors.grey2!))
            .bold()
            .padding(.horizontal, 16)
            .frame(height: 49)
    }
}
