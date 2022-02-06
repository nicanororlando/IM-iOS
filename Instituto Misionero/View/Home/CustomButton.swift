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
    var padding: CGFloat = 18
    var bgColor: Color = .red
    var fgColor: Color = .white
    var cornerRadius: CGFloat = 20
    var opacity: CGFloat
    var X: CGFloat
    var Y: CGFloat
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(font)
            .padding(padding)
            .background(bgColor)
            .foregroundColor(fgColor)
            .cornerRadius(cornerRadius)
            .opacity(Double(opacity))
            .offset(x: X, y: Y)
            .scaleEffect(configuration.isPressed ? 0.7 : 1.0)
            .animation(.spring())
    }
}

