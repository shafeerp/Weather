//
//  WeatherSceneUseCase.swift
//  Weather
//
//  Created by Shafeer Puthalan on 20.03.23.
//

protocol WeatherSceneUsable {
    func fetchCurrentWeather(apiModel: APIModelType, completion: @escaping (Completion) ->  Void)
}

class WeatherUseCase: WeatherSceneUsable {
    
    private let weatherSceneRepositoy: IWeatherSceneRepository
    
    init(weatherSceneRepositoy: IWeatherSceneRepository = WeatherSceneRepository()) {
        self.weatherSceneRepositoy = weatherSceneRepositoy
    }
    
    func fetchCurrentWeather(apiModel: APIModelType, completion: @escaping (Completion) ->  Void) {
        weatherSceneRepositoy.fetchCurrentWeather(apiModel: apiModel, completion: completion)
    }
}


