//
//  DataManager.swift
//  FHNW-WS6C-CoffeeApp
//
//  Created by Andreas Gasser on 27.02.17.
//  Copyright © 2017 FHNW. All rights reserved.
//

import Foundation

// needed for singleton
struct DataManagerStatic {
    static var onceToken: Int = 0
    static var instance: DataManager? = nil
}

class DataManager: NSObject {
    
    // singleton instance
    private static var __once: () = { () -> Void in
        DataManagerStatic.instance = DataManager()
    }()
    
    class var sharedInstance : DataManager {
        _ = DataManager.__once
        return DataManagerStatic.instance!
    }
    
    // define private properties
    private var usersDict = [String: User]()
    private var coffeeDict = [String: CoffeeType]()
    
    private lazy var configManager: ConfigManager = {
        return ConfigManager.sharedInstance
    }()
    
    private var fileManager: FileManager {
        get {
            return FileManager.sharedInstance
        }
    }
    
    private var selectedUserId: String?
    
    private lazy var notificationCenter: NotificationCenter = {
        return NotificationCenter.default
    }()
    
    private lazy var mainQueue: OperationQueue = {
        return OperationQueue.main
    }()
    
    override init() {
        super.init()
        NSLog("uuii init DataManager")
        
        // load data
        loadCoffeeDataFromFileSystem()
        
        if configManager.testing {
            // init basic values
            //usersDict = DataManagerInitializer.initUsers()
            coffeeDict = DataManagerInitializer.initCoffees()
            
            // inform observers
            notificationCenter.post(name: Notification.Name(rawValue: HelperConsts.DataManagerNewUserDataNotification), object: nil)
            //notificationCenter.post(name: Notification.Name(rawValue: HelperConsts.DataManagerNewCoffeeDataNotification), object: nil)
        }
        
        addObservers()
    }
    
    func addObservers() {
        
        _ = notificationCenter.addObserver(forName: NSNotification.Name(rawValue: HelperConsts.CommunicationManagerNewUserFileNotification), object: nil, queue: mainQueue, using: { _ in
            self.loadUserDataFromFileSystem()
        })
        
        _ = notificationCenter.addObserver(forName: NSNotification.Name(rawValue: HelperConsts.CommunicationManagerNewCoffeeFileNotification), object: nil, queue: mainQueue, using: { _ in
            self.loadCoffeeDataFromFileSystem()
        })
    }
    
    private func loadCoffeeDataFromFileSystem() {
        var newCoffeeDict: Dictionary<String, CoffeeType>?
        
        if let path = fileManager.loadFileFromDocuments(HelperConsts.coffeeJsonDataPathName) {
            if let coffeeDataDict = fileManager.loadContentOfFileAtPath(path) {
                newCoffeeDict = parseCoffeeData(coffeeData: coffeeDataDict)
            }
        }
        
        if newCoffeeDict != nil {
            coffeeDict = newCoffeeDict!
            notificationCenter.post(name: Notification.Name(rawValue: HelperConsts.DataManagerNewCoffeeDataNotification), object: nil)
        }
    }
    
    private func loadUserDataFromFileSystem() {
        var newUserDict: Dictionary<String, User>?
        
        if let path = fileManager.loadFileFromDocuments(HelperConsts.userJsonDataPathName) {
            if let userDataDict = fileManager.loadContentOfFileAtPath(path) {
                newUserDict = parseUserData(userData: userDataDict)
            }
        }
        
        if newUserDict != nil {
            usersDict = newUserDict!
            notificationCenter.post(name: Notification.Name(rawValue: HelperConsts.DataManagerNewUserDataNotification), object: nil)
        }
    }
    
    // private parse methods
    private func parseCoffeeData(coffeeData: [Any]) -> Dictionary<String, CoffeeType>? {
        var newCoffeeDict: Dictionary<String, CoffeeType>? = [String: CoffeeType]()
        
        coffeeData.forEach { itemO in
            if let item = itemO as? Dictionary<String, AnyObject> {
                let id: String? = item["coffee_id"] as? String
                let color: String? = item["color"] as? String
                let name: String? = item["name"] as? String
                
                // check not null
                if id == nil
                    || color == nil
                    || name == nil {
                    NSLog("could not parse coffee type object")
                } else {
                    let coffee = CoffeeType.init(id: id!, name: name!, color: color!)
                    newCoffeeDict!.updateValue(coffee, forKey: id!)
                }
            }
            
        }
        
        return newCoffeeDict
    }
    
    private func parseUserData(userData: [Any]) -> Dictionary<String, User>? {
        var newUserDict: Dictionary<String, User>? = [String: User]()
        
        userData.forEach { itemO in
            if let item = itemO as? Dictionary<String, AnyObject> {
                let id: String? = item["id"] as? String
                let firstname: String? = item["firstname"] as? String
                let name: String? = item["name"] as? String
                let imageName: String? = item["imageName"] as? String
                let coffeeRawArray: [AnyObject]? = item["coffees"] as? [AnyObject]
                
                // parse array
                var coffees: Dictionary<String, Int> = [String: Int]()
                
                coffeeRawArray?.forEach { coffeeItemO in
                    if let coffeeItem = coffeeItemO as? Dictionary<String, AnyObject> {
                        let coffeeId: String? = coffeeItem["key"] as? String
                        let value: String? = coffeeItem["value"] as? String
                        
                        if (coffeeId == nil || value == nil) {
                            NSLog("could not parse coffee type object")
                        } else {
                            coffees.updateValue(Int(value!)!, forKey: coffeeId!)
                        }
                    }
                }
                
                if id == nil ||
                    firstname == nil ||
                    name == nil ||
                    imageName == nil {
                    NSLog("could not parse user type object")
                } else {
                    let user = User.init(id: id!, name: name!, firstname: firstname!, imageName: imageName!, coffees: coffees)
                    newUserDict!.updateValue(user, forKey: id!)
                }
            }
            
        }
        
        return newUserDict
    }
    
    func users() -> Dictionary<String, User> {
        return usersDict
    }
    
    func coffeeTypes() -> Dictionary<String, CoffeeType> {
        return coffeeDict
    }
    
    func selectedUser() -> User? {
        if let userId = selectedUserId {
            if let user = usersDict[userId] {
                return user
            }
        }
        return usersDict["1"]
        //return nil
    }
    
    func setSelectedUser(user: User) {
        selectedUserId = user.id
    }
    
    // return sites in a sorted array, change $0.name > $1.name to $0.name < $1.name to switch rule
    func usersSortedArray() -> Array<User> {
        return HelperMethods.sortUserArray(Array(usersDict.values))
    }
    
    func coffeeTypesSortedArray() -> Array<CoffeeType> {
        return HelperMethods.sortCoffeeTypeArray(Array(coffeeDict.values))
    }
    
}
