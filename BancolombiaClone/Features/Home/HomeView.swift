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
            mainAction
            mainTransactions
            moreCategories
            recommendations
          }
        }
        .toolbar {
          //MARK: - NavBar
          ToolbarItem(placement: .topBarLeading) {
            Text("Bankclone")
              .font(.headline)
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
      QRButton
    }
    .padding(.horizontal, .space4x)
  }
  
  //MARK: - Login and dinamic key
  @ViewBuilder
  var mainAction: some View {
    VStack(alignment: .leading) {
      Text("Buenos días")
        .font(.title)
        .fontWeight(.thin)
        .padding(.top, .space5x)
      HStack {
        // Dinamic Key
        HStack {
          CircularTimer()
          
          VStack {
            Text("Clave dinámica")
              .font(.caption)
              .lineLimit(1)
            Text("123456")
              .font(.subheadline)
              .kerning(3)
              .fontWeight(.bold)
          }
          .minimumScaleFactor(0.7)
          Image(systemName: "chevron.forward")
          
        }
        .padding(6)
        .background(RoundedRectangle(cornerRadius: 25.0).fill(.white).shadow(radius: 1))
        .offset(y: 25)
        
        Spacer()
        
        // Login button
        HStack {
          Text("Iniciar sesión")
            .font(.headline)
            .fontWeight(.bold)
          Image(.systemLogin)
            .resizable()
            .frame(width: 20, height: 20)
        }
        .foregroundStyle(.white)
        .padding(10)
        .background(.black)
        .clipShape(.rect(cornerRadius: 20))
        .offset(y: -30)
      }
    }
    .padding(.top, 20)
    .padding(.horizontal)
    .background(Color(UIColor.systemGray6).ignoresSafeArea(edges: .all))
  }
  
  //MARK: - Main Transactions
  @ViewBuilder
  var mainTransactions: some View {
    VStack(alignment: .leading) {
      Text("Transacciones principales")
        .font(.headline)
        .fontWeight(.thin)
        .padding(.leading, 15)
      
      ScrollView(.horizontal) {
        HStack(spacing: 10) {
          ForEach((1...5), id: \.self) { item in
            Text(String(item))
              .frame(width: 85, height: 100, alignment: .center)
              .background(.blue)
              .cornerRadius(10)
              .foregroundColor(.white)
              .font(.title)
          }
        }
      }
      .padding(.top, 10)
      .scrollIndicators(.hidden)
      .ignoresSafeArea(.all)
    }
    .padding(.top, 60)
  }
  
  //MARK: - More categories
  @ViewBuilder
  var moreCategories: some View {
    VStack(alignment: .leading, spacing: 20) {
      Text("Explora nuestras categorías")
        .font(.headline)
        .fontWeight(.thin)
        .padding(.leading, 15)
        .padding(.top, 15)
      
      LazyVGrid(
        columns: [GridItem(.adaptive(minimum: 90))],
        spacing: 10
      ) {
        ForEach((1...5), id: \.self) { item in
          Text(String(item))
            .frame(width: 60, height: 70, alignment: .center)
            .background(.blue)
            .cornerRadius(10)
            .foregroundColor(.white)
            .font(.title)
        }
      }
      .padding(.vertical)
      .background(Color(UIColor.systemGray6).ignoresSafeArea(edges: .all))
    }
    .padding(.horizontal, 5)
    .padding(.top, 10)
  }
  
  //MARK: - Recommendations
  @ViewBuilder
  var recommendations: some View {
    VStack(alignment: .leading) {
      Text("Pensando en ti te recomendamos")
        .font(.headline)
        .fontWeight(.thin)
        .padding(.vertical, 20)
      
      // Card View
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
      .ignoresSafeArea(.all)
      
    }
    .padding(.horizontal, 10)
    .padding(.bottom, 20)
  }
  
  //MARK: - QR
  @ViewBuilder
  var QRButton: some View {
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
    .offset(x: 150, y: 250)
  }
}

struct MainView_preview: PreviewProvider {
  static var previews: some View {
    HomeView()
  }
}
