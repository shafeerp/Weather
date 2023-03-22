//
//  WeatherRouter.swift
//  Weather
//
//  Created by Shafeer Puthalan on 20.03.23.
//

enum CurrentWeatherRouter: APIProtocol {
    
    case getCurrentWeather
    
    func apiBasepath() -> String {
        return WeatherAPIConfigurations.weatherAPIBaseURL()
    }
    
    func apiEndpath() -> String {
        return NetworkingEndPoints.currentWeather
    }
}

