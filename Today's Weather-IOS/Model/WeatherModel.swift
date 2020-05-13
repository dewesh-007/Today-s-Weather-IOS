//
//  WeatherModel.swift
//  Today's Weather-IOS
//
//  Created by Dewesh Sunuwar on 14/5/20.
//  Copyright © 2020 Dewesh Sunuwar. All rights reserved.
//

import UIKit

struct WeatherModel {
    
    let condition: Int
    let temp: Double
    let city: String
    
    var tempString: String {
        return String(format: "%.1f", temp)
    }
    
    var wCondition: String {
        switch condition {
        case 200...232:
            return "cloud.bolt"
        case 300...321:
            return "cloud.drizzle"
        case 500...531:
            return "cloud.rain"
        case 600...622:
            return "cloud.snow"
        case 701...781:
            return "sun.haze"
        case 800...804:
            return "cloud.sun"
        default:
            return "cloud"
        }
    }
    
}
