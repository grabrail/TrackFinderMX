//
//  newTracks.swift
//  TrackFinderMX
//
//  Created by Jade Reynolds on 08/03/2017.
//  Copyright © 2017 ShutterMX. All rights reserved.
//

import Foundation
import FirebaseDatabase
import CoreLocation

class newTracks {
    
    //Declerations
    var locationManager = CLLocationManager()
    let name: String!
    let lat: Double!
    let lon: Double!
    let countryImage: String!
    let link: String!
    let ref: FIRDatabaseReference?
    
    
   
    //Initialize
    init(name: String, lat: Double, lon: Double, countryImage: String, link: String) {
        self.name = name
        self.ref = nil
        self.lat = lat
        self.lon = lon
        self.countryImage = countryImage
        self.link = link
        
     }
    
    //Initialize data from Firebase
    init(snapshot: FIRDataSnapshot) {
        
        let snapshotValue = snapshot.value as! [String: AnyObject]
        name = snapshotValue["name"] as! String
        lat = snapshotValue["lat"]as! Double
        lon = snapshotValue["long"]as! Double
        ref = snapshot.ref
        countryImage = snapshotValue["country"] as! String
        link = snapshotValue["link"] as! String
        
        }
    
    func toAnyObject() -> Any {
        return [
            "name": name,
            "lat": lat,
            "lon": lon,
            "countryImage": countryImage,
            "link": link,
            
        ]
        
     }
    
}
