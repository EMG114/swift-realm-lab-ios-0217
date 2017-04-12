//
//  EpisodeListTableViewController.swift
//  TvGuideRealmLab
//
//  Created by Johann Kerr on 4/12/17.
//  Copyright © 2017 Johann Kerr. All rights reserved.
//

import UIKit


class EpisodeListTableViewController: UITableViewController {


    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

 

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
        return 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "episodeListCell", for: indexPath)

        cell.textLabel?.text = ""

        return cell
    }
    

  
}
