//
//  TrackCell.swift
//  TrackFinderMX
//
//  Created by Jade Reynolds on 14/02/2017.
//  Copyright © 2017 ShutterMX. All rights reserved.
//

import UIKit
import Cosmos

class TrackCell: UITableViewCell {
    
    
    @IBOutlet weak var ratingView: CosmosView!
    @IBOutlet weak var nameLbl: UILabel!
    
    var track: newTracks!
    
    func configureCell(track: newTracks) {
        nameLbl.text = track.name.capitalized
        ratingView.rating = track.rating
     }
    
    
    
}
