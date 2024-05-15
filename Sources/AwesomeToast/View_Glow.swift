
import Foundation
import SwiftUI

@available(iOS 13.0, *)
@available(macOS 10.15, *)
public extension View {
    func glow(color: Color = .gray, radius: CGFloat = 20) -> some View {
        self
            .shadow(color: color, radius: radius / 3)
            .shadow(color: color, radius: radius / 3)
            .shadow(color: color, radius: radius / 3)
    }
}
