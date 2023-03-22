//
//  WeatherView+UI.swift
//  Weather
//
//  Created by Shafeer Puthalan on 18.03.23.
//

import Foundation
extension WeatherView {
    func setupUI() {
        backgroundColor = .rgb(red: 58, green: 130, blue: 247, alpha: 1)
        setupLayoutSubviews()
        setupLayoutConstraints()
    }
    
    private func setupLayoutSubviews() {
        addSubview(cityLabel)
        addSubview(dateLabel)
        addSubview(temperatureLabel)
        addSubview(windspeedImage)
        addSubview(windspeedLabel)
        addSubview(windspeedValueLabel)
        addSubview(bannerImageView)
    }
    
    private func setupLayoutConstraints() {
        cityLabel.anchors(top: topAnchor,
                          topConstants: 24,
                          leading: leadingAnchor,
                          leadingConstants: 24,
                          trailing: trailingAnchor,
                          trailingConstants: -24)
        dateLabel.anchors(top: cityLabel.bottomAnchor,
                          topConstants: 5,
                          leading: leadingAnchor,
                          leadingConstants: 24,
                          trailing: trailingAnchor,
                          trailingConstants: -24)
        temperatureLabel.anchors(top: dateLabel.bottomAnchor,
                                 topConstants: 35,
                                 trailing: trailingAnchor,
                                 trailingConstants: -24)
        windspeedImage.anchors(top: dateLabel.bottomAnchor,
                               topConstants: 40,
                               leading: leadingAnchor,
                               leadingConstants: 24,
                               heightConstants: 40,
                               widthConstants: 40)
        windspeedLabel.anchors(top: windspeedImage.topAnchor,
                               leading: windspeedImage.trailingAnchor,
                               leadingConstants: 10,
                               trailing: temperatureLabel.leadingAnchor,
                               trailingConstants: -10)
        windspeedValueLabel.anchors(top: windspeedLabel.bottomAnchor,
                                    topConstants: 10,
                                    leading: windspeedLabel.leadingAnchor,
                                    trailing: windspeedLabel.trailingAnchor)
        bannerImageView.anchors(leading: leadingAnchor,
                                bottom: bottomAnchor,
                                bottomConstants: -50,
                                trailing: trailingAnchor,
                                heightConstants: 200)
    }
}
