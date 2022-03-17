//
//  Adapted.swift
//  Instituto Misionero
//
//  Created by Nicanor Orlando on 16/03/2022.
//  Copyright © 2022 KnorDev. All rights reserved.
//

import SwiftUI

class Adapted: ObservableObject {
    let screenWidth = UIScreen.main.bounds.size.width
    let screenHeight = UIScreen.main.bounds.size.height

    //Funcion para el ancho adaptable
    func adaptedWidth(curWidth: CGFloat) -> CGFloat {
        let percentajeWidth = curWidth / 414
        let adaptedWidth = percentajeWidth * screenWidth
        return adaptedWidth
    }
    //Funcion para la altura adaptable
    func adaptedHeight(curHeight: CGFloat) -> CGFloat {
        let percentajeHeight = curHeight / 896
        let adaptedHeight = percentajeHeight * screenHeight
        return adaptedHeight
    }
}

	
