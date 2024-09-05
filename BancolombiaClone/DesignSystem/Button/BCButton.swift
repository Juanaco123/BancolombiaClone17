//
//  Button.swift
//  BancolombiaClone
//
//  Created by Juan Camilo Victoria Pacheco on 3/09/24.
//

import Foundation
import SwiftUI

struct BCButton: View {
    
    private var text: String
    private var icon: ImageResource
    private var foregroundColor: Color
    private var backgroundColor: Color
    private var shadowColor: Color
    private var width: CGFloat
    private var height: CGFloat
    private var cornerRadius: CGFloat
    private var shadowRadius: CGFloat = 0
    private var action: () -> Void = {}
    // private var style: CustomButtonStyle
    
    init(
        text: String,
        icon: ImageResource,
        foregroundColor: Color = .black,
        backgroundColor: Color = .white,
        shadowColor: Color = .black.opacity(0.2),
        width: CGFloat = 100,
        height: CGFloat = 100,
        cornerRadius: CGFloat = 0,
        shadowRadius: CGFloat = 0,
        action: @escaping () -> Void = {}
    ) {
        self.text = text
        self.icon = icon
        self.foregroundColor = foregroundColor
        self.backgroundColor = backgroundColor
        self.shadowColor = shadowColor
        self.width = width
        self.height = height
        self.cornerRadius = cornerRadius
        self.shadowRadius = shadowRadius
        self.action = action
    }
    
    var body: some View {
        
        Button {} label: {
            VStack {
                // icon
                Image(icon)
                    .foregroundStyle(foregroundColor)
                // Text
                Text(text)
                    .foregroundStyle(foregroundColor)
                    .multilineTextAlignment(.center)
            }
        }
        .frame(width: width, height: height)
        .padding(.horizontal)
        .padding(.vertical, 5)
        .background(backgroundColor)
        .clipShape(.rect(cornerRadius: cornerRadius))
        .shadow(color: shadowColor, radius: 5)
    }
    
}

public struct CustomButton_Preview: PreviewProvider {
    public static var previews: some View {
        BCButton(
            text: "Ver saldos y movimientos",
            icon: .systemBalance
        )
    }
}
