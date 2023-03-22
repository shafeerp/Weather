//
//  AppSettingsManager.swift
//  Weather
//
//  Created by Shafeer Puthalan on 22.03.23.
//

import UIKit

protocol AppSettingsProtocol {
    func showAppSettings()
}

class AppSettingsManager: AppSettingsProtocol {
    func showAppSettings() {
        if let url = URL(string: UIApplication.openSettingsURLString) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}

