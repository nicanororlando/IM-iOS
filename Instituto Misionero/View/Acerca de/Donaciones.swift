//
//  Donaciones.swift
//  Instituto Misionero
//
//  Created by Nicanor Orlando on 22/11/2021.
//  Copyright © 2021 KnorDev. All rights reserved.
//

import SwiftUI

struct Donaciones: View {
    var body: some View {
        VStack{
            HStack{
                Image("im")
                    .resizable()
                    .frame(width: 120, height: 120, alignment: .center)
                VStack(alignment: .leading){
                Text("Instituto")
                    //.foregroundColor(.init(red: 80, green: 83, blue: 40))
                    .fontWeight(.bold)
                    .font(.largeTitle)
                    
                Text("Misionero")
                    .foregroundColor(.gray)
                    .fontWeight(.bold)
          	          .font(.largeTitle)
                }
            }.frame(width: .minimum(400, 400), height: 130, alignment: .center)
            
            Text("")
            
            VStack{
                Text("Hermanos mios amados, estad firmes y")
                Text("constantes, creciendo en la obra del")
                Text("señor, siempre sabiendo que vuestro")
                Text("trabajo en el señor no es vano")
                Text("1 Corintios 15:58")
                    .fontWeight(.bold)
                    .padding(8)
            }
            Text("")
            
            VStack{
                Text("Pasos para la donacion online: ")
                    .fontWeight(.bold)
                    .padding()
                    .font(.system(size: 20))
                
                Text("1) Donaciones con tarjeta de credito/debito:")
                Button(action: {
                    
                }) {
                Text("www.pagos.uap.edu.ar")
                }.padding(.top, 7)
                
                Text("2) Busca la opcion de: ")
                    .padding(.top, 15)
                Text("Donaciones Instituto Misionero")
                    .fontWeight(.light)
                
                Text("3) En la descripcion escribe: ")
                    .padding(.top, 15)
                Text("Facultad de ciencias de la salud")
                    .fontWeight(.light)
            }
        }
    }
}

struct Donaciones_Previews: PreviewProvider {
    static var previews: some View {
        Donaciones()
    }
}
