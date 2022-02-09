//
//  TabButton.swift
//  Instituto Misionero
//
//  Created by Nicanor Orlando on 28/10/2021.
//  Copyright © 2021 KnorDev. All rights reserved.
//

import SwiftUI

struct TabButton: View {
    
    var title: String
    var image: String
    
    @Binding var selected: String
    
    var body: some View {
        Button(action: {
            withAnimation(.spring()){self.selected = self.title}
        }) {
            HStack(spacing: 10){
                Image(systemName: image)
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 25, height: 25)
                    .foregroundColor(.black)
                
                if(selected == title){
                    Text(title)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                }
            }
            .padding(.vertical,10)
            .padding(.horizontal)
            .background(Color.white.opacity(selected == title ? 0.08: 0))
            .clipShape(Capsule())
        }
    }
}

