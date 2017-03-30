//
//  mapPoints.swift
//  TrackFinderMX
//
//  Created by Jade Reynolds on 25/03/2017.
//  Copyright © 2017 ShutterMX. All rights reserved.
//

import Foundation
import MapKit
import Contacts


class mapPoint: NSObject, MKAnnotation {
    
    let coordinate: CLLocationCoordinate2D
    let locationName: String
    let title: String?
    
    init(title: String, locationName: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.locationName = locationName
        self.coordinate = coordinate
    }
    
    func mapItem() -> MKMapItem {
        let addressdictionary = [String(CNPostalAddressStreetKey): title]
        let placemark = MKPlacemark(coordinate: coordinate, addressDictionary: addressdictionary)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = title
        
        return mapItem
    }
    
    
}
