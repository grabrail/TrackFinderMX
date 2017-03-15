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


class TrackCell: UITableViewCell {
    
    @IBOutlet weak var ratingView: CosmosView!
    @IBOutlet weak var nameLbl: UILabel!
    
    @IBOutlet weak var locateBtn: UIButton!
    
    var track: newTracks!
    var tapAction: ((UITableViewCell) -> Void)?
    
    func configureCell(track: newTracks) {
        nameLbl.text = track.name.capitalized
        ratingView.rating = track.rating
              }
    
    func cosmosSetup() {
        
        ratingView.rating = track.rating
        ratingView.didFinishTouchingCosmos = didFinishTouchingCosmos
    }
    
    func didFinishTouchingCosmos(_ rating: Double) {
        var rates: Double
        var numrate: Double
        var totalratings: Double
        var ref: FIRDatabaseReference!
        
        totalratings = track.totalrating + ratingView.rating
        numrate = track.numrating + 1
        ratingView.rating = totalratings / numrate
        
        ref = FIRDatabase.database().reference(withPath: "tracks").child(track.name)
        rates = ratingView.rating
        
        let post = ["rating": rates, "numrating": numrate, "totalrating": totalratings]
        let childUpdates =  post
        
        ref.updateChildValues(childUpdates)
        
    }
    
    

}
