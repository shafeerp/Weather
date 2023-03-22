//
//  NetworkingParser.swift
//  Weather
//
//  Created by Shafeer Puthalan on 20.03.23.
//

import Foundation
class NetworkingParser: NetworkingParserProtocol {
    
    func parseResponse<T>(data: Data, completion: (Result<T, WeatherNetworkingError>) -> Void) where T : Decodable {
        do {
            let model = try JSONDecoder().decode(T.self, from: data)
            completion(.success(model))
        }
        catch {
            completion(.failure(.ParsingError))
        }
    }
}
