//
//  ListItem.swift
//  Instituto Misionero
//
//  Created by Daniel Scholtus on 28/03/2022.
//  Copyright © 2022 KnorDev. All rights reserved.
//

import SwiftUI

struct ListItem: View {
    
    var cancion: Cancion
    
    var body: some View {
        NavigationLink (
            destination: ViewerScreen(cancion: cancion)
        ) {
            HStack{
                Text("\(cancion.id)")
                Text(cancion.name)
            }
        }
    }
}
