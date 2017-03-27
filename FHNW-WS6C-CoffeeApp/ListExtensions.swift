//
//  ListExtensions.swift
//  FHNW-WS6C-CoffeeApp
//
//  Created by Andreas Gasser on 27.03.17.
//  Copyright © 2017 FHNW. All rights reserved.
//

// Author: Colin Basnett - http://stackoverflow.com/users/2209008/colin-basnett
// Got that snipped from: http://stackoverflow.com/questions/33804181/alamofire-objectmapper-realm-nested-objects

import Foundation
import ObjectMapper
import RealmSwift

/// Maps object of Realm's List type
func <- <T: Mappable>(left: List<T>, right: Map)
{
    var array: [T]?
    
    if right.mappingType == .toJSON {
        array = Array(left)
    }
    
    array <- right
    
    if right.mappingType == .fromJSON {
        if let theArray = array {
            left.append(objectsIn: theArray)
        }
    }
}
