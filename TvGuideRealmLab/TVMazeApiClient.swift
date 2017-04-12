//
//  TVMazeApiClient.swift
//  TvGuideRealmLab
//
//  Created by Johann Kerr on 4/11/17.
//  Copyright © 2017 Johann Kerr. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class TVMazeApiClient {
    class func getShows(completion: @escaping (JSON) -> ()) {
        Alamofire.request("http://api.tvmaze.com/shows").responseData { (response) in
            if let data = response.data {
                let json = JSON(data: data)
                
                completion(json)
            }
        }
    }
    
    
    class func getEpisodes(forShow showId: Int, completion: @escaping (JSON) -> ()) {
        Alamofire.request("http://api.tvmaze.com/shows/\(showId)/episodes").responseData { (response) in
            if let data = response.data {
                let json = JSON(data: data)
                completion(json)
            }
        }
    }
}
