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
    
    @EnvironmentObject var cancionesModelData: CancionesModelData
    @ObservedObject var adapted = Adapted()
    
    var body: some View {
        NavigationView{
        ZStack{
            VStack{
                Spacer()
                
                SearchView(searchText: $searchText, isSearching: $isSearching)
            List(cancionesModelData.canciones.filter({"\($0)".contains(searchText) || searchText.isEmpty}), id: \.id) { cancion in

                    NavigationLink(
                        destination: PDF(cancion: cancion, navigateToPdf: self.$navigateToPdf)){
                                RowView(cancion: cancion)
                    }// --> Nav Link
                }// --> List
            }// --> VStack potoca
            .navigationBarBackButtonHidden(true)
            .navigationBarTitle("Coritario", displayMode: .inline)
            .navigationBarHidden(false)
            .navigationBarItems(leading:
                Button(action: {
                    self.navigateToCoritario.wrappedValue = false
                }) {
                    HStack{
                        Image("icons8-atras")
                            .resizable()
                            .frame(width: adapted.adaptedWidth(curWidth: 31), height: adapted.adaptedWidth(curWidth: 31), alignment: .center)
                        Text("im")
                            .font(.system(size: adapted.adaptedWidth(curWidth: 18)))
                            .offset(x: -(adapted.adaptedWidth(curWidth: 15)))
                        Spacer()
                    }
                    .frame(width: adapted.adaptedWidth(curWidth: 400), height: adapted.adaptedHeight(curHeight: 60), alignment: .center)
                    .foregroundColor(.black)
                }.padding(4)// --> Back button
            )// --> Nav items
            
            }// --> ZStack
        }// --> NavigationView
        .navigationBarTitle("Coritario")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        
    }// --> Body
}// --> View

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
