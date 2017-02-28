//
//  DataManagerInitializer.swift
//  FHNW-WS6C-CoffeeApp
//
//  Created by Andreas Gasser on 27.02.17.
//  Copyright © 2017 FHNW. All rights reserved.
//

import Foundation

class DataManagerInitializer: NSObject {
 
    static func initUsers() -> Dictionary<String, User> {
        var users: Dictionary<String, User> = [String: User]()
        
        var coffeeTypes: Dictionary<String, CoffeeType> = [String: CoffeeType]()
        
        let coffeeType1 = CoffeeType.init(id: 1, name: "Arpeccio", counter: 10)
        let coffeeType2 = CoffeeType.init(id: 2, name: "Ristreto", counter: 20)
        let coffeeType3 = CoffeeType.init(id: 3, name: "Darkan", counter: 5)
        
        coffeeTypes.updateValue(coffeeType1, forKey: "\(coffeeType1.id)")
        coffeeTypes.updateValue(coffeeType2, forKey: "\(coffeeType2.id)")
        coffeeTypes.updateValue(coffeeType3, forKey: "\(coffeeType3.id)")
        
        let user1 = User.init(id: 1, name: "Gasser", firstname: "Andreas", favouriteCoffee: coffeeType1, coffees: coffeeTypes)
        let user2 = User.init(id: 2, name: "Lüpold", firstname: "Martin", favouriteCoffee: coffeeType2, coffees: coffeeTypes)
        let user3 = User.init(id: 3, name: "Langhard", firstname: "Matthias", favouriteCoffee: coffeeType3, coffees: coffeeTypes)
        let user4 = User.init(id: 4, name: "Koch", firstname: "Remo", favouriteCoffee: coffeeType1, coffees: coffeeTypes)
        
        users.updateValue(user1, forKey: "\(user1.id)")
        users.updateValue(user1, forKey: "\(user2.id)")
        users.updateValue(user1, forKey: "\(user3.id)")
        users.updateValue(user1, forKey: "\(user4.id)")
        
        return users
    }
}
