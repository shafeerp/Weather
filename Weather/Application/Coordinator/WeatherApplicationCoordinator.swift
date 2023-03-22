//
//  WeatherApplicationCoordinator.swift
//  Weather
//
//  Created by Shafeer Puthalan on 18.03.23.
//

import UIKit

class WeatherApplicationCoordinator: WeatherCoordinator {
    
    private let window: UIWindow
    private var weatherSceneCoordinator: WeatherCoordinator?
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let navigationalController = UINavigationController()
        navigationalController.navigationBar.isHidden = true
        weatherSceneCoordinator =  WeatherSceneCoordinator(router: Router(rootController: navigationalController))
        coordinate(to: weatherSceneCoordinator!)
        window.rootViewController = navigationalController
        window.makeKeyAndVisible()
    }
}
