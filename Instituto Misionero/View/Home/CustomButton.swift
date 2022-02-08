//
//  CustomButton.swift
//  Instituto Misionero
//
//  Created by Nicanor Orlando on 04/02/2022.
//  Copyright © 2022 KnorDev. All rights reserved.
//

import SwiftUI

struct filledRoundedCornerButtonStyle: ButtonStyle {
    var font: Font = .title
    var padding: CGFloat = 20
    var bgColor: Color = Color(UIColor(named: "semi-dark-red")!)
    var bgColor2: Color = .white
    var fgColor: Color = .white
    var cornerRadius: CGFloat = 20
    var opacity: CGFloat
    var X: CGFloat
    var Y: CGFloat
    var linewidth: CGFloat = 1
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(font)
            .padding(padding)
            .background(RadialGradient(gradient: Gradient(colors: [bgColor, bgColor2]), center: .center, startRadius: 150, endRadius: 1))
            .foregroundColor(fgColor)
            .cornerRadius(cornerRadius)
            .opacity(Double(opacity))
            .offset(x: X, y: Y)
            .overlay(RoundedRectangle(cornerRadius: cornerRadius)
                .stroke(Color.white, lineWidth: linewidth))
        
            .scaleEffect(configuration.isPressed ? 0.7 : 1.0)
            .animation(.spring())	
    }
}

