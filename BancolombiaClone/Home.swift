//
//  ContentView.swift
//  BancolombiaClone
//
//  Created by Juan Camilo Victoria Pacheco on 31/08/24.
//

import SwiftUI

struct MainView: View {
    
//    @State private var
    
    var body: some View {
        NavigationStack {
            ScrollView {
                // MARK: Secondary bar
                HStack {
                    secondaryBar
                }
                // MARK: Main transactions
                VStack {
                    Text("Transacciones principales")
                    BCButtonGrid()
                }
                
                // MARK: Categories
                VStack {
                    Text("Explora nuestras categorias")
                }
                
                // MARK: Recomendations
                VStack {
                    Text("Pensando en ti te recomendamos")
                }
                // Carousel
                
                // MARK: QR
                
                // MARK: NavBar
                HStack {
                    
                }
            }
            .padding()
            .background(.whiteSmoke)
            .toolbar {
                // MARK: Up bar
                ToolbarItem(placement: .topBarLeading) {
                    Text("Bancolombia Clone")
                        .fontWeight(.bold)
                }
                // notification icon
                ToolbarItem(placement: .topBarTrailing) {
                    Button {} label: {
                        Image(.systemNotification)
                            .foregroundStyle(.yellow)
                    }
                }
                // Help icon
                ToolbarItem(placement: .topBarTrailing) {
                    Button {} label: {
                        Image(.systemHelp)
                            .foregroundStyle(.blue)
                    }
                }
                // whatsapp icon
                ToolbarItem(placement: .topBarTrailing) {
                    Button {} label: {
                        Image(.systemChat)
                            .foregroundStyle(.red)
                    }
                }
            }
        }
    }
    
    @ViewBuilder
    var secondaryBar: some View {
        VStack(alignment: .leading) {
            Text("Buenos días")
                .font(.title)
                .fontWeight(.thin)
                .multilineTextAlignment(.leading)
            // MARK: Dynamic password molecule
            DynamicPassword()
                .padding(.top, 30)
        }
        Button {
            // Some logic here
        } label: {
            Text("Iniciar sesion")
                .fontWeight(.bold)
                .foregroundStyle(.white)
            Image(.systemLogin)
                .foregroundStyle(.white)
        }
        .padding(.vertical, 10)
        .padding(.horizontal, 15)
        .background(Color.black)
        .clipShape(.capsule)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
