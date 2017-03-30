//
//  ViewController.swift
//  TrackFinderMX
//
//  Created by Jade Reynolds on 14/02/2017.
//  Copyright © 2017 ShutterMX. All rights reserved.
//

import UIKit
import GoogleMobileAds

class ViewController:  UIViewController{
    

    @IBOutlet var segmentedControl: UISegmentedControl!
    @IBOutlet weak var mapContainer: UIView!
    @IBOutlet weak var tableContainer: UIView!
    @IBOutlet weak var firstAd: GADBannerView!
    
    
    var TR: newTracks!
    var track = [newTracks]()
    var items: [newTracks] = []
    var filteredTrack = [newTracks]()
    var inSearchMode = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstAd.adUnitID = "ca-app-pub-5208737100151061/9510951037"
        firstAd.rootViewController = self
        firstAd.load(GADRequest())
        
    }
    
    
    @IBAction func showContainer(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            UIView.animate(withDuration: 0.5, animations: {
                self.tableContainer.alpha = 1
                self.mapContainer.alpha = 0
            })
            
        } else {
            UIView.animate(withDuration: 0.5, animations: {
                self.tableContainer.alpha = 0
                self.mapContainer.alpha = 1
                
            })
        }
        
    }
    
    
    

}


