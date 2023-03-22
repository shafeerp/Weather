//
//  LocationServiceWrapper.swift
//  Weather
//
//  Created by Shafeer Puthalan on 18.03.23.
//
import CoreLocation
class LocationServiceWrapper: NSObject, LocationServiceWrapperProtocol {

    weak var delegate: LocationServiceDelegate?
    private var locationManager: CLLocationManager
    var locationStatus: LocationAccessStatus {
        guard CLLocationManager.locationServicesEnabled() else { return .restricted }
        return getStatusFromCLAuthorizationStatus(status: locationManager.authorizationStatus)
    }
    
    override init() {
        self.locationManager = CLLocationManager()
        super.init()
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.distanceFilter = 200
    }
    
    var currentLocation: UserLocation? {
        return locationManager.location?.coordinate
    }
    
    func requestLocationAcess() {
        guard locationStatus != .available else {
            return
        }
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
    }
    
    func startUpdatingLocation() {
        self.locationManager.startUpdatingLocation()
    }
    
    func stopUpdatingLocation() {
        self.locationManager.stopUpdatingLocation()
    }
    
    private func getStatusFromCLAuthorizationStatus(status: CLAuthorizationStatus) -> LocationAccessStatus {
        switch status {
        case .restricted:
            return .restricted
        case .denied:
            return .denied
        case .authorizedAlways, .authorizedWhenInUse:
            return .available
        case .notDetermined:
            return .notAvaialable
        @unknown default:
            return .restricted
        }
    }
}

extension LocationServiceWrapper: CLLocationManagerDelegate {

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        updateLocation(currentLocation: location)
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        guard let delegate = delegate else { return }
        let status = getStatusFromCLAuthorizationStatus(status: manager.authorizationStatus)
        delegate.locationAuthChanged(status: status)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        updateLocationDidFailWithError(error: error as NSError)
    }
    
    private func updateLocation(currentLocation: CLLocation) {
        guard let delegate = delegate else { return }
        delegate.tracingLocation(currentLocation: currentLocation)
    }

    private func updateLocationDidFailWithError(error: NSError) {
        guard let delegate = delegate else { return }
        delegate.tracingLocationDidFailWithError(error: error)
    }
}
