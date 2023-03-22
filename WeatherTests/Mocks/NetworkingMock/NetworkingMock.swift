//
//  NetworkingMock.swift
//  WeatherTests
//
//  Created by Shafeer Puthalan on 22.03.23.
//

import Foundation
@testable import Weather

typealias MockeRequestInfo = (data:Data?,response:HTTPURLResponse)

/// Helps to mock Network calls
final class NetworkingMock: URLProtocol {
    
    static var requestInfo : MockeRequestInfo?
    
    override class func canInit(with request: URLRequest) -> Bool {
        return true
    }
    
    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }
    
    override class func requestIsCacheEquivalent(_ a: URLRequest, to b: URLRequest) -> Bool {
        return false
    }
   
    override func startLoading() {
        
        guard let requestInfo = NetworkingMock.requestInfo,let client = client else {
            fatalError()
        }
        client.urlProtocol(self, didReceive: requestInfo.response,cacheStoragePolicy: .notAllowed)
        
        if let data = requestInfo.data {
            client.urlProtocol(self, didLoad: data)
        }else {
            client.urlProtocol(self, didFailWithError: WeatherNetworkingError.ServerError(WeatherConstants.Networking.APIFailed))
        }
        client.urlProtocolDidFinishLoading(self)
    }
    
    override func stopLoading() { }
}



