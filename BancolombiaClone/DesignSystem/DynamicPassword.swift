//
//  DynamicPassword.swift
//  BancolombiaClone
//
//  Created by Juan Camilo Victoria Pacheco on 31/08/24.
//

import Foundation
import SwiftUI

public struct DynamicPassword: View {
    
    public var body: some View {
        Button {
        } label: {
            HStack {
                //Progress Icon
                ProgressBarIcon(
                    icon: Image(.systemSecure),
                    width: 50,
                    height: 50,
                    seconds: 60
                )
                .padding(.trailing, 5)
                VStack {
                    // Text
                    dynamicPasswordText
                    // Random number
                    randomNumber
                }
                // Arrow icon
                Image(.systemForward)
                
            }
        }
        .padding()
        .background(Color.white)
        .clipShape(.capsule)
        .shadow(color: .black.opacity(0.1), radius: 10)
    }
}

@ViewBuilder
var dynamicPasswordText: some View {
    Text("Clave Dinámica")
        .fontWeight(.light)
        .foregroundStyle(.black)
}

@ViewBuilder
var randomNumber: some View {
    let randomNumber = Int.random(in: 100_000...999_999)
    let formattedNumber: String = String(randomNumber)
    Text(formattedNumber)
        .kerning(6)
        .fontWeight(.bold)
        .foregroundStyle(.black)
}

struct DynamicPassword_Preview: PreviewProvider {
    static var previews: some View {
        DynamicPassword()
    }
}
