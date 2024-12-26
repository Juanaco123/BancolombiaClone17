//
//  ContentView.swift
//  BancolombiaClone
//
//  Created by Juan Camilo Victoria Pacheco on 31/08/24.
//

import UIKit
import SwiftUI

struct HomeView: View {
  
  // Constant
  private let loginText: String = "Iniciar sesión"
  private let loginIcon: String = "rectangle.portrait.and.arrow.forward"
  private let transactions: [(String, String)] = [
    ("banknote", "Ver saldos y movimientos"),
    ("paperplane", "Transferir dinero"),
    ("creditcard", "Pagar tarjetas de crédito y créditos"),
    ("newspaper" ,"Pagar y administrar facturas")
  ]
  private let categories: [(String, String, circleColors)] = [
    ("target", "Gestionar día a día", .thistle),
    ("house", "Hogar y servicios", .tiffBlue),
    ("car", "Transporte", .sand),
    ("star", "Para ti", .vanilla),
    ("menucard", "Trámites y solicitudes", .sky)
  ]
  
  var body: some View {
    ZStack {
      NavigationStack {
        ScrollView(.vertical, showsIndicators: false) {
          VStack(alignment: .leading, spacing: 0) {
            Spacer(minLength: 50)
            
            mainAction
            mainTransactions
            moreCategories
            recommendations
          }
        }
        .toolbar {
          //MARK: - NavBar
          ToolbarItem(placement: .topBarLeading) {
            Text("Banklone")
              .font(.headline)
              .fontWeight(.bold)
              .padding(.leading, .space4x)
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
    .ignoresSafeArea(.all)
  }
  
  //MARK: - Login and dinamic key
  @ViewBuilder
  var mainAction: some View {
    VStack(alignment: .leading) {
      ScheduleText()
      
      HStack {
        // Dinamic Key
        DynamicKeyView()
          .offset(y: 25)
        
        Spacer()
        
        // Login button
        CustomButton(
          icon: loginIcon,
          text: loginText,
          style: .login
        )
        .offset(y: -30)
      }
    }
    .padding(.top, .space2x)
    .padding(.horizontal, .space4x)
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
        HStack(spacing: .space5x) {
          ForEach( transactions, id: \.0 ) { icon, transaction in
            CustomButton(
              icon: icon,
              text: transaction,
              style: .principal
            )
          }
        }
        .padding(.leading, .space4x)
        .padding(.vertical, .space1x)
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
    VStack(alignment: .leading, spacing: .space5x) {
      Text("Explora nuestras categorías")
        .font(.headline)
        .fontWeight(.thin)
        .padding(.leading, 15)
        .padding(.top, 15)
      
      LazyVGrid(
        columns: [GridItem(.adaptive(minimum: 90))],
        spacing: .zero
      ) {
        ForEach( categories, id: \.0) { icon, category, color in
          CustomButton(
            icon: icon,
            text: category,
            style: .category(color)
          )
        }
      }
      .padding(.vertical)
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
        .padding(.leading, .space4x)
      
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
        .padding(.leading, .space4x)
      }
      .scrollIndicators(.hidden)
      .ignoresSafeArea(.all)
      
    }
    .padding(.bottom, .space10x)
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
