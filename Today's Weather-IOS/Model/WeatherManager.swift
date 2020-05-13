//
//  WeatherManager.swift
//  Today's Weather-IOS
//
//  Created by Dewesh Sunuwar on 14/5/20.
//  Copyright © 2020 Dewesh Sunuwar. All rights reserved.
//

import Foundation

protocol WeatherManagerDelegate {
    func didUpdateWeather(weather: WeatherModel)
}

struct WeatherManager {
    
    let urlString = "https://api.openweathermap.org/data/2.5/weather?units=metric&apikey=e98aa9641126dad0992fd4c85740cb0e"
    
    var delegate: WeatherManagerDelegate?
    
    func fetchCity (cityName: String) {
        let urlResult = "\(urlString)&q=\(cityName)"
        if let url = URL(string: urlResult) {
            let session = URLSession(configuration: .default)
             let task = session.dataTask(with: url) { (data, response, error) in
                if let e = error {
                    print(e.localizedDescription)
                    return
                } else {
                    if let safeData = data {
                        if let weather = self.parseJSON(wModel: safeData) {
                            self.delegate?.didUpdateWeather(weather: weather)
                        }
                    }
                }
             }
            task.resume()
        }
 
    }
    
    func parseJSON(wModel: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: wModel)
            let id = decodedData.weather[0].id
            let name = decodedData.name
            let temp = decodedData.main.temp
            let finalWeather = WeatherModel(condition: id, temp: temp, city: name)
            return finalWeather
        } catch {
            print(error)
            return nil
        }
        
    }
}
