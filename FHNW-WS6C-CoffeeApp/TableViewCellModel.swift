//
//  UITableViewCellModel.swift
//  FHNW-WS6C-CoffeeApp
//
//  Created by Andreas Gasser on 07.04.17.
//  Copyright © 2017 FHNW. All rights reserved.
//

import Foundation

class TableViewCellModel {
    var data: Any?
    var animate: Bool = false
    
    init(data: Any, animate: Bool) {
        self.data = data
        self.animate = animate
    }
}
