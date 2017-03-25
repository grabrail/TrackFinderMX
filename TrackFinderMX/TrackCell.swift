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
    
    @IBOutlet weak var goRacebtn: UIButton!
    @IBOutlet weak var countryImage: UIImageView!
    @IBOutlet weak var buttonClick: UIButton!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var milesLabel: UILabel!
    
    var track: newTracks!
    var completion: ((Void) -> Void?)?
    var completion1: ((Void) -> Void?)?
    var locationManager = CLLocationManager()
    
    override func awakeFromNib() {
        buttonClick.addTarget(self, action: #selector(didTappedButton), for: .touchUpInside)
        
            }
    
    func didTappedButton() {
        if let completion = completion {
            completion()
        }
    }
    
    func configureCell(track: newTracks) {
        nameLbl.text = track.name.capitalized
        countryImage.image = UIImage(named: track.countryImage)
        milesLabel.text = "\(track.distance)mi"
        
    }
    
    
}


    
    

    

