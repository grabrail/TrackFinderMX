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

    @IBOutlet weak var mapLoader: GMSMapView!
    var lat: Double!
    var lon: Double!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadMap()
        
     }

    func loadMap() {
        print(lat)
        print(lon)
    
        let camera = GMSCameraPosition.camera(withLatitude: lat,longitude: lon, zoom:6)
        let mapView = GMSMapView.map(withFrame: self.mapLoader.bounds, camera:camera)
        let marker = GMSMarker()
        
        marker.position = camera.target
        marker.snippet = "Hello World"
        marker.appearAnimation = kGMSMarkerAnimationPop
        marker.map = self.mapLoader
        
        self.mapLoader = mapView
        
      }
}





    
//       //override func loadView() {
//        // Create a GMSCameraPosition that tells the map to display the
//        // coordinate -33.86,151.20 at zoom level 6.
//        
//        let camera = GMSCameraPosition.camera(withLatitude:  -33.86 , longitude: 151.20, zoom: 6.0)
//        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
//        //let mapView = GMSMapView.map(withFrame: self.mapView.bounds, camera: camera)
//        self.mapView = mapView
//        
//    }
//    
//    func viewDidAppear(){
//        // Creates a marker in the center of the map.
//        let marker = GMSMarker()
//        marker.position = CLLocationCoordinate2D(latitude: -33.86, longitude: 151.20)
//        marker.title = "Sydney"
//        marker.snippet = "Australia"
//        marker.map = self.mapView
//    }
//}
