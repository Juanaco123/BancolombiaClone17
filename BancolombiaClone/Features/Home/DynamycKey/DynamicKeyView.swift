//
//  DynamicKey.swift
//  BancolombiaClone
//
//  Created by Juan Camilo Victoria Pacheco on 20/12/24.
//

import SwiftUI
import Foundation

struct DynamicKeyView: View {
  
  @State private var dynamicNumber: String = generateRandomNumber()
  
  // Constants
  private let title: String = "Clave dinámica"
  private let arrowRight: String = "chevron.right"
  
  var body: some View {
    
    HStack {
      CircularTimer(onTimerComplete: {
        dynamicNumber = Self.generateRandomNumber()
      })
      
      VStack {
        Text(title)
          .font(.caption)
          .fontWeight(.light)
        Text("\(dynamicNumber)")
          .kerning(3.0)
          .animation(.none)
      }
      .lineLimit(1)
      .minimumScaleFactor(0.7)
      
      Image(systemName: arrowRight)
        .foregroundStyle(.gray)
    }
    .padding(.space2x)
    .background(RoundedRectangle(cornerRadius: 25.0)
      .fill(.white)
      .shadow(radius: .space1x)
    )
  }
  
  static func generateRandomNumber() -> String {
    let randomNumber: Int = Int.random(in: 100_000...999_999)
    let numberToString: String = String(randomNumber)
    return numberToString
  }
}

struct DynamicKeyView_Provider: PreviewProvider {
  static var previews: some View {
    DynamicKeyView()
  }
}
