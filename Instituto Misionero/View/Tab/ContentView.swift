//
//  ContentView.swift
//  Instituto Misionero
//
//  Created by Nicanor Orlando on 28/10/2021.
//  Copyright © 2021 KnorDev. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    init(){
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        TabBar()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
