//
//  EpisodeListTableViewController.swift
//  TvGuideRealmLab
//
//  Created by Johann Kerr on 4/12/17.
//  Copyright © 2017 Johann Kerr. All rights reserved.
//

import UIKit
import Realm
import RealmSwift

class EpisodeListTableViewController: UITableViewController {

    var episodes = List<SavedEpisode>()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

 

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
        return episodes.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "episodeListCell", for: indexPath)

        let episode = episodes[indexPath.row]
        cell.textLabel?.text = episode.name

        return cell
    }
    

  
}
