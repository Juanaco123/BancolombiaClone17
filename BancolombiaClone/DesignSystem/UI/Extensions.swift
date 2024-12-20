//
//  Extensions.swift
//  BancolombiaClone
//
//  Created by Juan Camilo Victoria Pacheco on 20/12/24.
//

import SwiftUI
import Foundation

extension View {
  func applyDynamicTextHandling(for text: String) -> some View {
    if text.contains(" ") {
      return AnyView(
        self
          .fixedSize(horizontal: false, vertical: true)
      )
    } else {
      return AnyView(
        self
          .lineLimit(1)
          .minimumScaleFactor(0.7)
      )
    }
  }
}
