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
    
    init(name: String, trackId: Int, postcode: String, trackType: String) {
        
        self._name = name
        self._trackId = trackId
        self._postcode = postcode
        self._trackType = trackType
        
        self.trackURL = "\(jsonURL)"
        
        
    }
    
    
    
//    func downloadtrackDetails(completed: @escaping DownLoadComplete) {
//        Alamofire.request(trackURL).responseJSON { (response) in
//            
//            if let dict = response.result.value as? [Dictionary<String, Any>] {
//                if let postcode = dict[self._trackId]["postcode"]  as? String {
//                    self._postcode = postcode
//                    print(self.trackId)
//                }
//                if let trackType = dict[self._trackId]["type"] as? String {
//                    self._trackType = trackType
//                }
//            }
//            completed()
//        }
//    }
}














