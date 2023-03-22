//
//  WeatherScene+Protocols.swift
//  Weather
//
//  Created by Shafeer Puthalan on 18.03.23.
//

protocol WeatherSceneVMPresentable {
    var renderUI: Bindable<SceneViewType> { get set }
    var loadWeatherData: Bindable<WeatherInfo> { get set }
    var isFetchingAPI: Bindable<Bool> { get set }
    func requestLocationAccess()
    func viewDidLoad()
}
