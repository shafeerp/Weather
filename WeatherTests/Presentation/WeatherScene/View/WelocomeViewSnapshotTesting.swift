//
//  WelocomeViewSnapshotTesting.swift
//  WeatherTests
//
//  Created by Shafeer Puthalan on 22.03.23.
//

import XCTest
import SnapshotTesting
@testable import Weather

final class WelocomeViewSnapshotTesting: XCTestCase {
    
    func testWelcomeView() {
        let welcomeView = WeatherWelcomeView(frame: CGRect(x: 0, y: 0, width: 500, height: 300))
        assertSnapshot(matching: welcomeView, as: .image(precision: 0.99))
    }
}
