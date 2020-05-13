//
//  ViewController.swift
//  Today's Weather-IOS
//
//  Created by Dewesh Sunuwar on 13/5/20.
//  Copyright © 2020 Dewesh Sunuwar. All rights reserved.
//

import UIKit

class ViewController: UIViewController, WeatherManagerDelegate {

    var weatherManager = WeatherManager()
    
    

    @IBOutlet weak var textLabel: UITextField!
    @IBOutlet weak var weatherDisplayLabel: UIImageView!
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        weatherManager.delegate = self
    }

    @IBAction func searchButtonPressed(_ sender: UIButton) {
        if let city = textLabel.text {
            weatherManager.fetchCity(cityName: city)
        }
    }
    
    func didUpdateWeather(weather: WeatherModel) {
        DispatchQueue.main.async {
            self.cityNameLabel.text = weather.city
            self.tempLabel.text = weather.tempString
            self.weatherDisplayLabel.image = UIImage(systemName: weather.wCondition)
        }
    }
    
}

