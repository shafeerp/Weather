//
//  APIClientTest.swift
//  WeatherTests
//
//  Created by Shafeer Puthalan on 22.03.23.
//

@testable import Weather
import XCTest

class APIClientTest: XCTestCase {
    var apiClient: WeatherNetworkingProtocol?
    
    override func setUp() {
        super.setUp()
        let configuration = URLSessionConfiguration.default
        configuration.protocolClasses = [NetworkingMock.self]
        apiClient = WeatherAPIClient(session: URLSession(configuration: configuration))
    }
    
    let requestModel = APIRequestModel(api: CurrentWeatherRouter.getCurrentWeather,
                                       bodyParams: ["key": "value"],
                                       queryParams: ["key": "value"],
                                       requestType: .GET)

    /// Test server error case
    func testAPIClient_ServerError() {
        guard let apiClient = apiClient, let url = URL(string: WeatherTestConstants.Common.TestURL),
              let response = HTTPURLResponse(url: url, statusCode: 400, httpVersion: nil, headerFields: nil) else {
            XCTFail()
            return
        }
        let serverErrorExpectation = expectation(description: WeatherTestConstants.Networking.ServerError)
        NetworkingMock.requestInfo = (nil,response)
        apiClient.fetchAPIResponse(with: requestModel) { (result: Result<WeatherMockModel, WeatherNetworkingError>) in
            guard case .failure(let value) = result else {
                XCTFail()
                return
            }
            XCTAssertEqual(WeatherNetworkingError.ServerError(WeatherTestConstants.APIFailed), value)
            serverErrorExpectation.fulfill()
        }
        waitForExpectations(timeout: 1, handler: nil)
    }

    /// Test Decording error
    func testAPIClient_ParsingError() {
        guard let apiClient = apiClient,let url = URL(string: WeatherTestConstants.Common.TestURL), let response = HTTPURLResponse(url: url, statusCode: 200, httpVersion: nil, headerFields: nil) else {
            XCTFail()
            return
        }
        let parsingErrorExpectation = expectation(description: WeatherTestConstants.Networking.ParsingError)
        let mockResponseData = WeatherTestConstants.Common.Success.data(using: .utf8)
        NetworkingMock.requestInfo = (mockResponseData,response)
        apiClient.fetchAPIResponse(with: requestModel) { (result: Result<WeatherMockModel, WeatherNetworkingError>) in
            guard case .failure(let value) = result else {
                XCTFail()
                return
            }
            XCTAssertEqual(value, WeatherNetworkingError.ParsingError)
            parsingErrorExpectation.fulfill()
        }
        waitForExpectations(timeout: 1, handler: nil)
    }

    /// Test Request error
    func testAPIClient_InvalidRequest() {
        guard let apiClient = apiClient,let url = URL(string: WeatherTestConstants.Common.TestURL), let response = HTTPURLResponse(url: url, statusCode: 404, httpVersion: nil, headerFields: nil) else {
            XCTFail()
            return
        }
        let invalidRequestExpectation = expectation(description: WeatherTestConstants.Networking.InvalidRequest)
        let mockResponseData = """
        {
            "status_code":"404"
            "error_message":"invalid param"
        }
        """.data(using: .utf8)
        NetworkingMock.requestInfo = (mockResponseData,response)
        apiClient.fetchAPIResponse(with: requestModel) { (result: Result<WeatherMockModel, WeatherNetworkingError>) in
            guard case .failure(let value) = result else {
                XCTFail()
                return
            }
            XCTAssertEqual(value, WeatherNetworkingError.InvalidRequest(mockResponseData ?? Data()))
            invalidRequestExpectation.fulfill()
        }
        waitForExpectations(timeout: 1, handler: nil)
    }

    /// Test success case
    func testNetworkingManager_Success() {
        guard let apiClient = apiClient,let url = URL(string: WeatherTestConstants.Common.TestURL), let response = HTTPURLResponse(url: url, statusCode: 200, httpVersion: nil, headerFields: nil) else {
            XCTFail()
            return
        }
        let successExpectation = expectation(description: WeatherTestConstants.Common.Success)
        let mockResponseData = """
           {
               "name":"TestValue"
           }
           """.data(using: .utf8)
        NetworkingMock.requestInfo = (mockResponseData,response)
        apiClient.fetchAPIResponse(with: requestModel) { (result: Result<WeatherMockModel, WeatherNetworkingError>) in
            guard case .success(let value) = result else {
                XCTFail()
                return
            }
            XCTAssertEqual(value.name, WeatherTestConstants.Common.TestValue)
            successExpectation.fulfill()
        }
        waitForExpectations(timeout: 1, handler: nil)
    }
    
    func testWebConfiguration() {
        XCTAssertEqual(WeatherAPIConfigurations.weatherAPIBaseURL(), "https://api.open-meteo.com")
    }
    
    override func tearDown() {
        apiClient = nil
        super.tearDown()
    }
}
