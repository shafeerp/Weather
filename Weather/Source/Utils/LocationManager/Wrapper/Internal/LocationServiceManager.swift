//
//  WeatherLocationManager.swift
//  Weather
//
//  Created by Shafeer Puthalan on 18.03.23.
//

import CoreLocation

class LocationServiceManager {
    
    private let locationServiceWrapper: LocationServiceWrapperProtocol
    
    init(locationServiceWrapper: LocationServiceWrapperProtocol = LocationServiceWrapper()) {
        self.locationServiceWrapper = locationServiceWrapper
    }
    
    var locationStatus: LocationAccessStatus {
        locationServiceWrapper.locationStatus
    }
    
    var currentLocation: UserLocation? {
        locationServiceWrapper.currentLocation
    }
    
    func requestLocationAcess() {
        locationServiceWrapper.requestLocationAcess()
    }
    
    func startUpdatingLocation() {
        locationServiceWrapper.startUpdatingLocation()
    }
    
    func stopUpdatingLocation() {
        locationServiceWrapper.stopUpdatingLocation()
    }
    
    func setDelegate(delegate: LocationServiceDelegate) {
        locationServiceWrapper.delegate = delegate
    }
    
    func removeDelegate() {
        locationServiceWrapper.delegate = nil
    }
}
