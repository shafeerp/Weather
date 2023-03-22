//
//  WeatherWelcomeView+UI.swift
//  Weather
//
//  Created by Shafeer Puthalan on 18.03.23.
//

extension WeatherWelcomeView {
    func setupUI() {
        backgroundColor = .rgb(red: 58, green: 130, blue: 247, alpha: 1)
        setupSubviews()
        setupConstraints()
    }
    
    private func setupSubviews() {
        addSubview(welcomeTextLabel)
        addSubview(welcomeDescriptionLabel)
        addSubview(locationButton)
        
    }
    
    private func setupConstraints() {
        welcomeTextLabel.anchors(top: topAnchor,
                                 topConstants: 5,
                                 centerX: centerXAnchor)
        welcomeDescriptionLabel.anchors(top: welcomeTextLabel.bottomAnchor,
                                        topConstants: 12,
                                        leading: leadingAnchor,
                                        leadingConstants: 12,
                                        trailing: trailingAnchor,
                                        trailingConstants: -12,
                                        centerX: centerXAnchor)
        locationButton.anchors(top: welcomeDescriptionLabel.bottomAnchor,
                               topConstants: 12,
                               bottom: bottomAnchor,
                               bottomConstants: -12,
                               heightConstants: 40,
                               widthConstants: 200,
                               centerX: centerXAnchor)
    }
}
