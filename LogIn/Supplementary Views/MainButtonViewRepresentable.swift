import UIKit
import SwiftUI

struct MainButtonViewRepresentable: UIViewRepresentable {
    var title: String
    var color: UIColor
    var onTap: () -> Void
    
    func makeUIView(context: Context) -> MainButton {
        let button = MainButton(title: title, color: color)
        button.addTarget(context.coordinator, action: #selector(Coordinator.doAction), for: .touchUpInside)
        return button
    }
    
    func updateUIView(_ uiView: MainButton, context: Context) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(button: self)
    }
    
    class Coordinator: NSObject {
        let button: MainButtonViewRepresentable
        
        init(button: MainButtonViewRepresentable) {
            self.button = button
            super.init()
        }
        
        @objc func doAction() {
            button.onTap()
        }
    }
}
