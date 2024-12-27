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
  private let recommendationsInfo: [(String, String, String, String, ImageResource)] = [
    ("Hola! soy Juan", "Programador Junior iOS, con ganas de aprender muchas cosas", "Mira mi CV", "https://www.google.com", .happyperson),
    ("Checa mi repositorio", "Aquí encontrarás pequeños proyectos independientes, y también con recursos de varios cursos que hice", "Conoce mi repo", "https://www.google.com", .repository),
    ("Sígueme en Linkedin :)", "Puedes revisar mi perfil profesional en linkedin", "Conoce Taklone", "https://www.google.com", .linkedinlogo),
    ("¿Qué otras cosas me gustan?", "Entre otras, los videojuegos, escuchar música, leer, y muchas otras cosas. Te comparto la última canción que escuché", "Escúchala", "https://www.google.com", .guitar),
    ("¡Un saludo!", "Te invito a conocer el resto de este clon que hice con fines de aprendizaje c:", "O revisa otros de mis proyectos", "https://www.google.com", .greetings)
  ]
  
  var body: some View {
    ZStack {
      NavigationStack {
        ScrollView(.vertical, showsIndicators: false) {
          VStack(alignment: .leading, spacing: 0) {
            Spacer(minLength: .space10x)
            
            mainAction
              .background(.milk)
            
            mainTransactions
            moreCategories
            recommendations
          }
        }
        .background(Color(UIColor.systemGray6).ignoresSafeArea(edges: .all))
        .toolbarBackground(.visible, for: .navigationBar)
        .toolbarColorScheme(.light, for: .navigationBar)
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
        .padding(.leading, .space4x)
        .padding(.top, .space4x)
      
      LazyVGrid(
        columns: [GridItem(.adaptive(minimum: 90))],
        spacing: .zero
      ) {
        ForEach( categories.indices, id: \.self) { index in
          let (icon, category, color) = categories[index]
          CustomButton(
            icon: icon,
            text: category,
            style: .category(color)
          )
        }
      }
      .padding(.horizontal, .space4x)
      .padding(.vertical, .space1x)
      .background(.milk)
    }
    .padding(.top, .space2x)
    .padding(.bottom, .space2x)
  }
  
  //MARK: - Recommendations
  @ViewBuilder
  var recommendations: some View {
    VStack(alignment: .leading) {
      Text("Pensando en ti te recomendamos")
        .font(.headline)
        .fontWeight(.thin)
        .padding(.leading, .space4x)
      
      // Card View
      ScrollView(.horizontal) {
        HStack(spacing: .space4x) {
          ForEach( recommendationsInfo.indices, id: \.self) { index in
            let (title, text, textLink, url, image) = recommendationsInfo[index]
            CustomCard(
              title: title,
              text: text,
              textLink: textLink,
              link: url,
              image: image
            )
          }
        }
        .padding(.vertical, .space2x)
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
    .offset(x: 150, y: 280)
  }
}

struct MainView_preview: PreviewProvider {
  static var previews: some View {
    HomeView()
  }
}
