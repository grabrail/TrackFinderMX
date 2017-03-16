//
//  TrackCell.swift
//  TrackFinderMX
//
//  Created by Jade Reynolds on 14/02/2017.
//  Copyright © 2017 ShutterMX. All rights reserved.
//

import UIKit
import Cosmos
import MapKit
import CoreLocation
import FirebaseDatabase




class TrackCell: UITableViewCell, CLLocationManagerDelegate {
    
    
    @IBOutlet weak var buttonClick: UIButton!
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var milesLabel: UILabel!
    
    var track: newTracks!
    var tapAction: ((UITableViewCell) -> Void)?
    
    func configureCell(track: newTracks) {
        nameLbl.text = track.name.capitalized
        
        
        
     }
  }


    
    

    

