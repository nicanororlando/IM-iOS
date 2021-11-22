//
//  Item.swift
//  Instituto Misionero
//
//  Created by Nicanor Orlando on 07/11/2021.
//  Copyright © 2021 KnorDev. All rights reserved.
//

import Foundation
import SwiftUI

struct Item {
    var image: Image
    var name: String
}

final class ItemsModelData: ObservableObject{
    
@Published var items =
    [
        Item(image: Image(systemName: "star"), name: "item1"),
        Item(image: Image(systemName: "star"), name: "item2"),
        Item(image: Image(systemName: "star"), name: "item3")]
}
