//
//  AcercaDeLaApp.swift
//  Instituto Misionero
//
//  Created by Nicanor Orlando on 22/11/2021.
//  Copyright © 2021 KnorDev. All rights reserved.
//

import SwiftUI

struct AcercaDeLaApp: View {
    var body: some View {
        ZStack{
            Image("fondo13")
                .resizable()
                .scaledToFill()
                .opacity(0.3)
            
        VStack{
            Image("icono_im")
            HStack{
                Text("Instituto")
                    .foregroundColor(Color(UIColor(named: "dark-grey")!))
                    .fontWeight(.semibold)
                    .font(.largeTitle)
                Text("Misionero")
                    .foregroundColor(Color(UIColor(named: "dark-red")!))
                    .fontWeight(.semibold)
                    .font(.largeTitle)
            }
            Text("")
            VStack{
                Text("Desarrolado por: ")
                Button(action: {
                    let url = URL(string: "mailto:nicanororlando@gmail.com?subject=Consulta - Aplicacion IM")!
                    let application = UIApplication.shared
                    application.open(url)
                }) {
                Text("nicanororlando@gmail.com")
                }
            }
            Text("")
            VStack{
                Text("Todos los recursos (Canciones, imagenes y")
                Text("textos) pertenecen a sus respectivos autores.")
                Text("Esta aplicacion no tiene responsabilidad")
                Text("alguna ni lucro sobre los mismos")
            }
            Text("")
            VStack{
                Text("¡Si tenes alguna problema o duda no ")
                Text("dudes en contactarnos!")
                Text("")
                Button(action: {
                    let url = URL(string: "mailto:institutomisionero2021@gmail.com?subject=Consulta - Aplicacion IM")!
                    let application = UIApplication.shared
                    application.open(url)
                }) {                Text("institutomisionero2021@gmail.com")
                }
            }
            Text("")
            Button(action: {
                let url = URL(string: "market://details?id=")!
                let application = UIApplication.shared
                application.open(url)
            }) {
            Text("¡Califica esta App!")
            }
            .buttonStyle(filledRoundedCornerButtonStyle(padding: 15, cornerRadius: 10, linewidth: 0))
            
        }// --> VStack
    }// --> ZStack
}
}

struct AcercaDeLaApp_Previews: PreviewProvider {
    static var previews: some View {
        AcercaDeLaApp()
    }
}
