//
//  addTrack.swift
//  TrackFinderMX
//
//  Created by Jade Reynolds on 29/03/2017.
//  Copyright © 2017 ShutterMX. All rights reserved.
//

import Foundation
import FirebaseDatabase


struct addTrack {
    
    //Declerations
    
    let name: String!
    let postcode: String!
    let country: String!
    let ref: FIRDatabaseReference?
    
    
    
    //Initialize
    init(name: String, country: String, postcode: String) {
        self.name = name
        self.country = country
        self.postcode = postcode
        self.ref = nil
    }
    
    //Initialize data from Firebase
    init(snapshot: FIRDataSnapshot) {
        
        let snapshotValue = snapshot.value as! [String: AnyObject]
        name = snapshotValue["name"] as! String
        country = snapshotValue["country"]as! String
        postcode = snapshotValue["postcode"]as! String
        ref = snapshot.ref
       
    }
    
    func toAnyObject() -> Any {
        return [
            "name": name,
            "country": country,
            "postcode": postcode,
            ]
        
    }
    
}
