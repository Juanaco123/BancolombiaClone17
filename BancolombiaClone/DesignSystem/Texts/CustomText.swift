//
//  CustomText.swift
//  BancolombiaClone
//
//  Created by Juan Camilo Victoria Pacheco on 28/11/24.
//

import SwiftUI
import Foundation

struct CustomText: View {
  var font: Font = .body
  var weight: CGFloat = 10.0
  var foregroundColor: Color = .carbon
  
  var body: some View {
    Text("DIE C:")
  }
}

struct CustomText_Preview: PreviewProvider {
  static var previews: some View {
    CustomText()
  }
}
