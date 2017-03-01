//
//  TrackCell.swift
//  TrackFinderMX
//
//  Created by Jade Reynolds on 14/02/2017.
//  Copyright © 2017 ShutterMX. All rights reserved.
//

import UIKit

class TrackCell: UITableViewCell {
    
    
    @IBOutlet weak var nameLbl: UILabel!
    
    var track: Tracks!
    
    func configureCell(track: Tracks) {
        nameLbl.text = track.name.capitalized
     }
    
    
    
}
