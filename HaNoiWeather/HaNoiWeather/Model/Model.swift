//
//  Model.swift
//  HaNoiWeather
//
//  Created by Đặng Khánh  on 7/17/19.
//  Copyright © 2019 Đặng Khánh. All rights reserved.
//

import UIKit

struct HNWeather : Codable {
    var city: City
    var list: [List]
}

struct City : Codable {
    var id: Int
    var name: String
    var timezone: TimeInterval
}

struct List : Codable {
    var dt: TimeInterval
    var temp: Temp
    var weather: [Weather]
    
    struct Temp : Codable {
        var min: Double
        var max: Double
    }
    
    struct Weather : Codable {
        
        
        
            var main: String
            var description: String
        
        
    }
}


