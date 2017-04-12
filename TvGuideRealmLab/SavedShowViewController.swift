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
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
      
    }
    
    override func viewWillAppear(_ animated: Bool) {
        

    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 0
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "sCell", for: indexPath) as! ShowTableViewCell
    
        return cell
    }
    

}
