//
//  ShowDetailViewController.swift
//  TvGuideRealmLab
//
//  Created by Johann Kerr on 4/11/17.
//  Copyright © 2017 Johann Kerr. All rights reserved.
//

import UIKit
import RealmSwift
import Realm

class ShowDetailViewController: UIViewController {
    
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var postImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    var show = Show()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }

    
    func setupViews() {
        self.title = show.name
        self.ratingLabel.text = "\(show.rating)"
        self.titleLabel.text = show.name
        if let url = URL(string: show.imageUrl) {
            self.postImageView.kf.setImage(with: url)
        }
    
        
    }
    
    @IBAction func faveBtnPressed(_ sender: Any) {
        let savedShow = SavedShow(show)
        let realm = try! Realm()
        try! realm.write {
            realm.add(savedShow, update: true)
           // realm.add(savedShow)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destVC = segue.destination as! EpisodeViewController
        
        destVC.show = self.show
        
    }
    
    
    
  
}
