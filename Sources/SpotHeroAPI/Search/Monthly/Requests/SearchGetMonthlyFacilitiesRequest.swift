// Copyright © 2020 SpotHero, Inc. All rights reserved.

import Foundation
import UtilityBeltNetworking

/// Represents a request for fetching monthly facilities.
///
/// - See [searchMonthlyParking](https://api.spothero.com/v2/docs/#operation/searchMonthlyParking).
public struct SearchGetMonthlyFacilitiesRequest: RequestDefining {
    public typealias ResponseModel = MonthlyFacilitiesSearchResponse
    
    static let method: HTTPMethod = .get
    static let route = "/v2/search/monthly"
    
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

public extension SearchGetMonthlyFacilitiesRequest {
    /// Represents the query parameters used for fetching monthly facilities.
    struct Parameters: Encodable, ParameterDictionaryConvertible {
        private enum CodingKeys: String, CodingKey {
            case latitude = "lat"
            case longitude = "lon"
            case startDate = "starts"
            case maxDistanceMeters = "max_distance_meters"
            case pageSize = "page_size"
        }
        
        /// Latitude in decimal degrees of origin from where the search will be performed. Latitude must be in [-90, 90].
        private let latitude: Double
        
        /// Longitude in decimal degrees of origin from where the search will be performed. Longitude must be in [-180, 180].
        private let longitude: Double
        
        /// Start date from which results will be generated. Supported formats are RFC3339 and YYYY-MM-DD.
        /// If this parameter is not provided, results will be generated from the date at which the request was received.
        private let startDate: Date?
        
        /// Maximum distance in meters from the origin from which facility results will be generated.
        /// The default is 1609.34 meters (1 mile). The limit is 160934 meters (100 miles).
        private let maxDistanceMeters: Int?
        
        /// The number of results to include in a single page.
        /// The default is nil (no limit). Must be >= 1, if provided.
        private let pageSize: Int?
        
        public init(latitude: Double,
                    longitude: Double,
                    startDate: Date? = nil,
                    maxDistanceMeters: Int? = nil,
                    pageSize: Int? = nil) {
            self.latitude = latitude
            self.longitude = longitude
            self.startDate = startDate
            self.maxDistanceMeters = maxDistanceMeters
            self.pageSize = pageSize
        }
    }
}
