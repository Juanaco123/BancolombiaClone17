//
//  StyleButtons.swift
//  BancolombiaClone
//
//  Created by Juan Camilo Victoria Pacheco on 22/12/24.
//

import SwiftUI
import Foundation

enum circleColors: CaseIterable {
  case thistle
  case tiffBlue
  case vanilla
  case sand
  case sky
  
  var color: Color {
    switch self {
    case .thistle: return .thistle
    case .tiffBlue: return .tiffBlue
    case .vanilla: return .vanilla
    case .sand: return .sand
    case .sky: return .sky
    }
  }
}

enum ButtonShape: Shape {
  case circle
  case roundedRect(cornerRadius: CGFloat = .space2x)
  case capsule
  
  func path(in rect: CGRect) -> Path {
    switch self {
    case .circle:
      return Circle().path(in: rect)
    case .roundedRect(let cornerRadius):
      return RoundedRectangle(cornerRadius: cornerRadius).path(in: rect)
    case .capsule:
      return Capsule().path(in: rect)
    }
  }
}

struct BankButtonStyle {
  var backgroundColor: Color
  var foregroundColor: Color
  var shape: ButtonShape
  
  static let principal = BankButtonStyle(backgroundColor: .milk, foregroundColor: .carbon, shape: .roundedRect(cornerRadius: .space2x))
  
  static func category(_ color: circleColors) -> BankButtonStyle {
    return BankButtonStyle(backgroundColor: color.color, foregroundColor: .carbon, shape: .circle)
  }
  
  static let login = BankButtonStyle(backgroundColor: .carbon, foregroundColor: .milk, shape: .capsule)
  
}

struct setButtonStyle: ButtonStyle {
  var style: BankButtonStyle
  
  init(style: BankButtonStyle) {
    self.style = style
  }
  
  func makeBody(configuration: Configuration) -> some View {
    configuration.label
      .multilineTextAlignment(.center)
      .foregroundStyle( style.foregroundColor )
      .background( style.backgroundColor )
      .clipShape(style.shape)
  }
}
