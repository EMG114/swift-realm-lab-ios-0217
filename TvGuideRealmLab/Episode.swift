//
//  Episode.swift
//  TvGuideRealmLab
//
//  Created by Johann Kerr on 4/11/17.
//  Copyright © 2017 Johann Kerr. All rights reserved.
//

import Foundation
import SwiftyJSON

class Episode {
    var name: String
    var info: String
    var imageUrl: String
    
    init(_ dict: JSON) {
        self.name = dict["name"].stringValue
        self.imageUrl = dict["image"]["medium"].stringValue
        let season = dict["season"].intValue
        let epiNum = dict["number"].intValue
        self.info = "S\(season) E\(epiNum)"
    }
    
    init() {
        self.name = "Attack of the clones"
        self.info = "S1 E2"
        self.imageUrl = "clones.png"
    }
    
    
    
    
    
}
