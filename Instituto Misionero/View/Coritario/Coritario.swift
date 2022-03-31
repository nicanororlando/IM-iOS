//
//  ListView.swift
//  Instituto Misionero
//
//  Created by Nicanor Orlando on 05/11/2021.
//  Copyright © 2021 KnorDev. All rights reserved.
//

import SwiftUI
import Combine

struct Coritario: View {
    
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
            VStack {
                HeaderBackground()
                
                
                SearchBar(text: $searchText)
                
                ListContainer(searchText: $searchText)
            }
            .navigationBarColor(backgroundColor: .clear, titleColor: .white)
            .background(Color(red: 0.7, green: 0, blue: 0))
            .navigationBarTitle("Coritario", displayMode: .inline)
            .navigationBarItems(trailing:
                Button("Hours") {
                    print("Hours tapped!")
                }
                .foregroundColor(.white)
            )
        }
        .background(Color(red: 0.7, green: 0, blue: 0))
    }
}