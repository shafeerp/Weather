//
//  WeatherSceneViewModel.swift
//  Weather
//
//  Created by Shafeer Puthalan on 18.03.23.
//

import Foundation

class WeatherSceneViewModel: WeatherSceneVMPresentable {
    
    var isFetchingAPI = Bindable<Bool>()
    var onError = Bindable<WeatherNetworkingError>()
    var showLocationDeniedAlert = Bindable<Void>()
    var renderUI = Bindable<SceneViewType>()
    var loadWeatherData = Bindable<WeatherInfo>()
    let locationManager: LocationServiceManager
    var userLocation: UserLocation?
    let useCase: WeatherSceneUsable
    private let mainQueue: Dispatching
    
    init(locationManager: LocationServiceManager = LocationServiceManager(),
         useCase: WeatherSceneUsable = WeatherUseCase(),
         mainQueue: Dispatching = DispatchQueue.main) {
        self.locationManager = locationManager
        self.useCase = useCase
        self.mainQueue = mainQueue
    }
    
    func viewDidLoad() {
        locationManager.setDelegate(delegate: self)
        handleLocationStatus(status: locationManager.locationStatus)
    }
    
    private func fetchWeatherInfo() {
        isFetchingAPI.value = true
        let requestModel = APIRequestModel(api: CurrentWeatherRouter.getCurrentWeather,
                                           queryParams: generateQueryParams(),
                                           requestType: .GET)
        useCase.fetchCurrentWeather(apiModel: requestModel, completion: { [weak self] result in
            guard let self = self else { return }
            self.mainQueue.async {
                self.handleResult(result: result)
            }
        })
    }
    
    private func generateQueryParams() -> [String: String]? {
        guard let userLocation = userLocation else { return nil }
        var queryParams = [String: String]()
        queryParams[WeatherConstants.WeatherScene.latitude] = String(userLocation.latitude)
        queryParams[WeatherConstants.WeatherScene.longitude] = String(userLocation.longitude)
        queryParams[WeatherConstants.WeatherScene.currentWeather] = "true"
        return queryParams
    }

    func handleResult(result: Completion) {
        isFetchingAPI.value = false
        switch result {
        case .success(let model):
            loadWeatherData.value = model
        case .failure(let error):
            onError.value = error
        }
    }
    
    func retryFetchingWeatherInfo() {
        fetchWeatherInfo()
    }

    private func handleLocationStatus(status: LocationAccessStatus) {
        switch status {
        case .denied:
            showLocationDeniedAlert.value = ()
        case .restricted:
            print("Handle restricted")
        case .available:
            userLocation = locationManager.currentLocation
            renderUI.value = .weatherScene
            fetchWeatherInfo()
        case .notAvaialable:
            renderUI.value = .welcome
        }
    }
    
    func requestLocationAccess() {
        locationManager.requestLocationAcess()
    }
}

extension WeatherSceneViewModel: LocationServiceDelegate {
    func locationAuthChanged(status: LocationAccessStatus) {
        handleLocationStatus(status: status)
    }
}
