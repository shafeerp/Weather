//
//  WeatherTestConstants.swift
//  WeatherTests
//
//  Created by Shafeer Puthalan on 22.03.23.
//

struct WeatherTestConstants {
    
    /// Common network failure message
    static let APIFailed = "Something went wrong. Please try again!"
    
    enum Networking {
        static let InvalidRequest = "InvalidRequest"
        static let ServerError = "ServerError"
        static let ParsingError = "ParsingError"
    }
    
    enum Common {
        static let TestURL = "test.com"
        static let Success = "Success"
        static let TestValue = "TestValue"
        static let testExpection = "Test Expectation"
    }
}

