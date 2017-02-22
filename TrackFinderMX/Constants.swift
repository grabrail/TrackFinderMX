//
//  Constants.swift
//  TrackFinderMX
//
//  Created by Jade Reynolds on 17/02/2017.
//  Copyright © 2017 ShutterMX. All rights reserved.
//

import Foundation

let jsonURL = "https://api.myjson.com/bins/q9efh"

typealias DownLoadComplete = () -> ()


let FORECAST_URL = "http://datapoint.metoffice.gov.uk/public/data/val/wxfcs/all/json/?res=3hourly&key=682ef7b6-add5-4199-875b-085ffd630466"
//let FCEND_URL = "?res=3hourly&key=682ef7b6-add5-4199-875b-085ffd630466"

//350497

let dayDict = [
    "1":"Monday",
    "2":"Tuesday",
    "3":"Wednesday",
    "4":"Thursday",
    "5":"Friday",
    "6":"Saturday",
    "7":"Sunday"]

let weatherTypeDict = [
    "NA":"Not available",
    "0":"Clear night",
    "1":"Sunny day",
    "2":"Partly cloudy (night)",
    "3":"Partly cloudy (day)",
    "4":"Not used",
    "5":"Mist",
    "6":"Fog",
    "7":"Clouds",
    "8":"Overcast",
    "9":"Light rain shower (night)",
    "10":"Light rain shower (day)",
    "11":"Drizzle",
    "12":"Light rain",
    "13":"Heavy rain shower (night)",
    "14":"Heavy rain shower (day)",
    "15":"Heavy rain",
    "16":"Sleet shower (night)",
    "17":"Sleet shower (day)",
    "18":"Sleet",
    "19":"Hail shower (night)",
    "20":"Hail shower (day)",
    "21":"Hail",
    "22":"Light snow shower (night)",
    "23": "Light snow shower (day)",
    "24":"Light snow",
    "25":"Heavy snow shower (night)",
    "26": "Heavy snow shower (day)",
    "27":"Heavy snow",
    "28":"Thunder shower (night)",
    "29":"Thunder shower (day) ",
    "30": "Thunder"
]

