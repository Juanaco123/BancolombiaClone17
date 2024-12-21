//
//  ContentView.swift
//  BancolombiaClone
//
//  Created by Juan Camilo Victoria Pacheco on 28/11/24.
//

import SwiftUI
import Foundation

struct ContentView: View {
  
  @State private var selectedTab: Int = 0
  
  var body: some View {
    
    ZStack(alignment: .bottom) {
      VStack {
        TabView(selection: $selectedTab) {
          HomeView()
            .tag(0)
          TransactionsView()
            .tag(1)
          ExploreView()
            .tag(2)
          ProceduresAndApplicationsView()
            .tag(3)
          SettingsView()
            .tag(4)
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .animation(.easeOut(duration: 0.2), value: selectedTab)
        .transition(.slide)
        
        Spacer(minLength: 50)
      }
      HStack(spacing: .space2x) {
        NavBarItem(systemName: "house", text: "Inicio", tabIndex: 0, currentTab: $selectedTab)
        NavBarItem(systemName: "creditcard", text: "Transacciones", tabIndex: 1, currentTab: $selectedTab)
        NavBarItem(systemName: "square.grid.2x2", text: "Explorar", tabIndex: 2, currentTab: $selectedTab)
        NavBarItem(systemName: "doc.plaintext", text: "Tramites y solicitudes", tabIndex: 3, currentTab: $selectedTab)
        NavBarItem(systemName: "gearshape", text: "Ajustes", tabIndex: 4, currentTab: $selectedTab)
      }
      .frame(maxWidth: .infinity)
      .background()
    }
  }
}

struct ContentView_Preview: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
