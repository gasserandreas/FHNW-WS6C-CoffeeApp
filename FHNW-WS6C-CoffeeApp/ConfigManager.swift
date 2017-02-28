//
//  ConfigManager.swift
//  FHNW-WS6C-CoffeeApp
//
//  Created by Andreas Gasser on 28.02.17.
//  Copyright © 2017 FHNW. All rights reserved.
//

import Foundation

// needed for singleton
struct ConfigManagerStatic {
    static var onceToken: Int = 0
    static var instance: ConfigManager? = nil
}


class ConfigManager: NSObject {
    
    // singleton instance
    private static var __once: () = { () -> Void in
        ConfigManagerStatic.instance = ConfigManager()
    }()
    
    class var sharedInstance : ConfigManager {
        _ = ConfigManager.__once
        return ConfigManagerStatic.instance!
    }
    
    override init() {
        super.init()
        NSLog("uuii init ConfigManager")
    }
    
    // vars
    let testing = true
    
    let testBaseUrl = ""
    let prodBaseUrl = ""
}
