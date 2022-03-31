//
//  ContentView.swift
//  Instituto Misionero
//
//  Created by Nicanor Orlando on 19/10/2021.
//  Copyright © 2021 KnorDev. All rights reserved.
//

import SwiftUI
import Combine

struct Home: View {
    
    @State private var showModal = false
    @State var navigateToCoritario = false

    @ObservedObject var adapted = Adapted()

     var body: some View {
         NavigationView {
             ZStack {
                 Image("fondo13")
                     .resizable()
                     .scaledToFill()
                     .blur(radius: 3)

             VStack{

                Button(action: {
                    self.showModal = true
                }) {
                    VStack{
                        Image("icono_im")
                            .resizable()
                            .frame(width: adapted.adaptedHeight(curHeight: 80), height: adapted.adaptedHeight(curHeight: 80))
                            .padding(.top, adapted.adaptedHeight(curHeight: 7))
                        Text("Instituto")
                            .fontWeight(.semibold)
                            .foregroundColor(Color(red: 88, green: 00, blue: 00))
                        Text("Misionero")
                            .fontWeight(.semibold)
                    }
                }
                .padding(.bottom, adapted.adaptedHeight(curHeight: 30))
                .buttonStyle(filledRoundedCornerButtonStyle(
                    font: .title,
                    padding: adapted.adaptedHeight(curHeight: 20),
                    bgColor: Color.white.opacity(0.7),
                    bgColor2: Color.gray.opacity(0.5),
                    fgColor: .white, cornerRadius: 10, opacity: 1, X: 0, Y: 0))
                
                 // CORITARIO //
                 NavigationLink(
                    destination: Coritario(),
                     isActive: $navigateToCoritario)
                     {
                        Text("Coritario")
                            .fontWeight(.semibold)
                     }
                     .buttonStyle(filledRoundedCornerButtonStyle(
                         font: .title,
                         padding: adapted.adaptedHeight(curHeight: 20),
                         bgColor: Color.white.opacity(0.7),
                         bgColor2: Color.gray.opacity(0.5),
                         fgColor: .white, cornerRadius: 10, opacity: 1, X: 0, Y: 0))

                 }// --> VStack
                
                 ModalView(isShowing: $showModal, curHeight: adapted.adaptedHeight(curHeight: 450))
                
             }// --> ZStack
             .navigationBarTitle("")
             .navigationBarHidden(true)
         }// --> Nav view
     }// --> Body
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
