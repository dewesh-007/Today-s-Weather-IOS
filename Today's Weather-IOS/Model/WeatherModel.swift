//
//  WeatherModel.swift
//  Today's Weather-IOS
//
//  Created by Dewesh Sunuwar on 14/5/20.
//  Copyright © 2020 Dewesh Sunuwar. All rights reserved.
//

import Foundation

struct WeatherModel {
    
    let condition: Int
    let temp: Double
    let city: String
    
    var tempString: String {
        return String(format: "%.1f", temp)
    }
}
