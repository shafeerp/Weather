//
//  LocationServiceDelegate.swift
//  Weather
//
//  Created by Shafeer Puthalan on 18.03.23.
//
import CoreLocation

protocol LocationServiceDelegate: AnyObject {
    func tracingLocation(currentLocation: CLLocation)
    func tracingLocationDidFailWithError(error: NSError)
    func locationAuthChanged(status: LocationAccessStatus)
}

extension LocationServiceDelegate {
    func tracingLocation(currentLocation: CLLocation) { }
    func tracingLocationDidFailWithError(error: NSError) { }
    func locationAuthChanged(status: LocationAccessStatus) { }
}

protocol LocationServiceWrapperProtocol: AnyObject {
    var delegate: LocationServiceDelegate? { get set }
    var locationStatus: LocationAccessStatus { get }
    var currentLocation: UserLocation? { get }
    func requestLocationAcess()
    func startUpdatingLocation()
    func stopUpdatingLocation()
}


protocol UserLocation {
    var latitude: Double { get }
    var longitude: Double { get }
}

extension CLLocationCoordinate2D: UserLocation { }
