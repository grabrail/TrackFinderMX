//
//  ViewController.swift
//  TrackFinderMX
//
//  Created by Jade Reynolds on 14/02/2017.
//  Copyright © 2017 ShutterMX. All rights reserved.
//

import UIKit
import GoogleMaps

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UISearchBarDelegate{

    @IBOutlet weak var collection: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!

    var track = [Tracks]()
    var filteredTrack = [Tracks]()
    var inSearchMode = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collection.dataSource = self
        collection.delegate = self
        searchBar.delegate = self
        
        searchBar.returnKeyType = UIReturnKeyType.done  
        
        parseTrackCSV()
    }
    
    func parseTrackCSV() {
        
        let path = Bundle.main.path(forResource: "tracks", ofType: "csv")!
        
        do {
            let csv = try CSV(contentsOfURL: path)
            let rows = csv.rows
            
            for row in  rows {
                let trackId = Int(row["id"]!)!
                let name = row["name"]!
                let postcode = row["postcode"]!
                let trackType = row["type"]!
                let locID = row["locID"]!
                let lon = Double(row["long"]!)!
                let lat = Double(row["lat"]!)!
                let tr = Tracks(name: name, trackId: trackId, postcode: postcode, trackType: trackType, locId: locID, lon: lon, lat: lat)
                
                track.append(tr)
                
                }
            } catch let err as NSError {
            print(err.debugDescription)
                
        }
       
    }
    
    

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TrackCell", for: indexPath) as? TrackCell {
            
            let tr: Tracks!
            
            if inSearchMode {
                tr = filteredTrack[indexPath.row]
                cell.configureCell(tr)
                
            } else {
                tr = track[indexPath.row]
                cell.configureCell(tr)
            }
            cell.configureCell(tr)
                
            return cell
            
        } else {
            
            return UICollectionViewCell()
        
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        var tr: Tracks!
        
        if inSearchMode {
            
            tr = filteredTrack[indexPath.row]
            
        } else {
            
            tr = track[indexPath.row]
            
        }
        
        performSegue(withIdentifier: "TrackDetailVC", sender: tr)
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if inSearchMode {
            
            return filteredTrack.count
        }
        return track.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 105, height: 105)
        
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        view.endEditing(true)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchBar.text == nil || searchBar.text == "" {
            inSearchMode = false
            collection.reloadData()
            view.endEditing(true)
            
        } else {
            
            inSearchMode = true
            
            let lower = searchBar.text!//.lowercased()
            
            filteredTrack = track.filter({$0.name.range(of: lower) != nil})
            collection.reloadData()
            
         }
      }
    
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "TrackDetailVC" {
            if let detailsVC = segue.destination as? TrackDetailVC {
                if let tr = sender as? Tracks {
                    detailsVC.track = tr
                }
            }
        }
    }
}

