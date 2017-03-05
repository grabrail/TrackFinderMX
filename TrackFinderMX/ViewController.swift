//
//  ViewController.swift
//  TrackFinderMX
//
//  Created by Jade Reynolds on 14/02/2017.
//  Copyright © 2017 ShutterMX. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate{

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!

    var TR: Tracks!
    var track = [Tracks]()
    var filteredTrack = [Tracks]()
    var inSearchMode = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
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
                let phoneNumber = row["phone"]!
                let email = row["email"]!
                let tr = Tracks(name: name, trackId: trackId, postcode: postcode, trackType: trackType, locId: locID, lon: lon, lat: lat,phoneNumber: phoneNumber,email: email)
                track.append(tr)
                
                }
            } catch let err as NSError {
            print(err.debugDescription)
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if inSearchMode {
            return filteredTrack.count
        } else {
            return track.count
        }
       }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "TrackCell", for: indexPath) as? TrackCell {
            let tr: Tracks!
            if inSearchMode {
                tr = filteredTrack[indexPath.row]
                cell.configureCell(track: tr)
            } else {
                tr = track[indexPath.row]
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
            filteredTrack = track.filter({$0.name.range(of: lower) != nil})
            tableView.reloadData()
            
         }
      }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var tr: Tracks!
        if inSearchMode {
            tr = filteredTrack[indexPath.row]
        } else {
            tr = track[indexPath.row]
        }
        performSegue(withIdentifier: "TrackDetailVC", sender: tr)
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

