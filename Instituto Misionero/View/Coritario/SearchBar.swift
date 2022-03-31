//
//  SearchBar.swift
//  ToDoList
//
//  Created by Simon Ng on 15/4/2020.
//  Copyright © 2020 AppCoda. All rights reserved.
//
import SwiftUI

struct SearchBar: View {
    
    @Binding var text: String

    @State private var isEditing = false
        
    var body: some View {
            HStack {
                SearchField(text: $text)
                    .overlay(SearchOverlay(text: $text, isEditing: $isEditing))
                    .padding(.horizontal)
                    .onTapGesture {
                        self.isEditing = true
                    }
                
                if isEditing {
                    SearchCancel(text: $text, isEditing: $isEditing)
                }
            }
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(text: .constant("Search here"))
    }
}
