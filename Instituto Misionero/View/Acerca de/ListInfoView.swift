//
//  ListInfoView.swift
//  Instituto Misionero
//
//  Created by Nicanor Orlando on 07/11/2021.
//  Copyright © 2021 KnorDev. All rights reserved.
//

import SwiftUI

struct ListInfoView: View {
    @State var navigateToDonaciones = false
    @State var navigateToAcercaDe = false
    var navigateToListInfoView: Binding<Bool>
    
    var body: some View {
        NavigationView{
        ZStack{
        Image("fondo13")
            .resizable()
            .scaledToFill()
            .opacity(0.4)
    	
            VStack(alignment: .leading){
            Button(action: {
                self.navigateToListInfoView.wrappedValue = false
            }) {
                HStack{
                    Image("icons8-atras")
                        .resizable()
                        .frame(width: 40, height: 40, alignment: .center)
                    Text("Back")
                        .font(.system(size: 23))
                        .offset(x: -13)
                    Spacer()
                }
                .frame(width: 400, height: 60, alignment: .center)
                .foregroundColor(.black)
                }.padding(4)
            
            Group(){
                VStack (alignment: .leading){
                    Text("Redes sociales")
                        .font(.title)
                        .fontWeight(.light)
                        .padding(.top, 10)
                        .padding(.bottom, -10)
                    Divider()
                        .frame(width: 300)
                        .background(Color.black)
                }.padding(.leading, 15)
                
            // Instagram //
            Button(action: {
                let url = URL(string: "fb://profile/<PAGE_ID>")!
                let application = UIApplication.shared
                
                /// Check if the ig App is installed
                if application.canOpenURL(url) {
                    application.open(url)
                } else {
                    /// If ig App is not installed, open Safari with ig Link
                    application.open(URL(string: "http://instagram.com/_u/instituto.misionero")!)
                }
            }) {
                Boton(image: "instagram", title: "Instagram", subTitle: "@instituto.misionero")
            }
            // Facebook //
            Button(action: {
                let url = URL(string: "fb://profile/<PAGE_ID>")!
                let application = UIApplication.shared
                
                /// Check if the facebook App is installed
                if application.canOpenURL(url) {
                    application.open(url)
                } else {
                    /// If Facebook App is not installed, open Safari with Facebook Link
                    application.open(URL(string: "https://de-de.facebook.com/apple")!)
                }
            }) {
                Boton(image: "facebook", title: "Facebook", subTitle: "facebook.com/institutomisionero")
            }
                
            // Youtube //
            Button(action: {
                let url = URL(string: "fb://profile/<PAGE_ID>")!
                let application = UIApplication.shared
                
                /// Check if the yt App is installed
                if application.canOpenURL(url) {
                    application.open(url)
                } else {
                    /// If yt App is not installed, open Safari with yt Link
                    application.open(URL(string: "https://www.youtube.com/user/InstitutoMisionerUAP")!)
                }
            }) {
                Boton(image: "youtube", title: "Youtube", subTitle: "youtube.com/institutomisionero")
            }.padding(.bottom, 15)
            }// --> Group
            
            Group(){
            VStack (alignment: .leading){
                Text("Sobre nosotros")
                    .font(.title)
                    .fontWeight(.light)
                    .padding(.top, 10)
                    .padding(.bottom, -10)
                Divider()
                    .frame(width: 300)
                    .background(Color.black)
            }.padding(.leading, 15)
                
            Button(action: {
                self.navigateToAcercaDe = true
            }) {
                HStack{
                    Image("informacion")
                        .resizable()
                        .frame(width: 40, height: 40, alignment: .center)
                        .foregroundColor(Color(UIColor(named: "dark-red")!))
                    Text("Acerca de esta App")
                        .foregroundColor(Color.black)
                        .font(.title)
                }
            }
            .padding(5)
            .padding(.top, 7)
            .padding(.leading, 10)
            
            // Donaciones //
            Button(action: {
                self.navigateToDonaciones = true
            }) {
                HStack{
                    Image("pago")
                        .resizable()
                        .frame(width: 40, height: 40, alignment: .center)
                        .foregroundColor(Color(UIColor(named: "dark-red")!))
                    Text("Donaciones")
                        .foregroundColor(Color.black)
                        .font(.title)
                }

                .padding(5)
                .padding(.leading, 10)
                }
            }// --> Group
            Spacer()
          }// --> VStack potoca
          .background(
              Group{
                  NavigationLink(
                      destination: AcercaDeLaApp(),
                      isActive: $navigateToAcercaDe,
                      label: {
                          EmptyView()
                      })
                  NavigationLink(
                      destination: Donaciones(),
                      isActive: $navigateToDonaciones,
                      label: {
                          EmptyView()
                      })
              }// --> Group
              .hidden()
          )
          .navigationBarTitle("")
          .navigationBarHidden(true)
          .background(Color.white.opacity(0))
          .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
          //.padding()
        }// --> ZStack
    }// --> Nav view
}// --> body
}

struct Boton: View {
    
    let image: String
    let title: String
    let subTitle: String
    
    var body: some View {
        HStack{
            Image(image)
                .resizable()
                .frame(width: 40, height: 40, alignment: .center)
            VStack(alignment: .leading){
                Text(title)
                    .font(.title)
                Text(subTitle)
                    .font(.subheadline)
            }
            Spacer()
        }
        .frame(width: 400, height: 60, alignment: .center)
        .foregroundColor(.black)
        .padding(5)
        .padding(.leading, 10)
    }
}

struct ListInfoView_Previews: PreviewProvider {
    static var previews: some View {
        ListInfoView(navigateToListInfoView: .constant(true))
    }
}

