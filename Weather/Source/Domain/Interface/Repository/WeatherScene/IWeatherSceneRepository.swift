//
//  IWeatherScene.swift
//  Weather
//
//  Created by Shafeer Puthalan on 20.03.23.
//

protocol IWeatherSceneRepository {
    func fetchCurrentWeather(apiModel: APIModelType, completion: @escaping (Completion) ->  Void)
}
