//
//  NetworkingHelper+Enums.swift
//  Weather
//
//  Created by Shafeer Puthalan on 20.03.23.
//

import Foundation

/// URLRequest Type
enum WeatherRequestType: String {
    case GET
    case POST
}

/// Errors occurred during netwok calls
enum WeatherNetworkingError: Error, Equatable {
    /**
       If URLRequest is nil
    */
    case NoRequest
    /**
       If request is invalid, send data object considering to usefull for creating commmon error response model
    */
    case InvalidRequest(Data)
    /**
      if any networking error occurs
    */
    case ServerError(String)
    /**
       For any Decoding Error
    */
    case ParsingError
}
