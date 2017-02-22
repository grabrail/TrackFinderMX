//
//  LocateVC.swift
//  TrackFinderMX
//
//  Created by Jade Reynolds on 15/02/2017.
//  Copyright © 2017 ShutterMX. All rights reserved.
//

import UIKit
import GoogleMaps

class LocateVC: UIViewController {

    var track: Tracks!
    
 
    @IBOutlet weak var mapView: GMSMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //override func loadView() {
        // Create a GMSCameraPosition that tells the map to display the
        // coordinate -33.86,151.20 at zoom level 6.
        
        
        
        
        
        let camera = GMSCameraPosition.camera(withLatitude:  (track.lat) , longitude: (track.lon), zoom: 6.0)
        let mapView = GMSMapView.map(withFrame: self.mapView.bounds, camera: camera)
        self.mapView = mapView
        
        // Creates a marker in the center of the map.
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: -33.86, longitude: 151.20)
        marker.title = "Sydney"
        marker.snippet = "Australia"
        marker.map = self.mapView
    }
}
