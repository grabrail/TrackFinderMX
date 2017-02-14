//
//  TrackCell.swift
//  TrackFinderMX
//
//  Created by Jade Reynolds on 14/02/2017.
//  Copyright © 2017 ShutterMX. All rights reserved.
//

import UIKit

class TrackCell: UICollectionViewCell {
    
    @IBOutlet weak var thumbImage: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    
    var track: Tracks!
    
    func configureCell(track: Tracks) {
        self.track = track
        
        nameLbl.text = self.track.name.capitalized
        thumbImage.image = UIImage(named: "\(self.track.trackId)")
        
    }
    
}
