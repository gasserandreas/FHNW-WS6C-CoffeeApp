//
//  Coffee.swift
//  FHNW-WS6C-CoffeeApp
//
//  Created by Andreas Gasser on 27.02.17.
//  Copyright © 2017 FHNW. All rights reserved.
//

import Foundation

class User: NSObject {
    let id: Int
    let name: String
    let firstname: String
    let favouriteCoffee: CoffeeType
    var coffees: Dictionary<String, CoffeeType> = Dictionary()
    
    init(id: Int, name: String, firstname: String, favouriteCoffee: CoffeeType) {
        self.id = id
        self.name = name
        self.firstname = firstname
        self.favouriteCoffee = favouriteCoffee
    }
    
    init(id: Int, name: String, firstname: String, favouriteCoffee: CoffeeType, coffees: Dictionary<String, CoffeeType>) {
        self.id = id
        self.name = name
        self.firstname = firstname
        self.favouriteCoffee = favouriteCoffee
        self.coffees = coffees
    }
}
