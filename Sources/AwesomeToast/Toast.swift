

import Foundation

public struct Toast: Equatable {
    public var style: ToastStyle
    public var message: String
    public var duration: Double = 3
    public var width: Double = .infinity
    
    public init(style: ToastStyle, message: String, duration: Double = 3, width: Double = .infinity) {
        self.style = style
        self.message = message
        self.duration = duration
        self.width = width
    }
}
