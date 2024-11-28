//
//  ContentView.swift
//  BancolombiaClone
//
//  Created by Juan Camilo Victoria Pacheco on 28/11/24.
//

import SwiftUI
import Foundation

struct ContentView: View {
  var body: some View {
    TabView {
      HomeView()
        .tabItem {
          Label("Inicio", systemImage: "house")
        }
      TransactionsView()
        .tabItem {
          Label("Transacciones", systemImage: "creditcard")
        }
      ExploreView()
        .tabItem {
          Label("Explorar", systemImage: "square.grid.2x2")
        }
      ProceduresAndApplicationsView()
        .tabItem {
          Label("Tramites y solicitudes", systemImage: "doc.plaintext")
        }
      SettingsView()
        .tabItem {
          Label("Ajustes", systemImage: "gearshape")
        }
    }
    Text("Hola c: \n\(GeneratedStrings.justALetter)")
  }
}

struct ContentView_Preview: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
