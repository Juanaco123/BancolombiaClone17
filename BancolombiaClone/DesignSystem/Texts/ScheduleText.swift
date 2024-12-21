//
//  ScheduleText.swift
//  BancolombiaClone
//
//  Created by Juan Camilo Victoria Pacheco on 21/12/24.
//

import SwiftUI
import Foundation

enum Greetings: String {
  case morning = "Buenos días"
  case afternoon = "Buenas tardes"
  case night = "Buenas noches"
  
  static func greetings(for date: Date) -> Greetings {
    let dateComponent: DateComponents = Calendar.current.dateComponents([.hour, .minute], from: date)
    let hour: Int? = dateComponent.hour ?? 0
    let minute: Int? = dateComponent.minute ?? 0
    
    switch (hour, minute) {
    case ((5..<12)?, _):
      return .morning
    case ((12..<18)?, _):
      return .afternoon
    default:
      return .night
    }
  }
}

struct ScheduleText: View {
  @State private var greeting: Greetings = .morning
  
  var body: some View {
    VStack(spacing: .zero) {
      Text(greeting.rawValue)
        .font(.title)
        .fontWeight(.thin)
        .onAppear(perform: updateGreetings)
      
      Spacer()
    }
    .padding(.bottom, .space2x)
  }
  
  func updateGreetings() {
    let currentDate = Date()
    greeting = Greetings.greetings(for: currentDate)
  }
}

struct ScheduleText_Preview: PreviewProvider {
  static var previews: some View {
    ScheduleText()
  }
}
