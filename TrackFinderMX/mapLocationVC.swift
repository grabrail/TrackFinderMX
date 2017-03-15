//
//  mapLocation.swift
//  TrackFinderMX
//
//  Created by Jade Reynolds on 14/03/2017.
//  Copyright © 2017 ShutterMX. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class mapLocationVC: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    var track: newTracks!
    
    let locationManager = CLLocationManager()
    
    
    @IBOutlet weak var mapView: MKMapView!
    //var myLocation:CLLocationCoordinate2D
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.locationManager.requestAlwaysAuthorization()
        self.locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
        }
        
        mapView.delegate = self
        mapView.mapType = .standard
        mapView.isZoomEnabled = true
        mapView.isScrollEnabled = true
        
        if let coor = mapView.userLocation.location?.coordinate {
            mapView.setCenter(coor, animated: true)
        }
        
    
    
        let sourcelocation = self.locationManager.location?.coordinate //CLLocationCoordinate2D(latitude: track.lat, longitude: track.lon)
        let destinationLocation = CLLocationCoordinate2D(latitude: track.lat, longitude: track.lon)
        
        let sourcePlacemark = MKPlacemark(coordinate: sourcelocation!, addressDictionary: nil)
        let destinationPlacemark = MKPlacemark(coordinate: destinationLocation, addressDictionary: nil)
        
        let sourceMapItem = MKMapItem(placemark: sourcePlacemark)
        let destinationMapItem = MKMapItem(placemark: destinationPlacemark)
        
        let sourceAnnotation = MKPointAnnotation()
        sourceAnnotation.title = "You"
        
        if let location = sourcePlacemark.location {
            sourceAnnotation.coordinate = location.coordinate
        }
        
        let destinationAnnotation = MKPointAnnotation()
        destinationAnnotation.title = track.name
        
        if let location = destinationPlacemark.location {
            destinationAnnotation.coordinate = location.coordinate
        }

        self.mapView.showAnnotations([sourceAnnotation,destinationAnnotation], animated: true)
        
        let directionRequest = MKDirectionsRequest()
        directionRequest.source = sourceMapItem
        directionRequest.destination = destinationMapItem
        directionRequest.transportType = .automobile
        
        let directions = MKDirections(request: directionRequest)
        
        directions.calculate {
            (response, error) -> Void in
            
            guard let response = response else {
                if let error = error {
                    print("Error: \(error)")
                }
                return
            }
            
            let route = response.routes[0]
            self.mapView.add((route.polyline), level: MKOverlayLevel.aboveRoads)
            
            let rect = route.polyline.boundingMapRect
            self.mapView.setRegion(MKCoordinateRegionForMapRect(rect), animated: true)
        }
        
        
    }

    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [CLLocation]) {
        var userLocation:CLLocationCoordinate2D = (manager.location?.coordinate)!
        print("locations = \(userLocation.latitude) \(userLocation.longitude)")
        
        
    }
    
    
   
    func mapView(mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolylineRenderer(overlay: overlay)
        renderer.strokeColor = UIColor.red
        renderer.lineWidth = 4.0
        
        return renderer
    }

   

}
