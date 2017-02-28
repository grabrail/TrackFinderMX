//
//  Forecast.swift
//  TrackFinderMX
//
//  Created by Jade Reynolds on 21/02/2017.
//  Copyright © 2017 ShutterMX. All rights reserved.
//

import UIKit
import Alamofire

class Forecast {
    
    var _date: String!
    var _weatherType: String!
    var _Temp: String!
    
    var date: String {
        if _date == nil {
            _date = "nil"
        }
        return _date
    }
    
    var weatherType: String {
        if _weatherType == nil {
            _weatherType = ""
        }
        return _weatherType
    }
    
    var Temp: String {
        if _Temp == nil {
            _Temp = ""
        }
        return _Temp
        
    }
    
    init(weatherDict: Dictionary<String, Any>) {
        if let Rep = weatherDict["Rep"] as? [Dictionary<String, Any>] {
            if let temperature = Rep[0]["T"] as? String {
                self._Temp = temperature
            }
            if let W = Rep[0]["W"] as? String {
                self._weatherType = weatherTypeDict[W]
            }
        }
        
        if let date = weatherDict["value"] as? String {
            let dateString = date.substring(to: date.index(before: date.endIndex))
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            let dateObj = dateFormatter.date(from: dateString)
            //let myCalendar = Calendar(identifier: .gregorian)
            //let weekDay = myCalendar.component(.weekday, from: dateObj!)
            
            self._date = dateObj!.dayOfTheWeek()
        }
    }
}

extension Date {
    func dayOfTheWeek() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self)
    }
}
