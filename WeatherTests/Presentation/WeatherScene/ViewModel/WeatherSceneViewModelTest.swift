//
//  WeatherSceneViewModelTest.swift
//  WeatherTests
//
//  Created by Shafeer Puthalan on 22.03.23.
//

import XCTest
@testable import Weather

class WeatherSceneViewModelTest: XCTestCase {
    private func createSut(locationManager: LocationServiceManager,
                           useCase: WeatherSceneUsable) -> WeatherSceneViewModel {
        let sut = WeatherSceneViewModel(locationManager: locationManager,
                                        useCase: useCase)
        return sut
    }
    
    func testLocataionStatusDenied() {
        let sut = createSut(locationManager: LocationServiceManager(locationServiceWrapper: MockLocationService()),
                            useCase: MockWeatherSceneUsable())
        sut.showLocationDeniedAlert.bind { _ in
            XCTAssertEqual(sut.locationManager.locationStatus,
                           .denied)
        }
        sut.viewDidLoad()
    }
    
    func testLocataionStatusAvailable() {
        let sut = createSut(locationManager: LocationServiceManager(locationServiceWrapper: MockLocationService(tempLocationStatus: .available)),
                            useCase: MockWeatherSceneUsable())
        sut.renderUI.bind { status in
            XCTAssertEqual(status, .weatherScene)
        }
        sut.viewDidLoad()
    }
    
    func testLocataionStatusNotAvailable() {
        let sut = createSut(locationManager: LocationServiceManager(locationServiceWrapper: MockLocationService(tempLocationStatus: .notAvaialable)),
                            useCase: MockWeatherSceneUsable())
        sut.renderUI.bind { status in
            XCTAssertEqual(status, .welcome)
        }
        sut.viewDidLoad()
    }
    
    func testFetchingWeatherInfoSuccess() {
        let testExpectation = expectation(description: WeatherTestConstants.Common.testExpection)
        let mockWeatherInfo = MockWeatherInfo()
        let mockUserLocation = MockUserLocation(latitude: 12, longitude: 12)
        let sut = createSut(locationManager: LocationServiceManager(locationServiceWrapper: MockLocationService(tempLocationStatus: .available,
                                                                                                               tempCurrentLocation: mockUserLocation)),
                            useCase: MockWeatherSceneUsable(successCompletion: .success(mockWeatherInfo)))
        sut.renderUI.bind { status in
            XCTAssertEqual(status, .weatherScene)
        }
        sut.loadWeatherData.bind { info in
            XCTAssertEqual(mockWeatherInfo.timeZone, info?.timeZone)
            testExpectation.fulfill()
        }
        sut.viewDidLoad()
        waitForExpectations(timeout: 1.0)
    }
    
    func testFetchingWeatherInfoFailure() {
        let testExpectation = expectation(description: WeatherTestConstants.Common.testExpection)
        let mockUserLocation = MockUserLocation(latitude: 12, longitude: 12)
        let sut = createSut(locationManager: LocationServiceManager(locationServiceWrapper: MockLocationService(tempLocationStatus: .available,
                                                                                                               tempCurrentLocation: mockUserLocation)),
                            useCase: MockWeatherSceneUsable(failureCompletion: .failure(.NoRequest)))
        sut.renderUI.bind { status in
            XCTAssertEqual(status, .weatherScene)
        }
        sut.onError.bind { info in
            XCTAssertEqual(info , .NoRequest)
            testExpectation.fulfill()
        }
        sut.viewDidLoad()
        waitForExpectations(timeout: 1.0)
    }
}

class MockLocationService: LocationServiceWrapperProtocol {
    private let tempLocationStatus: LocationAccessStatus?
    private let tempCurrentLocation: UserLocation?
    var isLocationAccessRequested: Bool = false
    
    init(tempLocationStatus: LocationAccessStatus? = nil,
         tempCurrentLocation: UserLocation? = nil) {
        self.tempLocationStatus = tempLocationStatus
        self.tempCurrentLocation = tempCurrentLocation
    }
    
    var locationStatus: LocationAccessStatus {
        return tempLocationStatus ?? .denied
    }
    
    var delegate: Weather.LocationServiceDelegate?
    
    var currentLocation: Weather.UserLocation? {
        return tempCurrentLocation
    }
    
    func requestLocationAcess() {
        isLocationAccessRequested = true
    }
    
    func startUpdatingLocation() {
        
    }
    
    func stopUpdatingLocation() {
        
    }
    
    
   
}
class MockWeatherSceneUsable: WeatherSceneUsable {
    let mockWeatherInfo = MockWeatherInfo()
    let successCompletion: (Result<WeatherInfo, WeatherNetworkingError>)?
    let failureCompletion: (Result<WeatherInfo, WeatherNetworkingError>)?
    
    init(successCompletion: Result<WeatherInfo, WeatherNetworkingError>? = nil,
         failureCompletion: Result<WeatherInfo, WeatherNetworkingError>? = nil) {
        self.successCompletion = successCompletion
        self.failureCompletion = failureCompletion
    }
    
    func fetchCurrentWeather(apiModel: Weather.APIModelType, completion: @escaping (Weather.Completion) -> Void) {
        if successCompletion != nil {
            completion(successCompletion!)
        } else if failureCompletion  != nil {
            completion(failureCompletion!)
        }
    }
    
    
}
struct MockWeatherInfo: WeatherInfo {
    var time: String = "test"
    var timeZone: String = "test"
    var temperature: String = "test"
    var windspeed: String = "test"
}

struct MockUserLocation: UserLocation {
    var latitude: Double
    var longitude: Double
}



