//
//  SearchOverlay.swift
//  Instituto Misionero
//
//  Created by Daniel Scholtus on 29/03/2022.
//  Copyright © 2022 KnorDev. All rights reserved.
//

import SwiftUI

struct SearchOverlay: View {
    
    @Binding var text: String
    @Binding var isEditing: Bool
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 8)
            
            if isEditing {
                Button(action: {
                    self.text = ""
                }) {
                    Image(systemName: "multiply.circle.fill")
                        .foregroundColor(.gray)
                        .padding(.trailing, 8)
                }
            }
        }
    }
}
