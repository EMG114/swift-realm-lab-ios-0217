//
//  SavedViewController.swift
//  TvGuideRealmLab
//
//  Created by Johann Kerr on 4/11/17.
//  Copyright © 2017 Johann Kerr. All rights reserved.
//

import UIKit
import Realm
import RealmSwift

class SavedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let realm = try! Realm()
        let shows = realm.objects(SavedShow.self)
        let episodes = realm.objects(SavedEpisode.self)
                
    }

   

}
