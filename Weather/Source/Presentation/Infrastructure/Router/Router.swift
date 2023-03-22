//
//  Router.swift
//  Weather
//
//  Created by Shafeer Puthalan on 22.03.23.
//

import UIKit

typealias EmptyClosure = () -> Void
protocol RouterType {
    var navigationController: UINavigationController { get }
    func setRootModule(module: UIViewController)
    func dismissModule(animated: Bool, completion: EmptyClosure?)
    func present(_ module: UIViewController, animated: Bool)
    var appSettingsManager: AppSettingsProtocol { get }
}

final class Router: RouterType {
    
    let navigationController: UINavigationController

    var appSettingsManager: AppSettingsProtocol
    
    init(rootController: UINavigationController, appSettingsManager: AppSettingsProtocol = AppSettingsManager()) {
        self.navigationController = rootController
        self.appSettingsManager = appSettingsManager
    }
    
    func setRootModule(module: UIViewController) {
        navigationController.setViewControllers([module], animated: false)
    }
    
    func present(_ module: UIViewController, animated: Bool) {
        navigationController.present(module, animated: animated, completion: nil)
    }
    
    func dismissModule(animated: Bool, completion: EmptyClosure?) {
        navigationController.dismiss(animated: animated, completion: completion)
    }
}
