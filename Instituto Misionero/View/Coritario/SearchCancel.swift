//
//  SearchCancel.swift
//  Instituto Misionero
//
//  Created by Daniel Scholtus on 29/03/2022.
//  Copyright © 2022 KnorDev. All rights reserved.
//

import SwiftUI

struct SearchCancel: View {
    
    @Binding var text: String
    @Binding var isEditing: Bool
    
    var body: some View {
        
        Button(action: {
            self.isEditing = false
            self.text = ""
            
            // Dismiss the keyboard
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        }) {
            Text("Cancel")
        }
        .padding(.trailing)
        .transition(.move(edge: .trailing))
        .animation(.default)
    }
}
