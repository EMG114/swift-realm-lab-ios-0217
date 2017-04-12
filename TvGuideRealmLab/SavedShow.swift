//
//  SavedShow.swift
//  TvGuideRealmLab
//
//  Created by Johann Kerr on 4/11/17.
//  Copyright © 2017 Johann Kerr. All rights reserved.
//

import Foundation
import RealmSwift
import Realm

protocol ShowProtocol {
    var name: String { get set }
    var summary: String { get set }
    var imageUrl: String { get set }
    var id: Int { get set }
    var rating: Double { get set }
}

class SavedShow: Object, ShowProtocol {
    dynamic var name: String = ""
    dynamic var summary: String = ""
    dynamic var imageUrl: String = ""
    dynamic var id: Int = 0
    dynamic var rating: Double = 0.0
    let episodes = List<SavedEpisode>()
    
    
    
    
    convenience init(name: String, summary: String, imageUrl: String, id: Int, rating: Double) {
        self.init()
        self.name = name
        self.summary = summary
        self.imageUrl = imageUrl
        self.id = id
        self.rating = rating
    }
    
    convenience init(_ show: Show) {
        self.init()
        self.name = show.name
        self.summary = show.summary
        self.imageUrl = show.imageUrl
        self.id = show.id
        self.rating = show.rating
    }
    
    override static func primaryKey() -> String? {
        return "id"
    }
   
}











