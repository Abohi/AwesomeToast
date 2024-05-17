

import Foundation
import SwiftUI
@available(iOS 13.0, *)
public struct Toast: Equatable {
    public var style: ToastStyle
    public var message: String
    public var duration: Double = 3
    public var width: Double = .infinity
    public var forgroundColor: Color
    public var backgroundColor: Color
    
    public init(style: ToastStyle, message: String, duration: Double = 3, width: Double = .infinity,
                forgroundColor:Color = .white, backgroundColor:Color = .black) {
        self.style = style
        self.message = message
        self.duration = duration
        self.width = width
        self.forgroundColor = forgroundColor
        self.backgroundColor = backgroundColor
    }
}
