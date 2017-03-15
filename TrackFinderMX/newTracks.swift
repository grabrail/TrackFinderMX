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
    let locID: Int!
    let lat: Double!
    let lon: Double!
    let phoneNumber: String!
    let email: String!
    let rating: Double!
    let numrating: Double!
    let totalrating: Double!
    let ref: FIRDatabaseReference?
    

    
    init(name: String, trackId: Int, postcode: String, trackType: String, trackURL: String, locID: Int, lat: Double, lon: Double, phoneNumber: String, email: String, rating: Double, numrating: Double, totalrating: Double) {
        self.name = name
        self.trackId = trackId
        self.ref = nil
        self.postcode = postcode
        self.trackType = trackType
        self.locID = locID
        self.lat = lat
        self.lon = lon
        self.phoneNumber = phoneNumber
        self.email = email
        self.rating = rating
        self.numrating = numrating
        self.totalrating = totalrating
        
    }
    
    init(snapshot: FIRDataSnapshot) {
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
        rating = snapshotValue["rating"]as! Double
        ref = snapshot.ref
        numrating = snapshotValue["numrating"] as! Double
        totalrating = snapshotValue["totalrating"] as! Double
        
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
            "email": email,
            "rating": rating,
            "numrating": numrating,
            "totalrating": totalrating
                ]
    }
    
}
