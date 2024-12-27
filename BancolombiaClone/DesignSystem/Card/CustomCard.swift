//
//  CustomCard.swift
//  BancolombiaClone
//
//  Created by Juan Camilo Victoria Pacheco on 26/12/24.
//

import SwiftUI
import Foundation

struct CustomCard: View {
  var title: String
  var text: String
  var textLink: String
  var link: String
  var image: ImageResource
  
  // Constant
  private let icon: String = "chevron.right"
  
  init(
    title: String = "",
    text: String = "",
    textLink: String = "",
    link: String = "https://www.google.com",
    image: ImageResource
  ) {
    self.title = title
    self.text = text
    self.textLink = textLink
    self.link = link
    self.image = image
  }
  
  var body: some View {
    GeometryReader { geometry in
      HStack(spacing: .zero) {
        VStack(alignment: .leading) {
          Text(title)
            .lineLimit(nil)
            .font(.system(size: .size32))
            .fontWeight(.heavy)
            .minimumScaleFactor(0.6)
            .padding(.top, .space4x)
          
          Text(text)
            .lineLimit(nil)
            .font(.system(size: .size20))
            .minimumScaleFactor(0.55)
            .fontWeight(.medium)
            .padding(.bottom, .space2x)
          
          HStack {
            Link(destination: URL(string: link)!, label: {
              Text(textLink)
                .font(.system(size: .size14, weight: .bold))
                .underline()
              Image(systemName: icon)
            })
          }
          .tint(.carbon)
          .padding(.bottom,.space1x)
        }
        .padding(.space4x)
        .frame(width: geometry.size.width * 0.5)
        
        Image(image)
          .resizable()
          .scaledToFit()
          .aspectRatio(1.0, contentMode: .fit)
          .frame(width: geometry.size.width * 0.5, height: geometry.size.height)
          .clipped()
      }
      .background(.milk)
      .clipShape(.rect(cornerRadius: .radius4))
      .shadow(radius: .radius4)
    }
    .frame(width: 400, height: 250)
  }
}

struct CustomCard_Preview: PreviewProvider {
  static var previews: some View {
    CustomCard(
      title: "1,2,3",
      text: "tu plata llega de inmediato a donde estés",
      textLink: "Conoce cómo",
      image: .repository
    )
  }
}
