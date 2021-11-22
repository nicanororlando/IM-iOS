//
//  ListView.swift
//  Instituto Misionero
//
//  Created by Nicanor Orlando on 05/11/2021.
//  Copyright © 2021 KnorDev. All rights reserved.
//

import SwiftUI

struct ListView: View {
    
    @State var searchText = ""
    @State var isSearching = false
    
    ///Para acceder a los canciones del modelo
    @EnvironmentObject var cancionesModelData: CancionesModelData
    
    ///Para trabajar con estructuras se utiliza variable que pueda cambiar de estado
    @State private var showFavorites = false
    private var filteredCanciones: [Cancion]{
            
        ///Recorre la lista de programmers
        return cancionesModelData.canciones.filter { cancion in
                
            ///Si no estamos mostrando todos los favoritos se retornara el listado completo de programadores, y si estamos filtrando los por favoritos tendra en cuenta si el programador es favorito o no
            return !showFavorites || cancion.favorite
        }
    }
    
    
    var body: some View {
        
        NavigationView {
            VStack{
                SearchView(searchText: $searchText, isSearching: $isSearching)
                	
                ///Signo $ para acceder al valor del estado de forma mutable
                ///Cuando cambiemos el toggle tambien la variable showFavorites va a cambiar. Por lo cual la variable filtered se vuelve a ejecutar
                Toggle(isOn: $showFavorites) {
                    Text("Mostrar Favoritos")
                }.padding()
                
                ///Lista con filtro de favoritos y barra de busqueda
                List(filteredCanciones.filter({ "\($0)".contains(searchText) || searchText.isEmpty}), id: \.id) { cancion in
            
                    ///A donde queremos navegar, le pasamos a destination una instancia de la vista a la que queremos navegar
                    NavigationLink(destination: PDF(cancion: cancion, favorite:   self.$cancionesModelData.canciones[cancion.id].favorite)) {
                
                        ///Nombre de nuestra fila, pasandole cada uno de nuestros programadores de nuestro array. No hace falta que los definamos de nuestra lista
                        RowView(cancion: cancion)
                    }
                }
            }.navigationBarTitle("Coritario")
        }
    }
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

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView().environmentObject(CancionesModelData())
    }
}
