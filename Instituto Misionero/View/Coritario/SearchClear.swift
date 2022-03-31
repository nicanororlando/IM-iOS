//
//  SearchClear.swift
//  Instituto Misionero
//
//  Created by Daniel Scholtus on 29/03/2022.
//  Copyright © 2022 KnorDev. All rights reserved.
//

import SwiftUI

struct SearchClear: View {
    
    @Binding var text: String
    
    var body: some View {
        
        Button(action: {
            self.text = ""
        }) {
            Image(systemName: "multiply.circle.fill")
                .foregroundColor(.gray)
                .padding(.trailing, 8)
        }
    }
}
