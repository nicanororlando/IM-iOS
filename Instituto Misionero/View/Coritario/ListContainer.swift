//
//  ListContainer.swift
//  Instituto Misionero
//
//  Created by Daniel Scholtus on 28/03/2022.
//  Copyright © 2022 KnorDev. All rights reserved.
//

import SwiftUI

struct ListContainer: View {
    
    @Binding var searchText: String
    
    var body: some View {
        
        List (
            CancionesModelData().canciones.filter({ searchText.isEmpty ? true : "\($0.id)".contains(searchText) || $0.name.contains(searchText)}), id: \.id
        ) {
            cancion in ListItem(cancion: cancion)
        }
    }
}

