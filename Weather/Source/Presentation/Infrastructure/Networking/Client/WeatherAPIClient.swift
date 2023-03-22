//
//  WeatherAPIClient.swift
//  Weather
//
//  Created by Shafeer Puthalan on 20.03.23.
//

import Foundation

class WeatherAPIClient: WeatherNetworkingProtocol {
    private let session : URLSession
    private let parser: NetworkingParserProtocol
    
    init(session : URLSession = URLSession.shared, parser: NetworkingParserProtocol = NetworkingParser()) {
        self.session = session
        self.parser = parser
    }
    /**
     This method handles network calls and provide result as completion block, either success (response model) or failure (error object)
     
     - Parameter apiModel: APIModelType
     - Parameter completion: Closure to handle success or Failure
     */
    func fetchAPIResponse<T:Decodable>(with apiModel: APIModelType,
                                       completion: @escaping NetworkingCompletion<T>) {
        guard let request = apiModel.asURLRequest() else {
            completion(.failure(.NoRequest))
            return
        }
        session.dataTask(with: request) { (data, urlResponse, error) in
            guard let responseData = data, error == nil else {
                completion(.failure(.ServerError(WeatherConstants.Networking.APIFailed)))
                return
            }
            if let httpStatus = urlResponse as? HTTPURLResponse, httpStatus.statusCode >= 200 && httpStatus.statusCode < 300,
               let data = data {
                self.parser.parseResponse(data: data, completion: completion)
            }else {
                completion(.failure(.InvalidRequest(responseData)))
            }
        }.resume()
    }
}



extension APIModelType {
    fileprivate func asURLRequest() -> URLRequest? {
        var urlComponent = URLComponents(string: api.apiBasepath())
        urlComponent?.path = api.apiEndpath()
        urlComponent?.queryItems = generateQueryParameters(with: queryParams)
        guard let url = urlComponent?.url else { return nil }
        var request = URLRequest(url: url)
        request.httpMethod = requestType.rawValue
        request.httpBody = generateHTTPBody(with: bodyParams)
        return request
    }
    
    private func generateQueryParameters(with queryParams: [String: String]?) -> [URLQueryItem]? {
        guard let queryParams = queryParams else { return nil }
        return queryParams.map {
            return URLQueryItem(name: "\($0)", value: "\($1)")
        }
    }
    
    private func generateHTTPBody(with values: [String: Any]?) -> Data? {
        guard let httpBody = values else { return nil }
        return try? JSONSerialization.data(withJSONObject: httpBody, options: .prettyPrinted)
    }
}
