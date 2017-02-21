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
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var weatherType: UILabel!
    @IBOutlet weak var Temp: UILabel!
    
    
    
    func configureCell(forecast: Forecast) {
        Temp.text = forecast.Temp
        weatherType.text = forecast.weatherType
        weatherIcon.image = UIImage(named: forecast.weatherType)
        dayLabel.text = forecast.date
    }
    
    
}
