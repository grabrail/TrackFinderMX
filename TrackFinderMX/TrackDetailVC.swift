//
//  TrackDetailVC.swift
//  TrackFinderMX
//
//  Created by Jade Reynolds on 15/02/2017.
//  Copyright © 2017 ShutterMX. All rights reserved.
//

import UIKit
import Alamofire
import MapKit
import CoreLocation
import FirebaseDatabase
import Cosmos

class TrackDetailVC: UIViewController, UITableViewDelegate, UITableViewDataSource, MKMapViewDelegate, CLLocationManagerDelegate{
    
    
    
    var track: newTracks!
    
    //let storage = FIRStorage.storage()
    
    @IBOutlet weak var popUpView: UIView!
    @IBOutlet weak var cosmosRating: CosmosView!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var phoneNumberlbl: UILabel!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var postcodeLbl: UILabel!
    @IBOutlet weak var trackTyepLbl: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var trackImages: UIImageView!
    
    var forecast: Forecast!
    var forecasts = [Forecast]()
    
    var vtrack = [newTracks]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
                cosmosSetup()
        loadWeather()
        
        tableView.delegate = self
        tableView.dataSource = self

        nameLbl.text = track.name
        }
    
    func cosmosSetup() {
        
        cosmosRating.rating = track.rating
        //cosmosRating.text = "Track Rating"
        //cosmosRating.didTouchCosmos = didTouchCosmos
        cosmosRating.didFinishTouchingCosmos = didFinishTouchingCosmos
    }
    
    func didFinishTouchingCosmos(_ rating: Double) {
        var rates: Double
        var numrate: Double
        var totalratings: Double
        var ref: FIRDatabaseReference!
        
        totalratings = track.totalrating + cosmosRating.rating
        numrate = track.numrating + 1
        cosmosRating.rating = totalratings / numrate
        
        ref = FIRDatabase.database().reference(withPath: "tracks").child(track.name)
        rates = cosmosRating.rating
        
        let post = ["rating": rates, "numrating": numrate, "totalrating": totalratings]
        let childUpdates =  post
        
        ref.updateChildValues(childUpdates)
        
       }
    
    func showPopUpView() {
        popUpView.isHidden = false
        
        
    }
    
   
    @IBAction func exitPopUpViewButton(_ sender: Any) {
        popUpView.isHidden = true
    }
    
    
    
    func loadWeather() {
            self.downloadForecastData {
                    self.updateUI()
                }
            }
        
    func updateUI() {
      phoneNumberlbl.text = track.phoneNumber
      emailLbl.text = track.email

        
    }

    @IBAction func bckBtnPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: false, completion: nil)
    }
   
    
    func downloadForecastData(completed: @escaping DownLoadComplete) {
        let LID = track.locID
        
        let forecastURL = URL(string: "http://datapoint.metoffice.gov.uk/public/data/val/wxfcs/all/json//\(LID!)?res=daily&key=682ef7b6-add5-4199-875b-085ffd630466")!
        
        Alamofire.request(forecastURL).responseJSON { response in
            let result = response.result
            
            if let dict = result.value as? Dictionary<String, Any> {
                if let SiteRep = dict["SiteRep"] as? Dictionary<String, Any> {
                    if let DV = SiteRep["DV"] as? Dictionary<String,Any> {
                        if let location = DV["Location"] as? Dictionary<String, Any> {
                            if let period = location["Period"] as? [Dictionary<String, Any>] {
                               
                                for obj in period {
                                    let forecast = Forecast(weatherDict: obj)
                                    self.forecasts.append(forecast)
                                }
                                
                                //self.forecasts.remove(at: 0)
                                self.tableView.reloadData()
                            }
                            
                        }
                    }
                }
            }
            completed()
        }
    }
    
    @IBAction func LocateBtnPressed() {
        
        let coordinate = CLLocationCoordinate2DMake(track.lat,track.lon)
        let mapItem = MKMapItem(placemark: MKPlacemark(coordinate: coordinate, addressDictionary:nil))
        mapItem.name = "Target location"
        mapItem.openInMaps(launchOptions: [MKLaunchOptionsDirectionsModeKey : MKLaunchOptionsDirectionsModeDriving])
    }
    
   
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //print(forecasts.count)
        return forecasts.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath) as? WeatherCell {
            
            let forecast = forecasts[indexPath.row]
            cell.configureCell(forecast: forecast)
            return cell
        }
        else {
            return WeatherCell()
        }
       
     
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "LocateVC" {
            if let LocateVC = segue.destination as? LocateVC {
                    LocateVC.lon = track.lon
                    LocateVC.lat = track.lat
                    LocateVC.name = track.name
            }
        }
    }

    
}
