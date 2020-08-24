// Copyright © 2020 SpotHero, Inc. All rights reserved.

import Foundation
import UtilityBeltNetworking

/// Represents a request for fetching transient facilities.
///
/// - See [searchTransientParking](https://api.spothero.com/v2/docs/#operation/searchTransientParking).
public struct SearchGetTransientFacilitiesRequest: RequestDefining {
    public typealias ResponseModel = TransientFacilitiesSearchResponse
    
    static let method: HTTPMethod = .get
    static let route = "/v2/search/transient"
    
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

public extension SearchGetTransientFacilitiesRequest {
    /// Represents the query parameters used for fetching transient facilities.
    struct Parameters: Encodable, SearchTracking, ParameterDictionaryConvertible {
        private enum CodingKeys: String, CodingKey {
            case endDate = "ends"
            case latitude = "lat"
            case longitude = "lon"
            case isOversize = "oversize"
            case startDate = "starts"
            case maxDistanceMeters = "max_distance_meters"
            case pageSize = "page_size"
        }
        
        /// Latitude in decimal degrees of origin from where the search will be performed. Latitude must be in [-90, 90].
        private let latitude: Double
        
        /// Longitude in decimal degrees of origin from where the search will be performed. Longitude must be in [-180, 180].
        private let longitude: Double
        
        /// Start datetime from which results will be generated. Supported formats are RFC3339 and YYYY-MM-DDTHH:MM:SS.
        /// If a time zone is not specified, the time will be localized to each generated facility's location.
        /// If this parameter is not provided, results will be generated from the time at which the request was received.
        private let startDate: Date?
        
        /// End datetime from which results will be generated. Supported formats are RFC3339 and YYYY-MM-DDTHH:MM:SS.
        /// If a time zone is not specified, the time will be localized to each generated facility's location.
        /// If this parameter is not provided, results will be generated for 3 hours after the start time.
        private let endDate: Date?
        
        /// Boolean that denotes whether or not the pricing calculated for this vehicle
        /// will incorporate pricing for an oversize vehicle, if applicable.
        private let isOversize: Bool?
        
        /// Maximum distance in meters from the origin from which facility results will be generated.
        /// The default is 1609.34 meters (1 mile). The limit is 160934 meters (100 miles).
        private let maxDistanceMeters: Int?
        
        /// The number of results to include in a single page.
        /// The default is nil (no limit). Must be >= 1, if provided.
        private let pageSize: Int?
        
        let actionID: String?
        let analyticsID: String?
        let searchID: String?
        let sessionID: String?
        
        public init(latitude: Double,
                    longitude: Double,
                    startDate: Date? = nil,
                    endDate: Date? = nil,
                    isOversize: Bool? = nil,
                    maxDistanceMeters: Int? = nil,
                    pageSize: Int? = nil,
                    searchTracking: SearchTrackingParameters? = nil) {
            self.latitude = latitude
            self.longitude = longitude
            self.startDate = startDate
            self.endDate = endDate
            self.isOversize = isOversize
            self.maxDistanceMeters = maxDistanceMeters
            self.pageSize = pageSize
            
            self.actionID = searchTracking?.actionID
            self.analyticsID = searchTracking?.analyticsID
            self.searchID = searchTracking?.searchID
            self.sessionID = searchTracking?.sessionID
        }
    }
}
