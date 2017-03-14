//
//  CommunicationManager.swift
//  FHNW-WS6C-CoffeeApp
//
//  Created by Andreas Gasser on 13.03.17.
//  Copyright © 2017 FHNW. All rights reserved.
//

import Foundation

import Alamofire

// needed for singleton
struct CommunicationManagerStatic {
    static var onceToken: Int = 0
    static var instance: CommunicationManager? = nil
}


class CommunicationManager: NSObject {
    
    // singleton instance
    private static var __once: () = { () -> Void in
        CommunicationManagerStatic.instance = CommunicationManager()
    }()
    
    class var sharedInstance : CommunicationManager {
        _ = CommunicationManager.__once
        return CommunicationManagerStatic.instance!
    }
    
    private var configManager: ConfigManager {
        get {
            return ConfigManager.sharedInstance
        }
    }
    
    private var fileManager: FileManager {
        get {
            return FileManager.sharedInstance
        }
    }
    
    fileprivate lazy var notificationCenter: NotificationCenter = {
        return NotificationCenter.default
    }()

    
    override init() {
        super.init()
        getUsers()
        getCoffees()
        NSLog("uuii init CommunicationManager")
    }
    
    // public funcs
    
    // private funcs
    private func getUsers() {
        Alamofire.request(configManager.getUserApiEndPointString()).responseData { response in
            // check if data was received
            if let JSONData = response.result.value {
                // save data localy
                self.fileManager.saveContentToDocumentsDirectory(JSONData, fileName: HelperConsts.userJsonDataPathName)
                
                // inform observers
                self.notificationCenter.post(name: NSNotification.Name(rawValue: HelperConsts.CommunicationManagerNewUserFileNotification), object: nil)
            }
        }
    }
    
    private func getCoffees() {
        Alamofire.request(configManager.getCoffeeApiEndPointString()).responseData { response in
            // check if data was received
            if let JSONData = response.result.value {
                // save data localy
                self.fileManager.saveContentToDocumentsDirectory(JSONData, fileName: HelperConsts.coffeeJsonDataPathName)
                
                // inform observers
                self.notificationCenter.post(name: NSNotification.Name(rawValue: HelperConsts.CommunicationManagerNewCoffeeFileNotification), object: nil)
            }
        }
    }
    
}
