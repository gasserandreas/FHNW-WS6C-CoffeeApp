//
//  CommunicationManager.swift
//  FHNW-WS6C-CoffeeApp
//
//  Created by Andreas Gasser on 13.03.17.
//  Copyright © 2017 FHNW. All rights reserved.
//

import Foundation

import Alamofire
import ObjectMapper
import AlamofireObjectMapper

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
        //getUsers()
    }
    
    // public funcs
    func loadUsers() {
        //getUsers()
    }
    
    func loadCoffees() {
        
    }
    
    func countUpCoffee(user: User, coffee: CoffeeType) {
        postCountUpCoffee(user: user, coffee: coffee)
    }
    
    func countDownCoffee(user: User, coffee: CoffeeType) {
        postCountDownCoffee(user: user, coffee: coffee)
    }
    
    func getUsers(completionHandler:@escaping ([User]) -> ()) {
        Alamofire.request(HelperMethods.getUserApiEndPointString())
            .responseArray{ (response: DataResponse<[User]>) in
                if let userResponse = response.result.value {
                    completionHandler(userResponse)
                }
        }
    }
    
    func getCoffees(completionHandler:@escaping ([CoffeeType]) -> ()) {
        Alamofire.request(HelperMethods.getCoffeeApiEndPointString())
            .responseArray{ (response: DataResponse<[CoffeeType]>) in
                if let coffeeResponse = response.result.value {
                    completionHandler(coffeeResponse)
                }
        }
    }
    
    private func postCountUpCoffee(user: User, coffee: CoffeeType) {
        Alamofire.request(HelperMethods.postCountUpCoffee(user: user, coffee: coffee), method: .post, parameters: nil).responseString { response in
            if let _ = response.result.value {
                //self.getUsers()
            }
        }
    }
    
    private func postCountDownCoffee(user: User, coffee: CoffeeType) {
        Alamofire.request(HelperMethods.postCountDownCoffee(user: user, coffee: coffee), method: .post, parameters: nil).responseString { response in
            if let _ = response.result.value {
                //self.getUsers()
            }
        }
    }
}
