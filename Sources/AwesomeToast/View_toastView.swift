
import Foundation
import SwiftUI

@available(iOS 13.0, *)
@available(macOS 10.15, *)
@available(macOS 11.0, *)
public extension View {

    @available(iOS 14.0, *)
    func toastView(toast: Binding<Toast?>) -> some View {
        self.modifier(ToastModifier(toast: toast))
    }
}
