//
//  CustomButton.swift
//  BancolombiaClone
//
//  Created by Juan Camilo Victoria Pacheco on 28/11/24.
//

import SwiftUI
import Foundation

struct CustomButton: View {
  var icon: String
  var text: String
  var style: BankButtonStyle
  var action: () -> Void
  
  // Constants
  private let textFrameWidth: CGFloat = 100
  private let mainButtonHeight: CGFloat = 130
  private let mainButtonWidth: CGFloat = 120
  
  init(
    icon: String = "",
    text: String = "",
    style: BankButtonStyle = .principal,
    action: @escaping () -> Void = {}
  ) {
    self.icon = icon
    self.text = text
    self.style = style
    self.action = action
  }
  
  var body: some View {
    switch style.shape {
    case .circle:
      VStack(spacing: .space2x) {
        Button {
          action()
        } label: {
          Image(systemName: icon)
            .padding()
        }
        .buttonStyle(setButtonStyle(style: style))
        
        Text(text)
          .applyDynamicTextHandling(for: text)
          .frame(width: textFrameWidth)
      }
      .padding()
    case .capsule:
      Button {
        action()
      } label: {
        HStack(spacing: .space2x) {
          Text(text)
            .fontWeight(.heavy)
          Image(systemName: icon)
        }
        .padding()
      }
      .buttonStyle(setButtonStyle(style: style))
      
    default:
      Button {
        action()
      } label: {
        VStack(spacing: .space2x) {
          Image(systemName: icon)
          Text(text)
        }
        .frame(width: mainButtonWidth, height: mainButtonHeight)
      }
      .shadow(radius: .radius4)
      .buttonStyle(setButtonStyle(style: style))
    }
  }
  
}

struct CustomButton_Preview: PreviewProvider {
  static var previews: some View {
    VStack {
      CustomButton(
        icon: "book.pages",
        text: "Ver saldos y movimientos",
        style: .principal
      )
      CustomButton(
        icon: "book.pages",
        text: "Ver saldos y movimientos",
        style: .category
      )
      CustomButton(
        icon: "book.pages",
        text: "Iniciar Sesión",
        style: .login
      )
      .background(Color.red)
    }
  }
}
