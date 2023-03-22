//
//  SceneDelegate.swift
//  Weather
//
//  Created by Shafeer Puthalan on 18.03.23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    lazy var applicationCoordinator: WeatherCoordinator = WeatherApplicationCoordinator(window: window!)
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        applicationCoordinator.start()
    }
}
