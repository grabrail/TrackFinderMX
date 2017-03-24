//
//  TrackTableView.swift
//  TrackFinderMX
//
//  Created by Jade Reynolds on 24/03/2017.
//  Copyright © 2017 ShutterMX. All rights reserved.
//

import UIKit
import GoogleMobileAds
import FirebaseDatabase
import CoreLocation
import MapKit

class TrackTableView: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
   
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var TR: newTracks!
    var track = [newTracks]()
    var items: [newTracks] = []
    var filteredTrack = [newTracks]()
    var inSearchMode = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        searchBar.delegate = self
        searchBar.returnKeyType = UIReturnKeyType.done
        
        getTrackData()
        
        
    }
    func getTrackData() {
        
        let result = FIRDatabase.database().reference(withPath: "tracks")
        result.observe(.value, with: { snapshot in
            var newItems: [newTracks] = []
            for item in snapshot.children {
                let trackDetails = newTracks(snapshot: item as! FIRDataSnapshot)
                newItems.append(trackDetails)
            }
            self.items = newItems
            self.items.sort(by: {$0.distance < $1.distance})
            self.tableView.reloadData()
        })
    }
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if inSearchMode {
            return filteredTrack.count
        } else {
            return items.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "TrackCell", for: indexPath) as? TrackCell {
            
            let tr: newTracks!
            if inSearchMode {
                tr = filteredTrack[indexPath.row]
                cell.configureCell(track: tr)
            } else {
                tr = items[indexPath.row]
                cell.configureCell(track: tr)
            }
            cell.configureCell(track: tr)
            
            cell.completion = {
                let coordinate = CLLocationCoordinate2DMake(tr.lat,tr.lon)
                let mapItem = MKMapItem(placemark: MKPlacemark(coordinate: coordinate,addressDictionary:nil))
                mapItem.name = tr.name
                mapItem.openInMaps(launchOptions: [MKLaunchOptionsDirectionsModeKey :MKLaunchOptionsDirectionsModeDriving])
                return()
            }
            
            return cell
        } else {
            return UITableViewCell()
        }
        
        
        
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        view.endEditing(true)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text == nil || searchBar.text == "" {
            inSearchMode = false
            tableView.reloadData()
            view.endEditing(true)
        } else {
            inSearchMode = true
            let lower = searchBar.text!
            filteredTrack =  items.filter({$0.name.range(of: lower) != nil})
            tableView.reloadData()
            
        }
    }
}
