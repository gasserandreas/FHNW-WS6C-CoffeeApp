//
//  CoffeeType.swift
//  FHNW-WS6C-CoffeeApp
//
//  Created by Andreas Gasser on 27.02.17.
//  Copyright © 2017 FHNW. All rights reserved.
//

import Foundation

class CoffeeType: NSObject {
    let id: Int
    let name: String
    let counter: Int
    
    init(id: Int, name: String, counter: Int) {
        self.id = id
        self.name = name
        self.counter = counter
    }
}
