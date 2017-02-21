//
//  TrackDetailVC.swift
//  TrackFinderMX
//
//  Created by Jade Reynolds on 15/02/2017.
//  Copyright © 2017 ShutterMX. All rights reserved.
//

import UIKit
import Alamofire

class TrackDetailVC: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    var track: Tracks!
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var postcodeLbl: UILabel!
    @IBOutlet weak var trackTyepLbl: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var forecast: Forecast!
    var forecasts = [Forecast]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self

        nameLbl.text = track.name
        
        
        //track.downloadtrackDetails {
            
            
            self.updateUI()
        //}
    }
    
    func updateUI() {
        
        postcodeLbl.text = track.postcode
        trackTyepLbl.text = track.trackType
        
    }

    @IBAction func backBtnPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    func downloadForecastData(completed: @escaping DownLoadComplete) {
        //download forecast weather data for TableView
        let forecastURL = URL(string: FORECAST_URL)!
        Alamofire.request(forecastURL).responseJSON { response in
            let result = response.result
            
            if let dict = result.value as? Dictionary<String, Any> {
                if let SiteRep = dict["SiteRep"] as? Dictionary<String, Any> {
                    if let DV = SiteRep["DV"] as? Dictionary<String,Any> {
                        if let location = DV["Location"] as? Dictionary<String, Any> {
                            if let period = location["Period"] as? [Dictionary<String, Any>] {
                                //if let Rep = period[0]["Rep"] as? [Dictionary<String, Any>] {
                                
                                
                                for obj in period {
                                    let forecast = Forecast(weatherDict: obj)
                                    self.forecasts.append(forecast)
                                    print(obj)
                                }
                                self.forecasts.remove(at: 0)
                                self.tableView.reloadData()
                            }
                            
                        }
                    }
                }
            }
            completed()
        }
    }
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
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

    
}
