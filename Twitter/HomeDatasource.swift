//
//  HomeDatasource.swift
//  Twitter
//
//  Created by 杨云淞 on 2017/5/18.
//  Copyright © 2017年 杨云淞. All rights reserved.
//

import LBTAComponents
import TRON
import SwiftyJSON

extension Collection where Iterator.Element == JSON{
    func decode<T: JSONDecodable>() throws -> [T]{
        
        return try map{try T(json: $0)}
    }
}

class HomeDatasouce: Datasource, JSONDecodable {
    
    
    let users: [User]
    
    required init(json: JSON) throws {
        
        guard  let userJsonArray = json["users"].array,
            let tweetsJsonArray = json["tweets"].array else {
            throw NSError(domain: "com.letsbuildthatapp", code: 1, userInfo: [NSLocalizedDescriptionKey: "users not valid in JSON"])
        }
        
//        self.users = userJsonArray.map{User(json: $0)}
//        self.tweets = tweetsJsonArray.map{Tweet(json: $0)}
        
        self.users = try userJsonArray.decode()
        self.tweets = try tweetsJsonArray.decode()
        
    }
    
    let tweets: [Tweet]
        
    override func headerClasses() -> [DatasourceCell.Type]? {
        return [UserHeader.self]
    }
    
    override func footerClasses() -> [DatasourceCell.Type]? {
        return [UserFooter.self]
    }
    
    override func cellClasses() -> [DatasourceCell.Type] {
        return [UserCell.self,TwitterCell.self]
    }
    
    override func item(_ indexPath: IndexPath) -> Any? {
        if indexPath.section == 1 {
            return tweets[indexPath.item]
        }
        return users[indexPath.item]
    }
    
    override func numberOfSections() -> Int {
        return 2
    }
    
    override func numberOfItems(_ section: Int) -> Int {
        
        if section == 1 {
            return tweets.count
        }
        return users.count
    }
}
