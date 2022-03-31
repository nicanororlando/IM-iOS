//
//  SearchField.swift
//  Instituto Misionero
//
//  Created by Daniel Scholtus on 29/03/2022.
//  Copyright © 2022 KnorDev. All rights reserved.
//

import SwiftUI

struct SearchField: View {
    
    @Binding var text: String
    
    var body: some View {
        TextField("Search ...", text: $text)
            .padding(7)
            .padding(.horizontal, 25)
            .background(Color(.systemGray6))
            .cornerRadius(8)
            .animation(.default)
    }
}
