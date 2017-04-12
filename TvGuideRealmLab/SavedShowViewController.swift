//
//  SavedShowViewController.swift
//  TvGuideRealmLab
//
//  Created by Johann Kerr on 4/11/17.
//  Copyright © 2017 Johann Kerr. All rights reserved.
//

import UIKit
import Realm
import RealmSwift

class SavedShowViewController: UITableViewController {
    
    
    var shows: Results<SavedShow>!

    override func viewDidLoad() {
        super.viewDidLoad()
        
      
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let realm = try! Realm()
        shows = realm.objects(SavedShow.self)
        self.tableView.reloadData()

    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return shows.count
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destVC = segue.destination as! EpisodeListTableViewController
        
        if let indexPath = self.tableView.indexPathForSelectedRow {
            let show = self.shows[indexPath.row]
            destVC.episodes = show.episodes
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "sCell", for: indexPath) as! ShowTableViewCell
        
        
        let show = self.shows[indexPath.row]
        if let url = URL(string: show.imageUrl) {
            cell.showImageView.kf.setImage(with: url)
        }
        cell.showLabel.text = show.name
        cell.episodeNumLabel.text = "\(show.episodes.count)"
        
        

        return cell
    }
    

}
