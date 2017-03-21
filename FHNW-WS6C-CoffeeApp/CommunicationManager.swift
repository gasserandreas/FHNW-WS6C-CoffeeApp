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
    
    private var fileManager: FileManager {
        get {
            return FileManager.sharedInstance
        }
    }
    
    private var dataManager: DataManager {
        get {
            return DataManager.sharedInstance
        }
    }
    
    fileprivate lazy var notificationCenter: NotificationCenter = {
        return NotificationCenter.default
    }()

    
    override init() {
        super.init()
        getUsers()
        getCoffees()
    }
    
    // public funcs
    func loadUsers() {
        getUsers()
    }
    
    func loadCoffees() {
        getCoffees()
    }
    
    func countUpCoffee(user: User, coffee: CoffeeType) {
        postCountUpCoffee(user: user, coffee: coffee)
    }
    
    func countDownCoffee(user: User, coffee: CoffeeType) {
        postCountDownCoffee(user: user, coffee: coffee)
    }
    
    // private funcs
    private func getUsers() {
        Alamofire.request(HelperMethods.getUserApiEndPointString()).responseData { response in
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
        Alamofire.request(HelperMethods.getCoffeeApiEndPointString()).responseData { response in
            // check if data was received
            if let JSONData = response.result.value {
                // save data localy
                self.fileManager.saveContentToDocumentsDirectory(JSONData, fileName: HelperConsts.coffeeJsonDataPathName)
                
                // inform observers
                self.notificationCenter.post(name: NSNotification.Name(rawValue: HelperConsts.CommunicationManagerNewCoffeeFileNotification), object: nil)
            }
        }
    }
    
    private func postCountUpCoffee(user: User, coffee: CoffeeType) {
        Alamofire.request(HelperMethods.postCountUpCoffee(user: user, coffee: coffee), method: .post, parameters: nil).responseString { response in
            if let _ = response.result.value {
                self.getUsers()
            }
        }
    }
    
    private func postCountDownCoffee(user: User, coffee: CoffeeType) {
        Alamofire.request(HelperMethods.postCountDownCoffee(user: user, coffee: coffee), method: .post, parameters: nil).responseString { response in
            if let _ = response.result.value {
                self.getUsers()
            }
        }
    }
}
