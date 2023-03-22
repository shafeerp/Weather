//
//  WeatherSceneUseCaseTest.swift
//  WeatherTests
//
//  Created by Shafeer Puthalan on 22.03.23.
//

import XCTest
@testable import Weather

class WeatherSceneUseCaseTest: XCTestCase {
    
    private func createSut(respository: IWeatherSceneRepository) -> WeatherUseCase {
        WeatherUseCase(weatherSceneRepositoy: respository)
    }
    
    private let requestModel = APIRequestModel(api: CurrentWeatherRouter.getCurrentWeather,
                                               bodyParams: ["key": "value"],
                                               queryParams: ["key": "value"],
                                               requestType: .GET)
    
    func testSuccessFlow() {
        let testExpectation = expectation(description: WeatherTestConstants.Common.testExpection)
        let sut = createSut(respository: MockWeatherSceneRepository())
        sut.fetchCurrentWeather(apiModel: requestModel) { completion in
            if case .failure(let error) = completion {
                XCTAssertEqual(error, .NoRequest)
                testExpectation.fulfill()
            } else {
                XCTFail()
            }
        }
        waitForExpectations(timeout: 1)
    }
}

class MockWeatherSceneRepository: IWeatherSceneRepository {
    func fetchCurrentWeather(apiModel: Weather.APIModelType, completion: @escaping (Weather.Completion) -> Void) {
        completion(.failure(.NoRequest))
    }
}
