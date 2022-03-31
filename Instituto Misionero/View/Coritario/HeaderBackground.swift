//
//  HeaderBackground.swift
//  Instituto Misionero
//
//  Created by Daniel Scholtus on 31/03/2022.
//  Copyright © 2022 KnorDev. All rights reserved.
//

import SwiftUI

struct HeaderBackground: View {
    
    var body: some View {
        Rectangle()
            .foregroundColor(Color(red: 0.7, green: 0, blue: 0))
            .edgesIgnoringSafeArea(.top)
            .frame(height: 0)
    }
}
