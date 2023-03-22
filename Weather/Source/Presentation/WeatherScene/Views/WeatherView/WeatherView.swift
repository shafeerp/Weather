//
//  CurrentWeatherView.swift
//  Weather
//
//  Created by Shafeer Puthalan on 18.03.23.
//

import UIKit
class WeatherView: UIView {
    
    lazy var cityLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = .white
        return label
    }()
    
    lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 16, weight: .light)
        return label
    }()
    
    lazy var temperatureLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 60, weight: .heavy)
        label.textColor = .white
        label.textAlignment = .right
        return label
    }()
    
    lazy var windspeedImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "wind.circle.fill")
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
        imageView.tintColor = .white
        return imageView
    }()
    
    lazy var windspeedLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 16, weight: .light)
        label.text = "Wind Speed"
        label.textAlignment = .left
        return label
    }()
    
    lazy var windspeedValueLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textAlignment = .left
        return label
    }()
    
    lazy var bannerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "City")
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
