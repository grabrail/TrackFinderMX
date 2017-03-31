//
//  TrackCell.swift
//  TrackFinderMX
//
//  Created by Jade Reynolds on 14/02/2017.
//  Copyright © 2017 ShutterMX. All rights reserved.
//

import UIKit
import CoreLocation

class TrackCell: UITableViewCell, CLLocationManagerDelegate {
    
    @IBOutlet weak var goRacebtn: UIButton!
    @IBOutlet weak var countryImage: UIImageView!
    @IBOutlet weak var buttonClick: UIButton!
    @IBOutlet weak var nameLbl: UILabel!
   
    
    var track: newTracks!
    var completion: ((Void) -> Void?)?
    var completion1: ((Void) -> Void?)?
    var locationManager = CLLocationManager()
    
    override func awakeFromNib() {
        buttonClick.addTarget(self, action: #selector(didTappedButton), for: .touchUpInside)
        goRacebtn.addTarget(self, action: #selector(didTappedGoRaceButton), for: .touchUpInside)
            }
    
    func didTappedButton() {
        if let completion = completion {
            completion()
        }
    }
    
    func didTappedGoRaceButton() {
        if let completion1 = completion1 {
            completion1()
        }
    }
    
    func configureCell(track: newTracks) {
        
        self.nameLbl.text = track.name.capitalized
        self.countryImage.image = UIImage(named: track.countryImage)
        
       }
}


    
    

    

