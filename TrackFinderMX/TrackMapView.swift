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



class TrackMapView: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    //var tr: newTracks!
    //var items = [newTracks]()
    //var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.mapView.delegate = self
        
        //getMapTrackData()
        
        
    }
    
//    func getMapTrackData() {
//        
//        let result = FIRDatabase.database().reference(withPath: "tracks")
//        result.observe(.value, with: { snapshot in
//            var newItems: [newTracks] = []
//            for item in snapshot.children {
//                let trackDetails = newTracks(snapshot: item as! FIRDataSnapshot)
//                newItems.append(trackDetails)
//            }
//            self.items = newItems
//            //self.items.sort(by: {$0.distance < $1.distance})
//            //self.tableView.reloadData()
//            
//            
//            let coordinate = CLLocationCoordinate2DMake(self.tr.lat,self.tr.lon)
//            let mapItem = MKMapItem(placemark: MKPlacemark(coordinate: coordinate,addressDictionary:nil))
//            mapItem.name = self.tr.name
//            
//            
//        })
    }
    


    
    
        



        
        
        
        
        
        
        
        //        mapView.mapType = MKMapType.standard
        
        

        
        
        
//        let location = CLLocationCoordinate2D(latitude: 23.0225,longitude: 72.5714)
//        
//        let span = MKCoordinateSpanMake(0.05, 0.05)
//        let region = MKCoordinateRegion(center: location, span: span)
//        mapView.setRegion(region, animated: true)
        
//        let annotation = MKPointAnnotation()
//        annotation.coordinate = coordinate
//        annotation.title = "jim"
//        annotation.subtitle = "smith"
//        mapView.addAnnotation(annotation)
        


 


