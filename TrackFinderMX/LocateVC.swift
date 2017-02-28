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
    var name: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadMap()
        
     }
    
    func loadMap() {
        print(lat)
        print(lon)
        print(name)
    
        let camera = GMSCameraPosition.camera(withLatitude: lat,longitude: lon, zoom:6)
        let mapView = GMSMapView.map(withFrame: self.mapLoader.bounds, camera:camera)
        let marker = GMSMarker()
        
        marker.position = camera.target
        marker.snippet = name
        marker.appearAnimation = kGMSMarkerAnimationPop
        marker.map = self.mapLoader
        
        self.mapLoader = mapView
        
      }
    @IBAction func backBtn(_ sender: UIButton) {
        dismiss(animated: false, completion: nil)
    
    }


}


