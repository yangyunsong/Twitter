//
//  Service.swift
//  Twitter
//
//  Created by 杨云淞 on 2017/5/22.
//  Copyright © 2017年 杨云淞. All rights reserved.
//

import Foundation
import TRON
import SwiftyJSON

struct Service {
    
    let tron = TRON(baseURL: "https://api.letsbuildthatapp.com")
    
    static let sharedInstance = Service()
    
    func fetchHomeFeed(completion: @escaping (HomeDatasouce?, Error?) -> ()) {
        
        // start our json fetch
        let request: APIRequest<HomeDatasouce , JSONError> = tron.request("/twitter/home")
        
        request.perform(withSuccess: { (homedatasource) in
            
            completion(homedatasource,nil)
            
        }) { (err) in

            print("Failed to fetch json...",err)
            completion(nil,err)

        }
    }
    
    class JSONError: JSONDecodable {
        required init(json: JSON) throws {
            print("JSON ERROR")
        }
    }

}
