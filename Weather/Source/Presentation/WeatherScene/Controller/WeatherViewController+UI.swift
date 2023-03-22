//
//  WeatherViewController+UI.swift
//  Weather
//
//  Created by Shafeer Puthalan on 18.03.23.
//

import UIKit

extension WeatherViewController {
    func setupUI() {
        view.backgroundColor = .rgb(red: 58, green: 130, blue: 247, alpha: 1)
        setupWelcomeView()
        setupWeatherView()
        setupLoader()
    }
    
    private func setupLoader() {
        view.addSubview(loader)
        loader.anchors(heightConstants: 20,
                       widthConstants: 20,
                       centerX: view.centerXAnchor,
                       centerY: view.centerYAnchor)
    }
    
    private func setupWelcomeView() {
        view.addSubview(welcomeView)
        welcomeView.anchors(leading: view.leadingAnchor,
                            leadingConstants: 12,
                            trailing: view.trailingAnchor,
                            trailingConstants: -12,
                            centerX: view.centerXAnchor,
                            centerY: view.centerYAnchor)
    }
    
    private func setupWeatherView() {
        view.addSubview(weatherView)
        weatherView.anchors(top: view.safeAreaLayoutGuide.topAnchor,
                            leading: view.leadingAnchor,
                            bottom: view.bottomAnchor,
                            trailing: view.trailingAnchor)
    }
}
