//
//  Register.swift
//  Ride
//
//  Created by student on 11/2/17.
//  Copyright © 2017 student. All rights reserved.
//

import Foundation

class Register: NSObject {
    var objectId:String?
    var created:NSDate?
    var updated:NSDate?
    var Lastname:String?
    var Firstname: String?
    var email:String?
    var password:String?
    
    override var description: String {
        return "Lastname: \(String(describing: Lastname)), Firstname: \(String(describing: Firstname)), contact: \(String(describing: email)), Password:\(String(describing: password))"
    }
    
    override init(){
        super.init()
    }
    init(Lastname:String?, Firstname:String?, email:String?, password:String?){
        self.Lastname = Lastname
        self.Firstname = Firstname
        self.email = email
        self.password = password
    }
}

