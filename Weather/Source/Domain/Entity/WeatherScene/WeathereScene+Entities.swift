//
//  WeathereScene+Entities.swift
//  Weather
//
//  Created by Shafeer Puthalan on 21.03.23.
//

protocol WeatherInfo {
    var time: String { get }
    var timeZone: String { get }
    var temperature: String { get }
    var windspeed: String { get }
}

extension WeatherResponse: WeatherInfo {
    var windspeed: String {
        guard let windspeed = currentWeather?.windspeed else { return WeatherConstants.WeatherScene.notAvailable }
        return String(format: WeatherConstants.WeatherScene.windSpeedValue, String(windspeed))
    }
    
    var timeZone: String {
        timezone ?? WeatherConstants.WeatherScene.defaultTimeZone.toDateFromTimeZone()
    }
    
    var time: String {
        guard let timezone = timezone else { return "" }
        return timezone.toDateFromTimeZone()
    }
    
    var temperature: String {
        guard let temperature = currentWeather?.temperature else { return WeatherConstants.WeatherScene.notAvailable }
        return String(format: WeatherConstants.WeatherScene.temperatureValue, String(temperature))
    }
}
