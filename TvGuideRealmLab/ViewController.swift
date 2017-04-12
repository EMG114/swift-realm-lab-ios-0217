//
//  ViewController.swift
//  TvGuideRealmLab
//
//  Created by Johann Kerr on 4/11/17.
//  Copyright © 2017 Johann Kerr. All rights reserved.
//

import UIKit
import Kingfisher

class ViewController: UICollectionViewController {
    
    let store = ShowDataStore.shared
    var shows = [Show]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        store.getShows {
            self.shows = self.store.shows
            DispatchQueue.main.async {
                self.collectionView?.reloadData()
            }
            
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.shows.count
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "showCell", for: indexPath) as! ShowViewCell
        let show = shows[indexPath.item]
        
        if let url = URL(string: show.imageUrl) {
            cell.showImage.kf.setImage(with: url)
        }
        
        
        return cell
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let destVC = segue.destination as! ShowDetailViewController
        if let indexPath = self.collectionView?.indexPathsForSelectedItems?.first {
            let show = self.shows[indexPath.item]
            destVC.show = show
        }
        
        
    }
    
    
}

