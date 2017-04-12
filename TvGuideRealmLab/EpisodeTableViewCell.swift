//
//  EpisodeTableViewCell.swift
//  TvGuideRealmLab
//
//  Created by Johann Kerr on 4/12/17.
//  Copyright © 2017 Johann Kerr. All rights reserved.
//

import UIKit

class EpisodeTableViewCell: UITableViewCell {
    @IBOutlet weak var episodeImageView: UIImageView!

    @IBOutlet weak var episodeLabel: UILabel!
    
    @IBOutlet weak var showLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
