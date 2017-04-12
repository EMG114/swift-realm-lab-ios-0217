//
//  EpisodeCell.swift
//  TvGuideRealmLab
//
//  Created by Johann Kerr on 4/11/17.
//  Copyright © 2017 Johann Kerr. All rights reserved.
//

import UIKit
import Kingfisher

protocol SavedEpisodeDelegate: class {
    func saveEpisode(_ cell: UITableViewCell)
}

class EpisodeCell: UITableViewCell {
    
    
    weak var delegate: SavedEpisodeDelegate?
    
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var episodeImageView: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    func configureCell(_ episode: Episode) {
        self.infoLabel.text = episode.info
        self.nameLabel.text = episode.name
        if let url = URL(string: episode.imageUrl) {
            self.episodeImageView.kf.setImage(with: url)
        } else {
            
        }
    
    }
    
    
    override func prepareForReuse() {
        self.episodeImageView.image = nil
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func faveBtnPressed(_ sender: Any) {
        delegate?.saveEpisode(self)
    }
    

}
