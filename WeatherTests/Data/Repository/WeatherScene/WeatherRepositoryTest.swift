//
//  WeatherRepositoryTest.swift
//  WeatherTests
//
//  Created by Shafeer Puthalan on 22.03.23.
//

@testable import Weather
import XCTest

class WeatherRepositoryTest: XCTestCase {
    
    private func createRepositorySuit(networkingManager: WeatherAPIClient) -> WeatherSceneRepository {
        WeatherSceneRepository(networkingManager: networkingManager)
    }
    
    private let requestModel = APIRequestModel(api: CurrentWeatherRouter.getCurrentWeather,
                                               bodyParams: ["key": "value"],
                                               queryParams: ["key": "value"],
                                               requestType: .GET)
    
    private func createNetworkingMock() -> WeatherAPIClient {
        let configuration = URLSessionConfiguration.default
        configuration.protocolClasses = [NetworkingMock.self]
        return WeatherAPIClient(session: URLSession(configuration: configuration))
    }
    
    func testSucess() {
        let response = HTTPURLResponse(url: URL(string: WeatherTestConstants.Common.TestURL)!,
                                       statusCode: 200,
                                       httpVersion: nil,
                                       headerFields: nil)
        let sut = createRepositorySuit(networkingManager: createNetworkingMock())
        let testExpectation = expectation(description: WeatherTestConstants.Common.testExpection)
        let mockResponseData = """
        {
            "latitude": 40.4,
            "longitude": 20.21,
            "timezone": "TEST"
        }
        """.data(using: .utf8)
        NetworkingMock.requestInfo = (mockResponseData, response!)
        sut.fetchCurrentWeather(apiModel: requestModel) { result in
            switch result {
            case .success(let model):
                XCTAssertEqual(model.timeZone, "TEST")
                testExpectation.fulfill()
            case .failure:
                XCTFail()
            }
        }
        waitForExpectations(timeout: 5.0)
    }
        
    func testFailure() {
        let response = HTTPURLResponse(url: URL(string: WeatherTestConstants.Common.TestURL)!,
                                       statusCode: 404,
                                       httpVersion: nil,
                                       headerFields: nil)
        let sut = createRepositorySuit(networkingManager: createNetworkingMock())
        let mockResponseData = """
            {
                "status_code":"404"
                "error_message":"invalid param"
            }
            """.data(using: .utf8)
        let testExpectation = expectation(description: WeatherTestConstants.Common.testExpection)
        NetworkingMock.requestInfo = (mockResponseData, response!)
        sut.fetchCurrentWeather(apiModel: requestModel) { result in
            switch result {
            case .success:
                XCTFail()
            case .failure(let error):
                if case .InvalidRequest(let data) = error {
                    XCTAssertEqual(mockResponseData,
                                   data)
                    testExpectation.fulfill()
                } else {
                    XCTFail()
                }
            }
        }
        waitForExpectations(timeout: 1.0)
    }
}

    
