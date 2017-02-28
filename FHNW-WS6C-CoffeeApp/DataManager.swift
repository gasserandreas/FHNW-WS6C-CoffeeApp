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
    
    // define private properties
    private var usersDict = [String: User]()
    
    fileprivate lazy var configManager: ConfigManager = {
        return ConfigManager.sharedInstance
    }()
    
    // singleton instance
    private static var __once: () = { () -> Void in
        DataManagerStatic.instance = DataManager()
    }()
    
    class var sharedInstance : DataManager {
        _ = DataManager.__once
        return DataManagerStatic.instance!
    }
    
    fileprivate lazy var notificationCenter: NotificationCenter = {
        return NotificationCenter.default
    }()
    
    fileprivate lazy var mainQueue: OperationQueue = {
        return OperationQueue.main
    }()
    
    override init() {
        super.init()
        NSLog("uuii init DataManager")
        
        if configManager.testing {
            // init basic values
            self.usersDict = DataManagerInitializer.initUsers()
            
            // inform observers
            notificationCenter.post(name: Notification.Name(rawValue: HelperConsts.DataManagerNewDataNotification), object: nil)
        }
        
        addObservers()
    }
    
    func addObservers() {
        
        /*
        // reload data model if new file is available
        let observer = notificationCenter.addObserver(forName: NSNotification.Name(rawValue: HelperMethods.newDataFileNotification), object: nil, queue: mainQueue, using: { _ in
            self.loadDataModelDataFromFileSystem()
        })
        
        let observerForRefreshingGPS = notificationCenter.addObserver(forName: NSNotification.Name(rawValue: HelperMethods.newDataModelNotification), object: nil, queue: mainQueue, using: { _ in
            if let location: CLLocation = self.currentLocation {
                self.detectNearestSite(location)
            }
        })
         */
    }
    
    func users() -> Dictionary<String, User> {
        return usersDict;
    }
    
    // return sites in a sorted array, change $0.name > $1.name to $0.name < $1.name to switch rule
    func usersSortedArray() -> Array<User> {
        return HelperMethods.sortUserArray(Array(usersDict.values))
    }
    
}
