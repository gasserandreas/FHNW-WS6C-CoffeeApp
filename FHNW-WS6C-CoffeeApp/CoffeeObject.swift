//
//  CoffeeObject.swift
//  FHNW-WS6C-CoffeeApp
//
//  Created by Andreas Gasser on 25.03.17.
//  Copyright © 2017 FHNW. All rights reserved.
//

import Foundation

import Realm
import RealmSwift
import ObjectMapper
import AlamofireObjectMapper

class CoffeeObject: Object, Mappable {
    dynamic var id: String = ""
    dynamic var _id: String = ""
    dynamic var key: String = ""
    dynamic var value: String = ""
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        id      <- map["id"]
        _id      <- map["_id"]
        key      <- map["key"]
        value    <- map["value"]
    }
    
    override class func primaryKey() -> String? {
        return "id"
    }
    
}
