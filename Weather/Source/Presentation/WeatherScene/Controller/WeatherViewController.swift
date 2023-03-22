//
//  WeatherViewController.swift
//  Weather
//
//  Created by Shafeer Puthalan on 18.03.23.
//

import UIKit

class WeatherViewController: UIViewController {
    
    lazy var welcomeView: WeatherWelcomeView = {
        let view = WeatherWelcomeView()
        view.locationButton.addTarget(self, action: #selector(handleShareLocation), for: .touchUpInside)
        view.isHidden = true
        return view
    }()
    
    lazy var weatherView: WeatherView = {
        let view = WeatherView()
        view.isHidden = true
        return view
    }()
    
    lazy var loader: UIActivityIndicatorView = {
        let loader = UIActivityIndicatorView()
        loader.color = .white
        loader.hidesWhenStopped = true
        return loader
    }()

    var viewModel: WeatherSceneVMPresentable?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
        setupUI()
        viewModel?.viewDidLoad()
    }
    
    @objc private func handleShareLocation() {
        viewModel?.requestLocationAccess()
    }
}
