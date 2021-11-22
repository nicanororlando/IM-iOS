//
//  RowView.swift
//  Instituto Misionero
//
//  Created by Nicanor Orlando on 19/10/2021.
//  Copyright © 2021 KnorDev. All rights reserved.
//

import SwiftUI

struct RowView: View {
    
    ///Variable para asignar un objeto de tipo programmer a cada celda
    var cancion: Cancion
    
    var body: some View {
        HStack {
            
            ///Acedemos al ID
            Text("\(cancion.id)")
                .font(.title)
                .padding()
            
            ///Accedemos al texto (Titulo y descripcion) alineacion izquierda
            Text(cancion.name)
                .font(.title)
            
            ///Para empujar el contenido a la izquierda
            Spacer()
            
            ///Agregar favorito
            
            if cancion.favorite{
            Image(systemName: "star.fill")
                .foregroundColor(.yellow)
                
            }
        }
    }
}

struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        
        ///Representacion de la vista
        RowView(cancion:
            Cancion(id: 1,
                       name: "Nicanor",
                       favorite: true))
            .previewLayout(.fixed(width: 400, height: 60))
    }
}
