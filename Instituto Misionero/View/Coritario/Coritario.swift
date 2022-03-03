//
//  ListView.swift
//  Instituto Misionero
//
//  Created by Nicanor Orlando on 05/11/2021.
//  Copyright © 2021 KnorDev. All rights reserved.
//

import SwiftUI

struct Coritario: View {
    
    @State var searchText = ""
    @State var isSearching = false
    @State var selectedCancion: Int? = nil
    
    @State var navigateToPdf = false
    var navigateToCoritario: Binding<Bool>
    
    ///Para acceder a los canciones del modelo
    @EnvironmentObject var cancionesModelData: CancionesModelData
    
    var body: some View {
        NavigationView{
        ZStack{
            VStack{
                Button(action: {
                    self.navigateToCoritario.wrappedValue = false
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
                
                SearchView(searchText: $searchText, isSearching: $isSearching)
                
                ///Lista con filtro de favoritos y barra de busqueda
                List(cancionesModelData.canciones.filter({"\($0)".contains(searchText) || searchText.isEmpty}), id: \.id) { cancion in

                    NavigationLink(
                    destination: PDF(cancion: cancion, navigateToPdf: self.$navigateToPdf)){
                    
                            RowView(cancion: cancion)
                    }
                }// --> List
            }// --> VStack potoca
            .navigationBarTitle("Coritario")
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
            
            }// --> ZStack
        }// --> NavigationView
        .navigationBarTitle("Coritario")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        
    }// --> Body
}

struct SearchView: View {
    
    @Binding var searchText: String
    @Binding var isSearching: Bool
    
    var body: some View {
        HStack{
            HStack{
                TextField("Search here", text: $searchText)
                    .padding(.leading, 24)
            }
            .padding()
            .background(Color(.systemGray5))
            .cornerRadius(6)
            .padding(.horizontal)
            .onTapGesture {
                self.isSearching = true
            }
            .overlay(
                HStack{
                    Image(systemName: "magnifyingglass")
                    Spacer()
                    
                    if isSearching {
                        Button(action: {
                            self.searchText = ""
                        }) {
                            Image(systemName: "xmark.circle.fill")
                                .padding(.vertical)
                        }
                    }
                }
                .padding(.horizontal, 32)
                .foregroundColor(.gray)
            )
                .transition(.move(edge: .trailing))
                .animation(.spring())
            
            if isSearching {
                Button(action: {
                    self.isSearching = false
                    self.searchText = ""
                    
                    ///Para ocultar el teclado
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                    
                }, label: {
                    Text("Cancel")
                        .padding(.trailing)
                        .padding(.leading, -12)
                })
                    .transition(.move(edge: .trailing))
                    .animation(.spring())
            }
        }
    }
}

/*
struct Coritario_Previews: PreviewProvider {
    static var previews: some View {
        Coritario(navigateToCoritario: $navigateToCoritario).environmentObject(CancionesModelData())
    }
}
*/
