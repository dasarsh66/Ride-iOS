//
//  DatabaseManager.swift
//  Ride
//
//  Created by student on 10/29/17.
//  Copyright © 2017 student. All rights reserved.
//
import Foundation

let databaseManager:DatabaseManager = DatabaseManager()

class DatabaseManager {
    let APPLICATION_ID = "60DD2F5D-F095-6A6E-FF29-665BC025CE00"
    let API_KEY = "6FF1140D-B1B6-4AFA-FFFC-2329D4FBDF00"
    let SERVER_URL = "https://api.backendless.com"
    let backendless = Backendless.sharedInstance()!
    var dataStoreReg:IDataStore!
    var faultMessage : String
    init()
    {
        faultMessage = ""
        backendless.hostURL = SERVER_URL
        backendless.initApp(APPLICATION_ID, apiKey: API_KEY)
        dataStoreReg = backendless.data.of(Register.ofClass())
    }
    // Returns a user with the given contact - nil if not in table
    func findUser(contact:Int?) -> Bool? {
           if contact == nil {
            return nil
        }
        
        let Contactquery = DataQueryBuilder()
        
        Contactquery!.setWhereClause("Contact LIKE '%\(contact!)%'")
        
        if  dataStoreReg.find(Contactquery) != nil
        {
            return true
        }
        return true// self.dataStoreReg?.find(Contactquery) as? Register
    }
    
    func registerUser(userEmail : String , userPassword : String) -> Bool {
        // creating backendless user object
        var hasRegistered : Bool = false
        let user = BackendlessUser()
        user.setProperty("email", object: userEmail)
        user.password = userPassword as NSString
        
        Types.tryblock({() -> Void in
            print("In true")
            self.backendless.userService.register(user)
            hasRegistered = true
        }, catchblock: {(exception)->Void in
            print(exception)
            self.faultMessage = exception.debugDescription
            hasRegistered = false
        })
        return hasRegistered
    }
    //saves an object to the database
//    func add(reg:Register) -> Void {
//        dataStoreReg.save(reg)
//    }


}
