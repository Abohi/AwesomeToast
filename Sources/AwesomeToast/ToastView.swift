

import SwiftUI

@available(iOS 13.0, *)
@available(macOS 11.0, *)
@available(macOS 10.15, *)
public struct ToastView: View {
    var foregroundColor: Color
  var backgroundColor:Color
  var style: ToastStyle
  var message: String
  var width = CGFloat.infinity
  var onCancelTapped: (() -> Void)
  
  public var body: some View {
    HStack(alignment: .center, spacing: 12) {
      Image(systemName: style.iconFileName)
        .foregroundColor(style.themeColor)
      Text(message)
        .font(Font.caption)
        .foregroundColor(foregroundColor)
      
      Spacer(minLength: 10)
      
      Button {
        onCancelTapped()
      } label: {
        Image(systemName: "xmark")
          .foregroundColor(style.themeColor)
      }
    }
    .padding()
    .frame(minWidth: 0, maxWidth: width)
    .background(backgroundColor)
    .cornerRadius(8)
    .overlay(
      RoundedRectangle(cornerRadius: 8)
        //.stroke(style.themeColor, lineWidth: 0.5)
        .stroke(style.themeColor, lineWidth: 1)
        .opacity(0.6)
        //.glow(color: style.themeColor, radius: 4)
    )
    .padding(.horizontal, 16)
  }
}


