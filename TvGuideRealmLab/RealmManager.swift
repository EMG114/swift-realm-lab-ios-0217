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

class Task: Object {
    dynamic var content: String = ""
    
    convenience init(_ content: String) {
        self.init()
        self.content = content
    }
}





class RealmManager {
    
    class func savePet() {
        let task = Task("Wash Dishes")
        let realm = try! Realm()
        try! realm.write {
            realm.add(task)
        }
    }
    
    
    class func getPets() {
        
        
    }
    
    
    
    
    class func favoriteShow(_ show: Show) {
        
    }
    
    class func favoriteEpisode(_ episode: Episode, to show: Show) {
        
    }
    
    

}
