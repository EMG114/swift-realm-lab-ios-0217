//
//  SavedEpisodeViewController.swift
//  TvGuideRealmLab
//
//  Created by Johann Kerr on 4/11/17.
//  Copyright © 2017 Johann Kerr. All rights reserved.
//

import UIKit
import Realm
import RealmSwift

class SavedEpisodeViewController: UITableViewController {

    
    var episodes: Results<SavedEpisode>!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let realm = try! Realm()
        self.episodes = realm.objects(SavedEpisode.self)
        self.tableView.reloadData()
    }



    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.episodes.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "eCell", for: indexPath) as! EpisodeTableViewCell

        let episode = self.episodes[indexPath.row]
        
        cell.episodeLabel.text = episode.name

        if let owner = episode.owner.first {
            cell.showLabel.text = owner.name
            
        }
        
        if let url = URL(string: episode.imageUrl) {
            cell.episodeImageView.kf.setImage(with: url)
        }
        

        return cell
    }


}
