//
//  WeatherData.swift
//  Today's Weather-IOS
//
//  Created by Dewesh Sunuwar on 14/5/20.
//  Copyright © 2020 Dewesh Sunuwar. All rights reserved.
//

import Foundation

struct WeatherData: Codable {
    let name: String
    let main: Main
    let weather: [Weather]
}

struct Main: Codable {
    let temp: Double
}

struct Weather: Codable {
    let id: Int
}
