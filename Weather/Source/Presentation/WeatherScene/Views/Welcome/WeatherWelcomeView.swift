//
//  WeatherWelcomeView.swift
//  Weather
//
//  Created by Shafeer Puthalan on 18.03.23.
//

import UIKit

class WeatherWelcomeView: UIView {
    
    lazy var welcomeTextLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = .white
        label.numberOfLines = 0
        label.text = WeatherConstants.WeatherScene.welcomeText
        return label
    }()
    
    lazy var welcomeDescriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.numberOfLines = 0
        label.textAlignment = .center
        label.text = WeatherConstants.WeatherScene.welcomeDescription
        return label
    }()
    
    lazy var locationButton: UIButton = {
        let button = UIButton(type: .system)
        button.configuration = UIButton.Configuration.filled()
        button.setTitle(WeatherConstants.WeatherScene.shareLocation, for: .normal)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
}

