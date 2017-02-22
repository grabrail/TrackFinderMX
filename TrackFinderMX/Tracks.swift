//
//  Tracks.swift
//  TrackFinderMX
//
//  Created by Jade Reynolds on 14/02/2017.
//  Copyright © 2017 ShutterMX. All rights reserved.
//

import Foundation
import Alamofire


class Tracks {
    
    private var _name: String!
    private var _trackId: Int!
    private var _postcode: String!
    private var _trackType: String!
    private var trackURL: String!
    private var _locId: String!
    private var _lat: Double!
    private var _lon: Double!
    
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
    
    init(name: String, trackId: Int, postcode: String, trackType: String, locId: String, lon: Double, lat: Double) {
        
        self._name = name
        self._trackId = trackId
        self._postcode = postcode
        self._trackType = trackType
        self._locId = locId
        self._lat = lat
        self._lon = lon
        
        self.trackURL = "\(jsonURL)"
        print(self.lon)
        print(self.lat)
        
        
    }
}














