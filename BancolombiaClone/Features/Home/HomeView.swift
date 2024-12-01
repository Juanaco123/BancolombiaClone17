//
//  ContentView.swift
//  BancolombiaClone
//
//  Created by Juan Camilo Victoria Pacheco on 31/08/24.
//

import UIKit
import SwiftUI

struct HomeView: View {
  var body: some View {
    ZStack {
      NavigationStack {
        ScrollView(.vertical) {
          VStack(alignment: .leading, spacing: 0) {
            //MARK: - Login and dinamic key
            Text("Buenos días")
              .padding(.top, 10)
            
            HStack {
              // Dinamic Key
              HStack {
                ZStack {
                  Circle()
                    .stroke(lineWidth: 5)
                    .foregroundStyle(Color(UIColor.systemGray5))
                    .frame(width: 40, height: 40)
                  
                  Circle()
                    .trim(from: 0.0, to: 10)
                    .stroke(style: StrokeStyle(lineWidth: 5, lineCap: .round))
                    .foregroundStyle(.yellow)
                    .rotationEffect(.degrees(-90))
                    .frame(width: 40, height: 40)
                    .animation(.linear(duration: 10), value: 10)
                  
                  Image(systemName: "lock")
                    .frame(width: 40/2.5, height: 40/2.5)
                    .foregroundStyle(.blue)
                }
                
                VStack {
                  Text("Clave dinámica")
                    .font(.caption)
                  Text("123456")
                }
                Image(systemName: "chevron.forward")
                
              }
              .padding(6)
              .background(RoundedRectangle(cornerRadius: 25.0).fill(.white).shadow(radius: 1))
              .padding(.top, 16)
              
              Spacer()
              
              // Login button
              HStack {
                Text("Inicir sesión")
                  .fontWeight(.bold)
                Image(.systemLogin)
                  .resizable()
                  .frame(width: 20, height: 20)
              }
              .foregroundStyle(.white)
              .padding(10)
              .background(.black)
              .clipShape(.rect(cornerRadius: 20))
            }
            .padding(.horizontal)
            
            //MARK: - Main Transactions
            VStack(alignment: .leading) {
              Text("Transacciones principales")
              ScrollView(.horizontal) {
                HStack(spacing: 10) {
                  ForEach((1...5), id: \.self) { item in
                    Text(String(item))
                      .frame(width: 85, height: 85, alignment: .center)
                      .background(.blue)
                      .cornerRadius(10)
                      .foregroundColor(.white)
                      .font(.title)
                  }
                }
              }
              .scrollIndicators(.hidden)
            }
            
            //MARK: - More categories
            VStack(alignment: .leading, spacing: 20) {
              Text("Explora nuestras categorías")
              LazyVGrid(
                columns: [GridItem(.adaptive(minimum: 100))],
                spacing: 10
              ) {
                ForEach((1...5), id: \.self) { item in
                  Text(String(item))
                    .frame(width: 50, height: 50, alignment: .center)
                    .background(.blue)
                    .cornerRadius(10)
                    .foregroundColor(.white)
                    .font(.title)
                }
              }
              .padding(.vertical)
              .background(.white)
            }
            .padding(.horizontal, 5)
            .padding(.top, 10)
            
            //MARK: - Recommendations
            VStack(alignment: .leading) {
              Text("Pensando en ti te recomendamos")
                .padding(.vertical, 20)
              ScrollView(.horizontal) {
                HStack(spacing: 10) {
                  ForEach((1...5), id: \.self) { item in
                    Text(String(item))
                      .frame(width: 370, height: 200, alignment: .center)
                      .background(.blue)
                      .cornerRadius(5)
                      .foregroundColor(.white)
                      .font(.title)
                  }
                }
              }
              .scrollIndicators(.hidden)
              
            }
            .padding(.horizontal, 10)
            .padding(.bottom, 20)
          }
        }
        .toolbar {
          //MARK: - NavBar
          ToolbarItem(placement: .topBarLeading) {
            Text("Bankclone")
              .font(.title)
              .fontWeight(.bold)
          }
          ToolbarItem(placement: .topBarTrailing) {
            HStack(spacing: 16) {
              Image(systemName: "bell")
              Image(systemName: "questionmark.circle")
              Image(systemName: "ellipsis.message")
            }
          }
        }
      }
      ZStack {
        Circle()
          .foregroundStyle(.white)
          .frame(width: 60, height: 60)
        
        Circle()
          .stroke(lineWidth: 5)
          .frame(width: 60, height: 60)
          .foregroundStyle(.yellow)
        
        Image(systemName: "qrcode.viewfinder")
          .resizable()
          .frame(width: 60/2.5, height: 60/2.5)
      }
      .offset(x: 150, y: 315)
      
    }
    .padding(.horizontal, 10)
    .background(Color(UIColor.systemGray6).ignoresSafeArea(edges: .all))
    .navigationTitle("BankClone")
    .toolbar {
      ToolbarItem {
        
      }
    }
  }
}

struct MainView_preview: PreviewProvider {
  static var previews: some View {
    HomeView()
  }
}
