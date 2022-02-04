//
//  ContentView.swift
//  Instituto Misionero
//
//  Created by Nicanor Orlando on 19/10/2021.
//  Copyright © 2021 KnorDev. All rights reserved.
//

import SwiftUI

struct Home: View {
    
    var body: some View {
        
            ZStack{
            ///La 6 o 13 son las mejores.
            Image("fondo13")
                .resizable()
                .scaledToFill()
            
            VStack{
                Button(action: {
                    
                }) {
                Text("Coritario")
                }
                .buttonStyle(filledRoundedCornerButtonStyle(font: .title, padding: 10, bgColor: .red, fgColor: .white, cornerRadius: 10))
                
                Text("")
                Text("")
                
                Button(action: {
                    
                }) {
                HStack{
                    //Image(systemName: home)
                    Text("Acerca de nosotros")
                }
                }
                .buttonStyle(filledRoundedCornerButtonStyle(font: .title, padding: 10, bgColor: .red, fgColor: .white, cornerRadius: 10))
            }
            //Image("im")
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
