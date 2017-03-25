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

struct newTracks {
    
    //Declerations
    var locationManager = CLLocationManager()
    let name: String!
    let lat: Double!
    let lon: Double!
    let countryImage: String!
    let link: String!
    let ref: FIRDatabaseReference?
    let distance: Double
    
   
    //Initialize
    init(name: String, trackId: Int, postcode: String, trackType: String, trackURL: String, locID: Int, lat: Double, lon: Double, phoneNumber: String, email: String, rating: Double, numrating: Double, totalrating: Double, countryImage: String, link: String, distance: Double) {
        self.name = name
        self.ref = nil
        self.lat = lat
        self.lon = lon
        self.countryImage = countryImage
        self.link = link
        self.distance = distance
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
        
        let currentLat = self.locationManager.location!.coordinate.latitude
        let currentLon = self.locationManager.location!.coordinate.longitude
        let myLocation = CLLocation(latitude: currentLat, longitude: currentLon)
        let loc = CLLocation(latitude: lat, longitude: lon)
        let distanceInMiles = round(myLocation.distance(from: loc) / 1609.34)
        
        distance = distanceInMiles
    }
    
    func toAnyObject() -> Any {
        return [
            "name": name,
            "lat": lat,
            "lon": lon,
            "countryImage": countryImage,
            "link": link,
            "distance": distance
        ]
        
     }
    
}
