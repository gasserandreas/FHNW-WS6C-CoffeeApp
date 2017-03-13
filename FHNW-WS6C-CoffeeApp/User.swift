//
//  Coffee.swift
//  FHNW-WS6C-CoffeeApp
//
//  Created by Andreas Gasser on 27.02.17.
//  Copyright © 2017 FHNW. All rights reserved.
//

import Foundation

class User: NSObject {
    let id: String
    let name: String
    let firstname: String
    let imageName: String
    var coffees: Dictionary<String, Int> = Dictionary()
    
    init(id: String, name: String, firstname: String, imageName: String) {
        self.id = id
        self.name = name
        self.firstname = firstname
        self.imageName = imageName
    }
    
    init(id: String, name: String, firstname: String, imageName: String, coffees: Dictionary<String, Int>) {
        self.id = id
        self.name = name
        self.firstname = firstname
        self.imageName = imageName
        self.coffees = coffees
    }
}
