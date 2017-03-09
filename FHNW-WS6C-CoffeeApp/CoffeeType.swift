//
//  CoffeeType.swift
//  FHNW-WS6C-CoffeeApp
//
//  Created by Andreas Gasser on 27.02.17.
//  Copyright © 2017 FHNW. All rights reserved.
//

import Foundation

class CoffeeType: NSObject {
    let id: String
    let name: String
    let color: String
    
    init(id: String, name: String, color: String) {
        self.id = id
        self.name = name
        self.color = color
    }
}
