//
//  CircularTimer.swift
//  BancolombiaClone
//
//  Created by Juan Camilo Victoria Pacheco on 20/12/24.
//

import SwiftUI
import Combine
import Foundation

struct CircularTimer: View {
  private var seconds: Double = 10
  private var timer: Publishers.Autoconnect<Timer.TimerPublisher> = Timer.publish(every: 1.0, on: .main, in: .common).autoconnect()
  
  var onTimerComplete: (() -> Void)?
  
  @State private var progress: CGFloat = 0
  
  // constant
  private let icon: String = "lock"
  
  init(onTimerComplete: (() -> Void)? = nil) {
    self.onTimerComplete = onTimerComplete
  }
  
  var body: some View {
    ZStack {
      Circle()
        .stroke(lineWidth: .space2x)
        .foregroundStyle(Color(UIColor.systemGray5))
        .frame(width: .space10x, height: .space10x)
      
      Circle()
        .trim(from: .zero, to: progress)
        .stroke(style: StrokeStyle(lineWidth: .space2x, lineCap: .round, lineJoin: .round))
        .foregroundStyle(.yellow)
        .rotationEffect(.degrees(-90))
        .frame(width: .space10x, height: .space10x)
        .animation(.linear(duration: seconds), value: seconds)
      
      Image(systemName: icon)
        .frame(width: .space10x/2.5, height: .space10x/2.5)
        .foregroundStyle(.blue)
    }
    .onReceive(timer, perform: { _ in
      withAnimation {
        progress = (progress + 1/seconds)
        if progress >= 1.0 {
          progress = 0
          onTimerComplete?()
        }
      }
    })
  }
}

struct CircularTimer_Preview: PreviewProvider  {
  static var previews: some View {
    CircularTimer()
  }
}
