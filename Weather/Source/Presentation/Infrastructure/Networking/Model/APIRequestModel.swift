//
//  NetworkingRequestModel.swift
//  Weather
//
//  Created by Shafeer Puthalan on 20.03.23.
//

 struct APIRequestModel: APIModelType {
    var api: APIProtocol
    var bodyParams: [String: Any]?
    var queryParams: [String: String]?
    var headerParams: [String: String]?
    var requestType: WeatherRequestType
     
    init(api: APIProtocol,
         bodyParams: [String: Any]? = nil,
         queryParams: [String: String]? = nil,
         headerParams: [String: String]? = nil,
         requestType: WeatherRequestType) {
        self.api = api
        self.bodyParams = bodyParams
        self.queryParams = queryParams
        self.headerParams = headerParams
        self.requestType = requestType
    }
}

