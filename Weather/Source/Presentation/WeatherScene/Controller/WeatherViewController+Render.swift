//
//  WeatherViewController+Render.swift
//  Weather
//
//  Created by Shafeer Puthalan on 18.03.23.
//

import Foundation
extension WeatherViewController {
    
    func updateWeatherView(with visibility: Visibility) {
        welcomeView.isHidden = visibility == .show
        weatherView.isHidden = visibility == .hide
    }
    
    func renderWeatherInfo(data: WeatherInfo) {
        weatherView.cityLabel.text = data.timeZone
        weatherView.temperatureLabel.text = data.temperature
        weatherView.windspeedValueLabel.text = data.windspeed
        weatherView.dateLabel.text = data.time
    }
    
    func handleLoader(visibility: Visibility) {
        visibility == .show ? loader.startAnimating() : loader.stopAnimating()
    }
}
