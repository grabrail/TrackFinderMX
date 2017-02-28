//
//  LocateVC.swift
//  TrackFinderMX
//
//  Created by Jade Reynolds on 15/02/2017.
//  Copyright © 2017 ShutterMX. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class LocateVC: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var mapView: MKMapView!
    var lat: Double!
    var lon: Double!
    var name: String!
    var locationManager = CLLocationManager()
    
    func checkLocationAuthorizationStatus() {
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            mapView.showsUserLocation = true
        } else {
            locationManager.requestWhenInUseAuthorization()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        let coordinate = CLLocationCoordinate2DMake(lat,lon)
        let mapItem = MKMapItem(placemark: MKPlacemark(coordinate: coordinate, addressDictionary:nil))
        mapItem.name = "Target location"
        mapItem.openInMaps(launchOptions: [MKLaunchOptionsDirectionsModeKey : MKLaunchOptionsDirectionsModeDriving])
        
    
        
        
        
        
        //        mapView.delegate = self
//        mapView.showsUserLocation = true
//        locationManager.desiredAccuracy = kCLLocationAccuracyBest
//        locationManager.delegate = self
//        
//        checkLocationAuthorizationStatus()
//        
//        annotation.coordinate = CLLocationCoordinate2D(latitude: lat, longitude: lon)
//        mapView.addAnnotation(annotation)
//        
//        
//        let request = MKDirectionsRequest()
//        request.source = MKMapItem.forCurrentLocation()
//        request.destination = MKMapItem(placemark: MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: lat,longitude: lon)))
//        request.requestsAlternateRoutes = true
//        request.transportType = .automobile
//        
//        let directions = MKDirections(request: request)
//        
//        directions.calculate {[unowned self] response, error in
//            guard let unwrappedResponse = response else { return }
//            
//            for route in unwrappedResponse.routes {
//                self.mapView.add(route.polyline)
//                self.mapView.setVisibleMapRect(route.polyline.boundingMapRect, animated: true)
//            }
//        }
//      }
//    
//    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
//        let renderer = MKPolylineRenderer(polyline: overlay as! MKPolyline)
//        renderer.strokeColor = UIColor.blue
//        return renderer
//    }
//    
//    let regionRadius: CLLocationDistance = 1000
//    let annotation = MKPointAnnotation()
//        func centerMapOnLocation(location: CLLocation) {
//        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius * 2.0, regionRadius * 2.0)
//        mapView.setRegion(coordinateRegion, animated: true)
//            //mapView.showsUserLocation = true
//    
//            
//    }
//    
//    @IBAction func backBtn(_ sender: UIButton) {
//        dismiss(animated: false, completion: nil)
//    
    }


}


