//
//  NavBarItem.swift
//  BancolombiaClone
//
//  Created by Juan Camilo Victoria Pacheco on 20/12/24.
//

import SwiftUI

public struct NavBarItem: View {
  public var systemName: String
  public var text: String
  public var tabIndex: Int
  
  @Binding var currentTab: Int
  @Namespace private var namespace
  
  init(
    systemName: String = "house",
    text: String = "Inicio",
    tabIndex: Int = 0,
    currentTab: Binding<Int>
  ) {
    self.systemName = systemName
    self.text = text
    self.tabIndex = tabIndex
    self._currentTab = currentTab
  }
  
  public var body: some View {
    Button {
      self.currentTab = tabIndex
    } label: {
      VStack(spacing: .zero) {
        
        Image(systemName: systemName)
          .fontWeight(.medium)
          .padding(.bottom, .space1x)
          .alignmentGuide(.top) { _ in 0 }
        
        Text(text)
          .fontWeight(.light)
          .multilineTextAlignment(.center)
          .applyDynamicTextHandling(for: text)
        
      }
      .font(.footnote)
    }
    .buttonStyle(.plain)
    .padding(.top, .space1x)
    .frame(maxWidth: .infinity, maxHeight: 70)
    .background {
      displayBackground(on: tabIndex)
      
    }
    .clipShape(.rect(cornerRadius: .space1x))
    .animation(.spring(duration: 0.2), value: currentTab)
  }
  
  private func displayBackground(on itemIndex: Int) -> some View {
    if self.currentTab == itemIndex {
      return  AnyView(
        Color.yellow
          .matchedGeometryEffect(id: "box", in: namespace)
      )
      
    } else {
      return AnyView(
        Color.clear
      )
    }
  }
}

struct NavBarItem_Preview: PreviewProvider {
  @State static var currentTab: Int = 0
  static var previews: some View {
    HStack {
      NavBarItem(systemName: "house", text: "Inicio", tabIndex: 0, currentTab: $currentTab)
      NavBarItem(systemName: "creditcard", text: "Transacciones", tabIndex: 1, currentTab: $currentTab)
      NavBarItem(systemName: "square.grid.2x2", text: "Explorar", tabIndex: 2, currentTab: $currentTab)
      NavBarItem(systemName: "doc.plaintext", text: "Tramites y\nsolicitudes", tabIndex: 3, currentTab: $currentTab)
    }
    
  }
}
