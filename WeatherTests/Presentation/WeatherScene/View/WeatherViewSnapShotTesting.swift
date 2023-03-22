//
//  WeatherViewSnapShotTesting.swift
//  WeatherTests
//
//  Created by Shafeer Puthalan on 22.03.23.
//

import XCTest
import SnapshotTesting
@testable import Weather

final class WeatherViewSnapShotTesting: XCTestCase {
    
    func testWeatherView() {
        let view = WeatherView(frame: .init(x: 0, y: 0, width: 400, height: 600))
        view.cityLabel.text = "Berlin"
        view.dateLabel.text = "10th March 2023"
        view.temperatureLabel.text = "30"
        view.windspeedValueLabel.text = "10 m/s"
        assertSnapshot(matching: view, as: .image(precision: 0.99))
    }
}
