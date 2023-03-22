//
//  WeatherSceneCoordinator.swift
//  Weather
//
//  Created by Shafeer Puthalan on 18.03.23.
//

import UIKit

class WeatherSceneCoordinator: WeatherCoordinator {
    private let router: RouterType
    private var weatherScene: WeatherViewController?
    init(router: RouterType) {
        self.router = router
    }
    
    func start() {
        weatherScene = WeatherViewController()
        let viewModel = WeatherSceneViewModel()
        viewModel.showLocationDeniedAlert.bind { [weak self] _ in
            guard let self = self else { return }
            self.showLocationDeniedAlert()
        }
        viewModel.onError.bind { [weak self] _ in
            guard let self = self else { return }
            self.showErrorAlert(viewModel: viewModel)
        }
        weatherScene?.viewModel = viewModel
        router.setRootModule(module: weatherScene!)
    }
    
    private func showLocationDeniedAlert() {
        let alertController = UIAlertController(title: WeatherConstants.Alert.locationPermissionTitle,
                                                message: WeatherConstants.Alert.locationPermissionMessage,
                                                preferredStyle: .alert)
        let okAction = UIAlertAction(title: WeatherConstants.Alert.settings, style: .default, handler: { _ in
            self.router.appSettingsManager.showAppSettings()
        })
        let cancelAction = UIAlertAction(title: WeatherConstants.Alert.cancel,
                                         style: .cancel)
        alertController.addAction(cancelAction)
        alertController.addAction(okAction)
        router.present(alertController, animated: true)
    }
    
    private func showErrorAlert(viewModel: WeatherSceneViewModel) {
        let alertController = UIAlertController(title: WeatherConstants.Alert.errorTitle,
                                                message: WeatherConstants.Networking.APIFailed,
                                                preferredStyle: .alert)
        let okAction = UIAlertAction(title: WeatherConstants.Alert.retry, style: .default, handler: { _ in
            self.router.dismissModule(animated: true, completion: nil)
            viewModel.retryFetchingWeatherInfo()
        })
        alertController.addAction(okAction)
        router.present(alertController, animated: true)
    }
}
