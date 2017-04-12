//
//  Show.swift
//  TvGuideRealmLab
//
//  Created by Johann Kerr on 4/11/17.
//  Copyright © 2017 Johann Kerr. All rights reserved.
//

import Foundation
import SwiftyJSON


class Show {
    var name: String
    var summary: String
    var imageUrl: String
    var id: Int
    var rating: Double
    
    init() {
        self.name = "Attack on Titans"
        self.summary = "Monsters"
        self.imageUrl = "titan.png"
        self.id = 0
        self.rating = 10.0
    }
   
    
    init(_ dict: JSON) {
        self.name = dict["name"].stringValue
        self.summary = dict["summary"].stringValue
        self.imageUrl = dict["image"]["medium"].stringValue
        self.id = dict["id"].intValue
        self.rating = dict["rating"]["average"].doubleValue
    }
}

