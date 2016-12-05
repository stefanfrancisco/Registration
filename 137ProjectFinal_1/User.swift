//
//  Users.swift
//  137Project_0
//
//  Created by Stefan Francisco on 12/1/16.
//  Copyright © 2016 Stefan Francisco. All rights reserved.
//

import Foundation
import Firebase

struct User {
    let key: String
    let firstName: String
    let lastName: String
    let email: String
    let company: String
    let userName: String
    let passWord: String
    let ref: FIRDatabaseReference
    
    
    init(firstName: String, lastName: String, email: String, userName: String, passWord: String, company: String, key: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.userName = userName
        self.passWord = passWord
        self.company = company
        self.key = key
        self.ref = FIRDatabase.database().reference()
    }
    
    init(snapshot: FIRDataSnapshot) {
        key = snapshot.key
        let snapshotValue = snapshot.value as! [String: AnyObject]
        firstName = snapshotValue["firstName"] as! String
        lastName = snapshotValue["lastName"] as! String
        email = snapshotValue["email"] as! String
        company = snapshotValue["company"] as! String
        userName = snapshotValue["userName"] as! String
        passWord = snapshotValue["passWord"] as! String
        ref = snapshot.ref
    }
    
    func toAnyObject() -> Any {
        return [
            "firstName": firstName,
            "lastName": lastName,
            "email": email,
            "userName" : userName,
            "passWord" : passWord
            
        ]
    }
    
    
    
}
