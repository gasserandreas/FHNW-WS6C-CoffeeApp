//
//  DataManagerInitializer.swift
//  FHNW-WS6C-CoffeeApp
//
//  Created by Andreas Gasser on 27.02.17.
//  Copyright © 2017 FHNW. All rights reserved.
//

import Foundation

class DataManagerInitializer: NSObject {
    
    static func initCoffees() -> Dictionary<String, CoffeeType> {
        let coffeeType1 = CoffeeType.init(id: "1", name: "Arpeccio", color: "0x333333")
        let coffeeType2 = CoffeeType.init(id: "2", name: "Ristreto", color: "0x999999")
        let coffeeType3 = CoffeeType.init(id: "3", name: "Darkan", color: "0xaaaaaa")
        
        var coffees: Dictionary<String, CoffeeType> = [String: CoffeeType]()
        coffees.updateValue(coffeeType1, forKey: "1")
        coffees.updateValue(coffeeType2, forKey: "2")
        coffees.updateValue(coffeeType3, forKey: "3")
        
        return coffees
    }
    
    static func initUsers() -> Dictionary<String, User> {
        var users: Dictionary<String, User> = [String: User]()
        
        var coffees: Dictionary<String, Int> = [String: Int]()
        
        let coffeeTypes = DataManagerInitializer.initCoffees()
        let coffeeType1 = coffeeTypes["1"]!
        let coffeeType2 = coffeeTypes["2"]!
        let coffeeType3 = coffeeTypes["3"]!
        
        coffees.updateValue(4, forKey: coffeeType1.id)
        coffees.updateValue(5, forKey: coffeeType2.id)
        coffees.updateValue(6, forKey: coffeeType3.id)
        
        let user1 = User.init(id: "1", name: "Gasser T", firstname: "Andreas", imageName: "person-1", coffees: coffees)
        let user2 = User.init(id: "2", name: "Lüpold T", firstname: "Martin", imageName: "person-1", coffees: coffees)
        let user3 = User.init(id: "3", name: "Langhard T", firstname: "Matthias", imageName: "person-1", coffees: coffees)
        let user4 = User.init(id: "4", name: "Koch T", firstname: "Remo", imageName: "person-1", coffees: coffees)
        
        users.updateValue(user1, forKey: "\(user1.id)")
        users.updateValue(user2, forKey: "\(user2.id)")
        users.updateValue(user3, forKey: "\(user3.id)")
        users.updateValue(user4, forKey: "\(user4.id)")
        
        return users
    }
}
