//
//  Tracks.swift
//  TrackFinderMX
//
//  Created by Jade Reynolds on 14/02/2017.
//  Copyright © 2017 ShutterMX. All rights reserved.
//

import Foundation

class Tracks {
    
    private var _name: String!
    private var _trackId: Int!

    
    var name: String {
        return _name
    }
    
    var trackId: Int {
        return _trackId
    }
    
    init(name: String, trackId: Int) {
        self._name = name
        self._trackId = trackId
    }
}
