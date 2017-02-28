//
//  weatherCell.swift
//  TrackFinderMX
//
//  Created by Jade Reynolds on 21/02/2017.
//  Copyright © 2017 ShutterMX. All rights reserved.
//

import UIKit

class WeatherCell: UITableViewCell {
    
    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var dayLable: UILabel!
    @IBOutlet weak var weatherType: UILabel!
    @IBOutlet weak var Temp: UILabel!
    
    
    
    func configureCell(forecast: Forecast) {
        Temp.text = "\(forecast.Temp)°C"
        weatherType.text = forecast.weatherType
        weatherIcon.image = UIImage(named: forecast.weatherType)
        dayLable.text = forecast.date
    }
}
