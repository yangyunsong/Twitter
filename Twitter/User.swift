//
//  User.swift
//  Twitter
//
//  Created by 杨云淞 on 2017/5/19.
//  Copyright © 2017年 杨云淞. All rights reserved.
//

import UIKit
import SwiftyJSON
import TRON

struct User : JSONDecodable{
    let name: String
    let username: String
    let bioText: String
    let profileImageUrl: String
    
    init(json: JSON) {
        self.name = json["name"].stringValue
        self.username = json["username"].stringValue
        self.bioText = json["bio"].stringValue
        self.profileImageUrl = json["profileImageUrl"].stringValue        
    }
}
