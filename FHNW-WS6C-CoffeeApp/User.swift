//
//  Coffee.swift
//  FHNW-WS6C-CoffeeApp
//
//  Created by Andreas Gasser on 27.02.17.
//  Copyright © 2017 FHNW. All rights reserved.
//

import Foundation

import Realm
import RealmSwift
import ObjectMapper
import AlamofireObjectMapper

class User: Object, Mappable {
    dynamic var id: String = ""
    dynamic var name: String = ""
    dynamic var firstname: String = ""
    dynamic var imageName: String = ""
    var coffees = List<CoffeeObject>()
  
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        id          <- map["id"]
        name        <- map["name"]
        firstname   <- map["firstname"]
        imageName   <- map["imageName"]
        coffees     <- map["coffees"]
    }
    
    override class func primaryKey() -> String? {
        return "id"
    }
    
    func sortedCoffeesArray() -> [CoffeeObject] {
        return Array(self.coffees).sorted(by: { $0.value < $1.value })
    }
}
