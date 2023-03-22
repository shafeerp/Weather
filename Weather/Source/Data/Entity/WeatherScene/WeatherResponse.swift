//
//  WeatherResponse.swift
//  Weather
//
//  Created by Shafeer Puthalan on 20.03.23.
//

struct WeatherResponse: Decodable {
    let latitude: Double?
    let longitude: Double?
    let timezone: String?
    let currentWeather: CurrentWeather?
    
    enum CodingKeys: String, CodingKey {
        case latitude, longitude, timezone
        case currentWeather = "current_weather"
    }
}

struct CurrentWeather: Decodable {
    let temperature: Float
    let windspeed: Float
    let winddirection: Int
    let weathercode: Int
}
