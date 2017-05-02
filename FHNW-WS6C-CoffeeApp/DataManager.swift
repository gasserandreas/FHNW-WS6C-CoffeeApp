//
//  DataManager.swift
//  FHNW-WS6C-CoffeeApp
//
//  Created by Andreas Gasser on 27.02.17.
//  Copyright © 2017 FHNW. All rights reserved.
//

import Foundation
import Realm
import RealmSwift

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
    
    private lazy var communicationManager: CommunicationManager = {
        return CommunicationManager.sharedInstance
    }()
    
    private var fileManager: FileManager {
        get {
            return FileManager.sharedInstance
        }
    }
    
    private var realm: Realm {
        get {
            return try! Realm()
        }
    }
    
    private lazy var notificationCenter: NotificationCenter = {
        return NotificationCenter.default
    }()
    
    private lazy var mainQueue: OperationQueue = {
        return OperationQueue.main
    }()
    
    override init() {
        super.init()
        
        // load data
        loadCoffees()
        loadUsers()
    }
    
    func usersSortedArray() -> [User] {
        return Array(realm.objects(User.self)).sorted(by: { $0.firstname < $1.firstname })
    }
    
    func coffeeTypesSortedArray() -> [CoffeeType] {
        return Array(realm.objects(CoffeeType.self)).sorted(by: { $0.id < $1.id })
    }
    
    func selectedUser() -> User? {
        if let userId = UserDefaults.standard.value(forKey: Consts.UserDefaults.UserId.rawValue) as? String {
            return realm.object(ofType: User.self, forPrimaryKey: userId)
        }
        return nil
    }
        
    func setSelectedUser(user: User) {
        UserDefaults.standard.set(user.id, forKey: Consts.UserDefaults.UserId.rawValue)
    }
    
    // load data
    func loadUsers() {
        communicationManager.getUsers(completionHandler: self.saveUsers)
    }
    
    func loadCoffees() {
        communicationManager.getCoffees(completionHandler: self.saveCoffees)
    }
    
    // data manipulation methods
    func countUpCoffee(coffee: CoffeeType) {
        if let selectedUser = selectedUser() {
            communicationManager.countUpCoffee(completionHandler: self.saveUser, user: selectedUser, coffee: coffee)
        }
    }
    
    func countDownCoffee(coffee: CoffeeType) {
        if let selectedUser = selectedUser() {
            communicationManager.countDownCoffee(completionHandler: self.saveUser, user: selectedUser, coffee: coffee)
        }
    }
    
    private func saveCoffees(coffees: [CoffeeType]) {
        do {
            try realm.write {
                for coffee in coffees {
                    realm.add(coffee, update: true)
                }
            }
            notificationCenter.post(name: Notification.Name(rawValue: Consts.Notification.DataManagerNewCoffeeData.rawValue), object: nil)
        } catch let error {
            fatalError(error.localizedDescription)
        }
    }
    
    private func saveUsers(users: [User]) {
        do {
            try realm.write {
                for user in users {
                    realm.add(user, update: true)
                }
            }
            notificationCenter.post(name: Notification.Name(rawValue: Consts.Notification.DataManagerNewUsersData.rawValue), object: nil)
        } catch let error {
            fatalError(error.localizedDescription)
        }
    }
    
    private func saveUser(user: User, coffee: CoffeeType) {
        do {
            try realm.write {
                realm.add(user, update: true)
            }
            let userInfoArr = ["userId": user.id, "coffeeId": coffee.id]
            notificationCenter.post(name: Notification.Name(rawValue: Consts.Notification.DataManagerNewUserData.rawValue), object: nil, userInfo: userInfoArr)
        } catch let error {
            fatalError(error.localizedDescription)
        }
    }
}
