//
//  WeatherSceneRepository.swift
//  Weather
//
//  Created by Shafeer Puthalan on 20.03.23.
//

typealias Completion = Result<WeatherInfo, WeatherNetworkingError>
class WeatherSceneRepository: IWeatherSceneRepository {
    
    private let networkingManager: WeatherNetworkingProtocol
    
    init(networkingManager: WeatherNetworkingProtocol = WeatherAPIClient()) {
        self.networkingManager = networkingManager
    }
    
    func fetchCurrentWeather(apiModel: APIModelType, completion: @escaping (Completion) ->  Void) {
        networkingManager.fetchAPIResponse(with: apiModel) { (result: NetworkingResult<WeatherResponse>) in
            switch result {
            case .success(let model):
                completion(.success(model))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
}
