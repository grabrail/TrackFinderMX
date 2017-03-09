//
//  newTracks.swift
//  TrackFinderMX
//
//  Created by Jade Reynolds on 08/03/2017.
//  Copyright © 2017 ShutterMX. All rights reserved.
//

import Foundation
import FirebaseDatabase

struct newTracks {
    
    
    let name: String!
    let trackId: Int!
    let postcode: String!
    let trackType: String!
    //let trackURL: String!
    let locID: Int!
    let lat: Double!
    let lon: Double!
    let phoneNumber: String!
    let email: String!
    let ref: FIRDatabaseReference?

    
    init(name: String, trackId: Int, postcode: String, trackType: String, trackURL: String, locID: Int, lat: Double, lon: Double, phoneNumber: String, email: String) {
        self.name = name
        self.trackId = trackId
        self.ref = nil
        self.postcode = postcode
        self.trackType = trackType
        //self.trackURL = trackURL
        self.locID = locID
        self.lat = lat
        self.lon = lon
        self.phoneNumber = phoneNumber
        self.email = email
        
    }
    
    init(snapshot: FIRDataSnapshot) {
        //key = snapshot.key
        let snapshotValue = snapshot.value as! [String: AnyObject]
        name = snapshotValue["name"] as! String
        trackId = snapshotValue["id"]as! Int
        postcode = snapshotValue["postcode"]as! String
        trackType = snapshotValue["type"]as! String
        locID = snapshotValue["locID"]as! Int
        lat = snapshotValue["lat"]as! Double
        lon = snapshotValue["long"]as! Double
        phoneNumber = snapshotValue["phone"]as! String
        email = snapshotValue["email"]as! String
        ref = snapshot.ref
    }
    
    func toAnyObject() -> Any {
        return [
            "name": name,
            "trackId": trackId,
            "postcode": postcode,
            "trackType": trackType,
            "locID": locID,
            "lat": lat,
            "lon": lon,
            "phoneNumber": phoneNumber,
            "email": email
        
            
        ]
    }
    
}
