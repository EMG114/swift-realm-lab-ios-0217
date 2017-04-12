//
//  EpisodeViewController.swift
//  TvGuideRealmLab
//
//  Created by Johann Kerr on 4/11/17.
//  Copyright © 2017 Johann Kerr. All rights reserved.
//

import UIKit
import Realm
import RealmSwift

class EpisodeViewController: UITableViewController {

    
    var show = Show()
    let store = ShowDataStore.shared
    var episodes = [Episode]()
    override func viewDidLoad() {
        super.viewDidLoad()
        store.getEpisodes(forShow: show.id) { (episodes) in
            self.episodes = episodes
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
        }
        

   
    }




    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.episodes.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "episodeCell", for: indexPath) as! EpisodeCell
        cell.delegate = self
        let episode = self.episodes[indexPath.row]
        cell.configureCell(episode)



        return cell
    }
    
    


}


extension EpisodeViewController: SavedEpisodeDelegate {
    func saveEpisode(_ cell: UITableViewCell) {
        print("saving Cell")
        if let indexPath = self.tableView.indexPath(for: cell) {
            
            
            
            
            let episode = self.episodes[indexPath.row]
            let savedEpisode = SavedEpisode(episode)
            let realm = try! Realm()
            if let foundshow = realm.objects(SavedShow.self).filter("id == \(show.id)").first {
                print("Found show\(foundshow)")
                //
                
                
                
                try! realm.write {
                    foundshow.episodes.append(savedEpisode)
                    //realm.add(foundshow, update: true)
                }
                
            } else {
                print("didn't find show")
            }
            
            
            
        }
        

        
        
    }
}
