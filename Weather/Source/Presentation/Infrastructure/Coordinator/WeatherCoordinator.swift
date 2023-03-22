//
//  WeatherCoordinator.swift
//  Weather
//
//  Created by Shafeer Puthalan on 18.03.23.
//

/// Base coordinator which all other coordinators should confirm
protocol WeatherCoordinator {
    
    /// Method to perform all the initial setup of controllers and associated view model
    func start()
    
    /// Method to start all the cordinators
    func coordinate(to coordinator: WeatherCoordinator)
}

extension WeatherCoordinator {
    func coordinate(to coordinator: WeatherCoordinator) {
        coordinator.start()
    }
}

