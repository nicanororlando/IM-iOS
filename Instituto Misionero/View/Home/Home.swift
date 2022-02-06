//
//  ContentView.swift
//  Instituto Misionero
//
//  Created by Nicanor Orlando on 19/10/2021.
//  Copyright © 2021 KnorDev. All rights reserved.
//

import SwiftUI

struct Home: View {
    
    @State private var showModal = false
    
    var body: some View {
        
            ZStack{
            ///La 6 o 13 son las mejores.
            Image("fondo13")
                .resizable()
                .scaledToFill()
                .blur(radius: 5)
                
            VStack{
                Spacer()
                
                Button(action: {
                    self.showModal = true
                }) {
                VStack{
                    Image("icono_im")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .offset(x: 0, y: 10)
                    Text("Instituto")
                        .foregroundColor(Color(UIColor(named: "dark-grey")!))
                        .fontWeight(.bold)
                        .offset(x: 0, y: -5)
                    Text("Misionero")
                        .foregroundColor(Color(UIColor(named: "semi-dark-red")!))
                        .fontWeight(.bold)
                        .offset(x: 0, y: -10)
                    }
                }
                .buttonStyle(filledRoundedCornerButtonStyle(font: .largeTitle, padding: 10, bgColor: Color.white.opacity(0.3), fgColor: .white, cornerRadius: 20, opacity: 1.0, X: 0, Y: -40))

                Button(action: {
                    
                }) {
                HStack{
                    Image(systemName: "music.note.list")
                    Text("Coritario")
                        .fontWeight(.bold)
                    }
                }
                .buttonStyle(filledRoundedCornerButtonStyle(font: .title, padding: 15, bgColor: Color(UIColor(named: "semi-dark-red")!).opacity(0.8), fgColor: .white, cornerRadius: 10, opacity: 1, X: 0, Y: -40))
                
                Button(action: {
                    
                }) {
                HStack{
                    Image(systemName: "info.circle")
                    Text("Acerca de nosotros")
                        .fontWeight(.bold)
                    }
                }
                .buttonStyle(filledRoundedCornerButtonStyle(font: .title, padding: 15, bgColor: Color(UIColor(named: "semi-dark-red")!).opacity(0.8), fgColor: .white, cornerRadius: 10, opacity: 1, X: 0, Y: -30))
                
                }
                ModalView(isShowing: $showModal)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .statusBar(hidden: true)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
