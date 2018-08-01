//
//  UserModel.swift
//  Getty
//
//  Created by Han on 31/07/2018.
//  Copyright © 2018 Han. All rights reserved.
//

import UIKit
import SwiftyJSON

class UserModel: NSObject, NSCoding {
    
    var id: String!
    var fullName: String!
    var userName: String!
    var birthday: Date!
    var gender: Int!
    var email: String!
    var phoneNumber: String!
    
    override init() {
        
    }
    
    init(jsonData: [String: Any]){
        
        fullName = jsonData["uid"] as! String
        userName = jsonData["user_name"] as! String
        birthday = jsonData["first_name"] as! Date
        gender = jsonData["last_name"] as! Int
        email = jsonData["email"] as! String
        phoneNumber = jsonData["birth"] as! String
        
    }
    
    func encode(with aCoder: NSCoder) {
        
//        aCoder.encode(fullName, forKey: "uid")
//        aCoder.encode(userName, forKey: "userName")
//        aCoder.encode(firstName, forKey: "firstName")
//        aCoder.encode(lastName, forKey: "lastName")
//        aCoder.encode(email, forKey: "email")
//        aCoder.encode(birthday, forKey: "birthday")
//        aCoder.encode(profileImageUrl, forKey: "profileImageUrl")
//        aCoder.encode(role, forKey: "role")
//        aCoder.encode(token, forKey: "token")
        
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        
        self.init()
        
//        uid = aDecoder.decodeObject(forKey: "uid") as! String
//        userName = aDecoder.decodeObject(forKey: "userName") as! String
//        firstName = aDecoder.decodeObject(forKey: "firstName") as! String
//        lastName = aDecoder.decodeObject(forKey: "lastName") as! String
//        email = aDecoder.decodeObject(forKey: "email") as! String
//        birthday = aDecoder.decodeObject(forKey: "birthday") as! String
//        profileImageUrl = aDecoder.decodeObject(forKey: "profileImageUrl") as! String
//        token = aDecoder.decodeObject(forKey: "token") as! String
//        role = aDecoder.decodeObject(forKey: "role") as! Int
        
    }
}
