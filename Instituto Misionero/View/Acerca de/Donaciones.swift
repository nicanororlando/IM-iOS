//
//  Donaciones.swift
//  Instituto Misionero
//
//  Created by Nicanor Orlando on 22/11/2021.
//  Copyright © 2021 KnorDev. All rights reserved.
//

import SwiftUI

struct Donaciones: View {
    
    var navigateToListInfoView: Binding<Bool>?
    var navigateToDonaciones: Binding<Bool>
    
    var body: some View {
        ZStack{
            Image("fondo13")
                .resizable()
                .scaledToFill()
                .opacity(0.3)
            
        VStack{
            Button(action: {
                self.navigateToDonaciones.wrappedValue = false
            }) {
                HStack{
                    Image("icons8-atras")
                        .resizable()
                        .frame(width: 38, height: 38, alignment: .center)
                    Text("Back")
                        .font(.system(size: 23))
                        .offset(x: -17)
                    Spacer()
                }
                .frame(width: 400, height: 60, alignment: .center)
                .foregroundColor(.black)
            }.padding(4)// --> Back button
            
            Spacer()
            
            HStack{
                Image("icono_im")
                    .resizable()
                    .frame(width: 120, height: 120, alignment: .center)
                VStack(alignment: .leading){
                Text("Instituto")
                    .foregroundColor(Color(UIColor(named: "dark-grey")!))
                    .fontWeight(.semibold)
                    .font(.largeTitle)
                    
                Text("Misionero")
                    .foregroundColor(Color(UIColor(named: "dark-red")!))
                    .fontWeight(.semibold)
          	          .font(.largeTitle)
                }
            }.frame(width: .minimum(400, 400), height: 130, alignment: .center).padding(.bottom, 10)// --> Icono + titulo
            
            VStack{
                Text("Hermanos mios amados, estad firmes y")
                Text("constantes, creciendo en la obra del")
                Text("señor, siempre sabiendo que vuestro")
                Text("trabajo en el señor no es vano")
                Text("1 Corintios 15:58")
                    .fontWeight(.bold)
                    .padding(8)
            }.padding(.bottom, 10)// --> VStack versiculo
            
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
            }// --> VStack donaciones
            
            Spacer()
            Spacer()
        }// --> VStack potoca
        .navigationBarBackButtonHidden(true)
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }// --> ZStack potoca
}// --> View
}

struct Donaciones_Previews: PreviewProvider {
    static var previews: some View {
        Donaciones(navigateToDonaciones: .constant(true))
    }
}
