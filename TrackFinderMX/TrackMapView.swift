//
//  TrackMapView.swift
//  TrackFinderMX
//
//  Created by Jade Reynolds on 24/03/2017.
//  Copyright © 2017 ShutterMX. All rights reserved.
//

import UIKit
import MapKit
import FirebaseDatabase
import CoreLocation

class TrackMapView: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    var locationManager: CLLocationManager!

    @IBOutlet weak var mapView: MKMapView!
    let regionRadius: CLLocationDistance = 1000
    var name: String!
    var lat: Double!
    var lon: Double!
    var tr: newTracks!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
        mapView.showsUserLocation = true
        
        if (CLLocationManager.locationServicesEnabled()) {
            locationManager = CLLocationManager()
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestAlwaysAuthorization()
            locationManager.startUpdatingHeading()
            locationManager.startUpdatingLocation()
            mapView.mapType = .hybrid
            
        }
        
        getTrackData()
        
        }
    
    func getTrackData() {
        
        let result = FIRDatabase.database().reference(withPath: "tracks")
        result.observe(.value, with: { snapshot in
            for item in snapshot.children {
                let objects = newTracks (snapshot: item as! FIRDataSnapshot)
                let lat = objects.lat
                let lon = objects.lon
                let name = objects.name
                let annotation = mapPoint(title: name!, locationName: name!, coordinate: CLLocationCoordinate2D(latitude: lat!, longitude: lon!))
                self.mapView.addAnnotation(annotation as MKAnnotation)
            }
        })
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        let location = view.annotation as! mapPoint
        let launchOptions = [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving]
        location.mapItem().openInMaps(launchOptions: launchOptions)
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        var annotationView = self.mapView.dequeueReusableAnnotationView(withIdentifier: "Pin")
        
        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "Pin")
            annotationView?.canShowCallout = true
        } else {
            annotationView?.annotation = annotation
        }
        
        let image = UIImage(named: "navigate.png")
        let button = UIButton(type: .custom)
        button.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        button.setImage(image, for: UIControlState())
        annotationView?.rightCalloutAccessoryView = button
        return annotationView!
        
    }
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [Any]!) {
        let location = locations.last as! CLLocation
        
        let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        self.mapView.setRegion(region, animated: true)
    }
    
}






