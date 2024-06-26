

import Foundation
import SwiftUI

@available(iOS 14.0, *)
@available(iOS 13.0, *)
@available(macOS 10.15, *)
@available(macOS 11.0, *)
public struct ToastModifier: ViewModifier {
  
  @Binding var toast: Toast?
  @State private var workItem: DispatchWorkItem?


    public func body(content: Content) -> some View {
    content
      .frame(maxWidth: .infinity, maxHeight: .infinity)
      .overlay(
        ZStack {
          mainToastView()
            .offset(y: 32)
        }.animation(.spring(), value: toast)
      )
      .onChange(of: toast) { value in
        showToast()
      }
  }
  
  @ViewBuilder func mainToastView() -> some View {
    if let toast = toast {
      VStack {
        ToastView(
          foregroundColor: toast.forgroundColor,
          backgroundColor: toast.backgroundColor,
          style: toast.style,
          message: toast.message,
          width: toast.width
        ) {
          dismissToast()
        }
        Spacer()
      }
      //.transition(.move(edge: .top))
      //.transition(AnyTransition.opacity.animation(.linear))
      //.transition(AnyTransition.scale.animation(.linear))
      //.transition(AnyTransition.opacity.animation(.easeInOut(duration: 0.1)))
    }
  }
  
  public func showToast() {
    guard let toast = toast else { return }
    
//    UIImpactFeedbackGenerator(style: .light)
//      .impactOccurred()
    
    if toast.duration > 0 {
      workItem?.cancel()
      
      let task = DispatchWorkItem {
        dismissToast()
      }
      
      workItem = task
      DispatchQueue.main.asyncAfter(deadline: .now() + toast.duration, execute: task)
    }
  }
  
  public func dismissToast() {
    withAnimation {
      toast = nil
    }
    
    workItem?.cancel()
    workItem = nil
  }
}
