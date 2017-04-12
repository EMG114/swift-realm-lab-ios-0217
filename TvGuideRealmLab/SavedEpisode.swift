//
//  SavedEpisode.swift
//  TvGuideRealmLab
//
//  Created by Johann Kerr on 4/11/17.
//  Copyright © 2017 Johann Kerr. All rights reserved.
//

import Foundation
import Realm
import RealmSwift

class SavedEpisode: Object {
    dynamic var name: String = ""
    dynamic var info: String = ""
    dynamic var imageUrl: String = ""
    let owner = LinkingObjects(fromType: SavedShow.self, property: "episodes")
    
    
    convenience init(name: String, info: String, imageUrl: String) {
        self.init()
        self.name = name
        self.info = info
        self.imageUrl = imageUrl
    }
    
    
    convenience init(_ episode: Episode) {
        self.init()
        self.name = episode.name
        self.info = episode.info
        self.imageUrl = episode.imageUrl
    }
    
}
