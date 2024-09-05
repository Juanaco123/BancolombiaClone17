//
//  ProgressBarIcon.swift
//  BancolombiaClone
//
//  Created by Juan Camilo Victoria Pacheco on 31/08/24.
//

import Foundation
import SwiftUI
import Combine

public struct ProgressBarIcon: View {
    private var icon: Image
    private var width: CGFloat = 0.0
    private var height: CGFloat = 0.0
    private var seconds: Double = 60
    private var timer: Publishers.Autoconnect<Timer.TimerPublisher>
    
    @State private var progress: CGFloat
    
    init(
        icon: Image,
        width: CGFloat,
        height: CGFloat,
        seconds: Double,
        initialProgress: CGFloat = 0
        
    ) {
        self.icon = icon
        self.width = width
        self.height = height
        self.seconds = seconds
        self._progress = State(initialValue: initialProgress)
        self.timer = Timer.publish(every: 1.0, on: .main, in: .common).autoconnect()
         
    }
    
    public var body: some View {
        ZStack {
            // Background
            Circle()
                .stroke(lineWidth: 10)
                .foregroundStyle(.gray.opacity(0.2))
                .frame(width: width, height: height)
            // Timer
            Circle()
                .trim(from: 0.0, to: progress)
                .stroke(style: StrokeStyle(lineWidth: 10, lineCap: .round))
                .foregroundStyle(.yellow)
                .rotationEffect(.degrees(-90))
                .frame(width: width, height: height)
                .animation(.linear(duration: seconds), value: progress)
            // Icon
            icon
                .resizable()
                .scaledToFit()
                .frame(width: width / 2.5, height: height / 2.5)
                .foregroundStyle(.blue)
        }
        .onReceive(timer) { _ in
            withAnimation {
                progress = (progress + 1/60).truncatingRemainder(dividingBy: 1.0)
            }
        }
    }
}

struct ContentView: View {
    var body: some View {
        ProgressBarIcon(
            icon: Image(.systemSecure),
            width: 100,
            height: 100,
            seconds: 60
        )
    }
}

struct ProgressBarIcon_Preview: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
