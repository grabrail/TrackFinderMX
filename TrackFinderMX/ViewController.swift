//
//  ViewController.swift
//  TrackFinderMX
//
//  Created by Jade Reynolds on 14/02/2017.
//  Copyright © 2017 ShutterMX. All rights reserved.
//

import UIKit
import GoogleMobileAds
import Alamofire
import FirebaseDatabase



class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate{

    
    @IBOutlet weak var firstAd: GADBannerView!
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!

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
            print(newItems)
            
            for item in snapshot.children {
                let trackDetails = newTracks(snapshot: item as! FIRDataSnapshot)
                newItems.append(trackDetails)
              }
            
            self.items = newItems
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
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var tr: newTracks!
        if inSearchMode {
            tr = filteredTrack[indexPath.row]
        } else {
            tr = items[indexPath.row]
        }
        performSegue(withIdentifier: "TrackDetailVC", sender: tr)
    }

   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "TrackDetailVC" {
            if let detailsVC = segue.destination as? TrackDetailVC {
                if let tr = sender as? newTracks {
                    detailsVC.track = tr
                }
            }
        }
    }
}

