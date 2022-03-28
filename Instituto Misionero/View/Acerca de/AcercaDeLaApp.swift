//
//  AcercaDeLaApp.swift
//  Instituto Misionero
//
//  Created by Nicanor Orlando on 22/11/2021.
//  Copyright © 2021 KnorDev. All rights reserved.
//

import SwiftUI

struct AcercaDeLaApp: View {
    
    @Binding var navigateToAcercaDe: Bool
    @ObservedObject var adapted = Adapted()
    
    var body: some View {
        ZStack{
            Image("fondo13")
                .resizable()
                .scaledToFill()
                .opacity(0.3)
    
        VStack{
            Spacer()
            
            Group(){
            Image("icono_im")
                .resizable()
                .frame(width: adapted.adaptedHeight(curHeight: 250), height: adapted.adaptedHeight(curHeight: 250))
                .padding(.bottom, -10)
            HStack{
                Text("Instituto")
                    .foregroundColor(Color(UIColor(named: "dark-grey")!))
                    .fontWeight(.semibold)
                    .font(.system(size: adapted.adaptedWidth(curWidth: 27)))
                Text("Misionero")
                    .foregroundColor(Color(UIColor(named: "dark-red")!))
                    .fontWeight(.semibold)
                    .font(.system(size: adapted.adaptedWidth(curWidth: 27)))
            }
            }.padding(.bottom, adapted.adaptedHeight(curHeight: 10))// --> Group
            
            Group(){
            VStack{
                Text("Desarrolado por: ")
                    .font(.system(size: adapted.adaptedWidth(curWidth: 20)))
                Button(action: {
                    let url = URL(string: "mailto:nicanororlando@gmail.com?subject=Consulta - Aplicacion IM")!
                    let application = UIApplication.shared
                    application.open(url)
                }) {
                    Text("nicanororlando@gmail.com")
                        .font(.system(size: adapted.adaptedWidth(curWidth: 20)))
                }
            }.padding(.bottom, 10)// --> VStack info desarrollador
            
            VStack{
                Text("Todos los recursos (Canciones, imagenes y")
                Text("textos) pertenecen a sus respectivos autores.")
                Text("Esta aplicacion no tiene responsabilidad")
                Text("alguna ni lucro sobre los mismos")
            }.padding(.bottom, 10)// --> VStack recursos
            
            VStack{
                Text("¡Si tenes alguna problema o duda no ")
                Text("dudes en contactarnos!")
                    .padding(.bottom, 5)
                Button(action: {
                    let url = URL(string: "mailto:institutomisionero2021@gmail.com?subject=Consulta - Aplicacion IM")!
                    let application = UIApplication.shared
                    application.open(url)
                }) {
                    Text("institutomisionero2021@gmail.com")
                        .font(.system(size: 20))
                }
            }.padding(.bottom, 25)// --> VStack contacto

            Button(action: {
                let url = URL(string: "market://details?id=")!
                let application = UIApplication.shared
                application.open(url)
            }) {
                Text("¡Califica esta App!")
            }
            .buttonStyle(filledRoundedCornerButtonStyle(padding: adapted.adaptedHeight(curHeight: 15), cornerRadius: 10, linewidth: 0))
            }// -> Group
            
            Spacer()
            Spacer()
        }// --> VStack
        .navigationBarBackButtonHidden(true)
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarHidden(false)
        .navigationBarItems(leading:
            Button(action: {
                self.navigateToAcercaDe = false
            }) {
                HStack{
                    Image("icons8-atras")
                        .resizable()
                        .frame(width: adapted.adaptedWidth(curWidth: 31), height: adapted.adaptedWidth(curWidth: 31), alignment: .center)
                    Text("Sobre nosotros")
                        .font(.system(size: adapted.adaptedWidth(curWidth: 18)))
                        .offset(x: -(adapted.adaptedWidth(curWidth: 15)))
                    Spacer()
                }
                .frame(width: adapted.adaptedWidth(curWidth: 400), height: adapted.adaptedHeight(curHeight: 60), alignment: .center)
                .foregroundColor(.black)
            }.padding(4)// --> Back button
          )// --> Nav items
    
      }// --> ZStack
  }// --> View
}

struct AcercaDeLaApp_Previews: PreviewProvider {
    static var previews: some View {
        AcercaDeLaApp(navigateToAcercaDe: .constant(true))
        .previewDevice("iPhone 8")
    }
}
