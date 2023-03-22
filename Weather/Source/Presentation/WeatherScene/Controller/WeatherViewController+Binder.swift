//
//  WeatherViewController+Binder.swift
//  Weather
//
//  Created by Shafeer Puthalan on 20.03.23.
//

extension WeatherViewController {
    func bindViewModel() {
        guard let viewModel = viewModel else { return }
        viewModel.renderUI.bind { [weak self] screenType in
            guard let self = self, let screenType = screenType else { return }
            self.updateWeatherView(with: screenType == .weatherScene ? .show : .hide)
        }
        
        viewModel.loadWeatherData.bind { [weak self] weatherInfo in
            guard let self = self, let weatherInfo = weatherInfo else { return }
            self.renderWeatherInfo(data: weatherInfo)
        }
        
        viewModel.isFetchingAPI.bind { [weak self] isFetching in
            guard let self = self, let isFetching = isFetching else { return }
            self.handleLoader(visibility: isFetching ? .show : .hide)
        }
    }
}
