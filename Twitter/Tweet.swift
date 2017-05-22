//
//  Tweet.swift
//  Twitter
//
//  Created by 杨云淞 on 2017/5/21.
//  Copyright © 2017年 杨云淞. All rights reserved.
//

import Foundation
import SwiftyJSON
import TRON

struct Tweet: JSONDecodable {
    let user: User
    let message: String
    
    init(json: JSON) {
        self.user = User(json: json)
        self.message = json["message"].stringValue
    }
}
