//
//  WeatherAPIConfigurations.swift
//  Weather
//
//  Created by Shafeer Puthalan on 20.03.23.
//

import Foundation

class WeatherAPIConfigurations {
    
    private static var shared: WeatherAPIConfigurations {
        return WeatherAPIConfigurations()
    }
    private var variables : [String: Any]
    private init() {
        guard let configFilePath  = Bundle.main.path(forResource: WeatherConstants.Config.configurations, ofType: WeatherConstants.Config.plist) else {
            variables = [:]
            return
        }
        variables  = NSDictionary(contentsOfFile: configFilePath) as? [String : Any] ?? [:]
    }
    
    /// Method will get the base url for weather api from Configurations plist
    static func weatherAPIBaseURL() -> String {
        return WeatherAPIConfigurations.shared.variables[WeatherConstants.Config.weatherBaseURL] as? String ?? ""
    }
}
