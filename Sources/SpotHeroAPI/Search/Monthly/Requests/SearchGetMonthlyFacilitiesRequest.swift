// Copyright © 2021 SpotHero, Inc. All rights reserved.

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
    struct Parameters: Encodable, SearchTracking, ParameterDictionaryConvertible {
        private enum CodingKeys: String, CodingKey {
            case latitude = "lat"
            case longitude = "lon"
            case maxDistanceMeters = "max_distance_meters"
            case originLatitude = "origin_lat"
            case originLongitude = "origin_lon"
            case pageSize = "page_size"
            case startDate = "starts"
            case workLatitude = "work_lat"
            case workLongitude = "work_lon"
            
            case actionID = "action_id"
            case fingerprint
            case searchID = "search_id"
            case sessionID = "session_id"
        }
        
        /// Latitude in decimal degrees of origin from where the search will be performed. Latitude must be in [-90, 90].
        private let latitude: Double
        
        /// Longitude in decimal degrees of origin from where the search will be performed. Longitude must be in [-180, 180].
        private let longitude: Double
        
        /// Latitude in decimal degrees of origin from where each result's distance will be calculated.
        /// Intended use case is to accurately calculate result distances from the initial search location after panning to a new area on the map.
        /// Must be specified with `originLongitude` parameter, if applicable. If `originLatitude` and `originLongitude` are not populated,
        /// result distances are calculated from the required `latitude` and `longitude` parameters. Origin latitude must be in [-90, 90].
        private let originLatitude: Double?
        
        /// Longitude in decimal degrees of origin from where each result's distance will be calculated.
        /// Intended use case is to accurately calculate result distances from the initial search location after panning to a new area on the map.
        /// Must be specified with `originLatitude` parameter, if applicable. If `originLatitude` and `originLongitude` are not populated,
        /// result distances are calculated from the required `latitude` and `longitude` parameters. Origin longitude must be in [-180, 180].
        private let originLongitude: Double?
        
        /// Start date from which results will be generated. Supported formats are RFC3339 and YYYY-MM-DD.
        /// If this parameter is not provided, results will be generated from the date at which the request was received.
        private let startDate: Date?
        
        /// Maximum distance in meters from the origin from which facility results will be generated.
        /// The default is 1609.34 meters (1 mile). The limit is 160934 meters (100 miles).
        private let maxDistanceMeters: Int?
        
        /// The number of results to include in a single page.
        /// The default is nil (no limit). Must be >= 1, if provided.
        private let pageSize: Int?
        
        let actionID: String?
        let fingerprint: String?
        let searchID: String?
        let sessionID: String?
        
        public init(latitude: Double,
                    longitude: Double,
                    originLatitude: Double? = nil,
                    originLongitude: Double? = nil,
                    workLatitude: Double? = nil,
                    workLongitude: Double? = nil,
                    startDate: Date? = nil,
                    maxDistanceMeters: Int? = nil,
                    pageSize: Int? = nil,
                    searchTracking: SearchTrackingParameters? = nil) {
            self.latitude = latitude
            self.longitude = longitude
            self.originLatitude = originLatitude
            self.originLongitude = originLongitude
            self.workLatitude = workLatitude
            self.workLongitude = workLongitude
            self.startDate = startDate
            self.maxDistanceMeters = maxDistanceMeters
            self.pageSize = pageSize
            
            self.actionID = searchTracking?.actionID
            self.fingerprint = searchTracking?.fingerprint
            self.searchID = searchTracking?.searchID
            self.sessionID = searchTracking?.sessionID
        }
    }
}
