//
//  WeatherConstants.swift
//  Weather
//
//  Created by Shafeer Puthalan on 18.03.23.
//

enum WeatherConstants {
    
    enum WeatherScene {
        static let welcomeText = "Welcome to the Weather App"
        static let welcomeDescription = "Please share your current location to get the weather in your area"
        static let shareLocation = "Share current location"
        static let windSpeedValue = "%@ m/s"
        static let temperatureValue = "%@ °"
        static let notAvailable = "N/A"
        static let defaultTimeZone = "GMT+1"
        static let latitude = "latitude"
        static let longitude = "longitude"
        static let currentWeather = "current_weather"
    }
    
    enum Config {
        static let configurations = "Configurations"
        static let plist = "plist"
        static let weatherBaseURL = "WeatherBaseURL"
    }
    
    enum Networking {
        static let APIFailed = "Something went wrong. Please try again!"
    }
    
    enum Alert {
        static let locationPermissionTitle = "Location Permission Required"
        static let errorTitle = "Error Occured"
        static let retry = "Retry"
        static let locationPermissionMessage = "Please enable location permissions in settings."
        static let settings = "Settings"
        static let cancel = "Cancel"
    }
}
