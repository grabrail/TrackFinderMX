//
//  Tracks.swift
//  TrackFinderMX
//
//  Created by Jade Reynolds on 14/02/2017.
//  Copyright © 2017 ShutterMX. All rights reserved.
//

import UIKit
import Foundation
import Alamofire


class Tracks {
    
    var _name: String!
    var _trackId: Int!
    var _postcode: String!
    var _trackType: String!
    var trackURL: String!
    var _locId: String!
    var _lat: Double!
    var _lon: Double!
    var _phoneNumber: String!
    var _email: String!
    
    var phoneNumber: String {
        if _phoneNumber == nil {
            _phoneNumber = ""
        }
        return _phoneNumber
    }
    
    var  email: String {
        if _email == nil {
            _email = ""
        }
        return _email
    }
    
    var lat: Double {
        if _lat == nil {
            _lat = 0.0
        }
        return _lat
    }
    
    var lon: Double {
        if _lon == nil {
            _lon = 0.0
        }
        return _lon
    }
    
    
    var locID: String {
        if _locId == nil {
            _locId = ""
        }
        return _locId
    }
    
    var trackType: String {
        if _trackType == nil {
            _trackType = ""
        }
        return _trackType
    }
    
    var postcode: String {
        if _postcode == nil {
            _postcode = ""
        }
        return _postcode
    }
    
    
    var name: String {
        if _name == nil {
            _name = ""
        }
        return _name
    }
    
    var trackId: Int {
        return _trackId
    }
    
    init(name: String, trackId: Int, postcode: String, trackType: String, locId: String, lon: Double, lat: Double, phoneNumber: String, email: String) {
        
        self._name = name
        self._trackId = trackId
        self._postcode = postcode
        self._trackType = trackType
        self._locId = locId
        self._lat = lat
        self._lon = lon
        self._email = email
        self._phoneNumber = phoneNumber
        
        self.trackURL = "\(jsonURL)"
       }
}














