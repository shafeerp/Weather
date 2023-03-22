//
//  NetworkingHelper+Protocols.swift
//  Weather
//
//  Created by Shafeer Puthalan on 20.03.23.
//

import Foundation

protocol APIProtocol {
    func apiBasepath() -> String
    func apiEndpath() -> String
}

protocol APIModelType {
    var api: APIProtocol {get set}
    var bodyParams: [String: Any]? {get set}
    var queryParams: [String: String]? {get set}
    var headerParams: [String: String]? { get set }
    var requestType: WeatherRequestType { get set }
}

protocol ConnectivityProtocol {
    func isInternetAvailable() -> Bool
}

protocol WeatherNetworkingProtocol {
    func fetchAPIResponse<T:Decodable>(with apiModel: APIModelType,
                             completion: @escaping NetworkingCompletion<T>)
}

protocol NetworkingParserProtocol {
    func parseResponse<T: Decodable>(data: Data, completion: NetworkingCompletion<T>)
}
typealias NetworkingCompletion<T: Decodable> = (Result<T, WeatherNetworkingError>) -> Void
typealias NetworkingResult<T: Decodable> = Result<T, WeatherNetworkingError>
