//
//  RealmManager.swift
//  TvGuideRealmLab
//
//  Created by Johann Kerr on 4/12/17.
//  Copyright © 2017 Johann Kerr. All rights reserved.
//

import Foundation
import RealmSwift
import Realm


class RealmManager {
    class func favoriteShow(_ show: Show) {
        let savedShow = SavedShow(show)
        let realm = try! Realm()
        try! realm.write {
            realm.add(savedShow)
        }
    }
    
    class func favoriteEpisode(_ episode: Episode, to show: Show) {
        
        let newEpisode = SavedEpisode(episode)
        let realm = try! Realm()
        if let foundshow = realm.objects(SavedShow).filter("id == \(show.id)").first {
            
            try! realm.write {
                foundshow.episodes.append(newEpisode)
            }
            
        }
        
      
        
        
    }
    
    

}
