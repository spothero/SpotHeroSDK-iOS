// Copyright © 2020 SpotHero, Inc. All rights reserved.

import Foundation
import UtilityBeltNetworking

/// Represents a request for fetching airport facilities.
///
/// - See [searchAirportParking](https://api.spothero.com/v2/docs/#operation/searchAirportParking).
public struct SearchGetAirportFacilitiesRequest: RequestDefining {
    public typealias ResponseModel = AirportFacilitiesSearchResponse
    
    static let method: HTTPMethod = .get
    static let route = "/v2/search/airport"
    
    let client: NetworkClient
    
    init(client: NetworkClient) {
        self.client = client
    }
    
    @discardableResult
    public func callAsFunction(parameters: Parameters,
                               completion: @escaping RequestCompletion<ResponseModel>) -> URLSessionTask? {
        return self.client.request(
            Self.self,
            parameters: parameters,
            completion: completion
        )
    }
}

// MARK: - Parameters

public extension SearchGetAirportFacilitiesRequest {
    /// Represents the query parameters used for fetching airport facilities.
    struct Parameters: Encodable {
        private enum CodingKeys: String, CodingKey {
            case airportCode = "airport"
            case endDate = "ends"
            case startDate = "starts"
            case pageSize = "page_size"
        }
        
        /// IATA airport code used as the origin position.
        private let airportCode: String
        
        /// Start datetime from which results will be generated. Supported formats are RFC3339 and YYYY-MM-DDTHH:MM:SS.
        /// If a time zone is not specified, the time will be localized to each generated facility's location.
        /// If this parameter is not provided, results will be generated from the time at which the request was received.
        private let startDate: Date?
        
        /// End datetime from which results will be generated. Supported formats are RFC3339 and YYYY-MM-DDTHH:MM:SS.
        /// If a time zone is not specified, the time will be localized to each generated facility's location.
        /// If this parameter is not provided, results will be generated for 3 hours after the start time.
        private let endDate: Date?
        
        /// The number of results to include in a single page.
        /// The default is nil (no limit). Must be >= 1, if provided.
        private let pageSize: Int?
        
        init(airportCode: String,
             startDate: Date? = nil,
             endDate: Date? = nil,
             pageSize: Int? = nil) {
            self.airportCode = airportCode
            self.startDate = startDate
            self.endDate = endDate
            self.pageSize = pageSize
        }
    }
}

extension SearchGetAirportFacilitiesRequest.Parameters: ParameterDictionaryConvertible {
    public func asParameterDictionary() -> [String: Any]? {
        var parameters: [String: Any] = [:]
        parameters[Self.CodingKeys.airportCode.rawValue] = self.airportCode
        
        if let startDate = self.startDate {
            parameters[Self.CodingKeys.startDate.rawValue] = ISO8601DateFormatter().string(from: startDate)
        }
        
        if let endDate = self.endDate {
            parameters[Self.CodingKeys.endDate.rawValue] = ISO8601DateFormatter().string(from: endDate)
        }
        
        if let pageSize = self.pageSize {
            parameters[Self.CodingKeys.pageSize.rawValue] = pageSize
        }
        
        return parameters
    }
}