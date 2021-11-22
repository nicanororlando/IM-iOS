//
//  TabBar.swift
//  Instituto Misionero
//
//  Created by Nicanor Orlando on 28/10/2021.
//  Copyright © 2021 KnorDev. All rights reserved.
//

import SwiftUI

struct TabBar: View {
    
    @State var current = "Home"
    
    var body: some View {
        
        ZStack.init(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
            
            TabView(selection: $current){
                Home()
                    .tag("Home")
                ListView()
                    .tag("Coritario")
                Text("Acerca de")
                    .tag("Acerca de")
            }
            
            HStack(spacing: 0){
                TabButton(title: "Home", image: "home",
                    selected: $current)
                Spacer(minLength: 0)
                TabButton(title: "Coritario", image: "messenger", selected: $current)
                Spacer(minLength: 0)
                TabButton(title: "Acerca de", image: "user", selected: $current)
            }
            .padding(.vertical, 12)
            .padding(.horizontal)
            .background(Color.black)
            .clipShape(Capsule())
            .padding(.horizontal,25)
        }
        
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}

