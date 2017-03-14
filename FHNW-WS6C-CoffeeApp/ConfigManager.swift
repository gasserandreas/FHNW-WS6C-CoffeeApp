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
    
    private let testServerUrl = "http://localhost:3001/"
    private let prodServerUrl = "http://localhost:3001/"
    
    private let apiVersion = "V1/"
    private let apiBase = "api/"
    
    private let userEndPoint = "users/"
    private let imagesEndPoint = "images/"
    private let coffeeEndPoint = "coffees/"
    
    // public funcs
    func getUserApiEndPointString() -> String {
        return "\(getApiUrlString())\(userEndPoint)"
    }
    
    func getCoffeeApiEndPointString() -> String {
        return "\(getApiUrlString())\(coffeeEndPoint)"
    }
    
    func getImageEndPointString() -> String {
        return "\(getServerUrl())\(imagesEndPoint)"
    }

    
    // private funcs
    private func getServerUrl() -> String {
        return testing ? testServerUrl : prodServerUrl
    }
    
    private func getApiUrlString() -> String {
        let url = "\(getServerUrl())\(apiBase)\(apiVersion)"
        return url
    }
}
