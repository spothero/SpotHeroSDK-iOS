// Copyright © 2023 SpotHero, Inc. All rights reserved.

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
    let interceptor: RequestInterceptor

    init(client: NetworkClient, interceptor: RequestInterceptor) {
        self.client = client
        self.interceptor = interceptor
    }

    @discardableResult
    public func callAsFunction(parameters: Parameters,
                               completion: @escaping RequestCompletion<ResponseModel>) -> Request? {
        return self.client.request(
            Self.self,
            parameters: parameters,
            interceptor: interceptor,
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
            case isOversize = "oversize"
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

            case includeWalkingDistance = "include_walking_distance"
            
            case inFacilityExclusionExperiment = "in_fac_excl_exp"
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
        
        /// The work address latitude associated with the user’s commuter benefits card. Latitude must be in [-90, 90].
        private let workLatitude: Double?
        
        /// The work address longitude associated with the user’s commuter benefits card. Longitude must be in [-180, 180].
        private let workLongitude: Double?
        
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
        /// The default is 804.672 meters (.5 miles). The value is capped at 8046.72 meters (5 miles).
        private let maxDistanceMeters: Double?

        /// A boolean value indicating whether to include the walking distance information in the response or not.
        private let includeWalkingDistance: Bool
        
        /// The number of results to include in a single page.
        /// The default is nil (no limit). Must be >= 1, if provided.
        private let pageSize: Int?
        
        /// A boolean value indicating whether or not the client is included in the facility exclusion experiment.
        private let inFacilityExclusionExperiment: Bool?
        
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
                    endDate: Date? = nil,
                    isOversize: Bool? = nil,
                    maxDistanceMeters: Double? = nil,
                    includeWalkingDistance: Bool = true,
                    inFacilityExclusionExperiment: Bool? = nil,
                    pageSize: Int? = nil,
                    searchTracking: SearchTrackingParameters? = nil) {
            self.latitude = latitude
            self.longitude = longitude
            self.originLatitude = originLatitude
            self.originLongitude = originLongitude
            self.workLatitude = workLatitude
            self.workLongitude = workLongitude
            self.startDate = startDate
            self.endDate = endDate
            self.isOversize = isOversize
            self.maxDistanceMeters = maxDistanceMeters
            self.includeWalkingDistance = includeWalkingDistance
            self.inFacilityExclusionExperiment = inFacilityExclusionExperiment
            self.pageSize = pageSize
            
            self.actionID = searchTracking?.actionID
            self.fingerprint = searchTracking?.fingerprint
            self.searchID = searchTracking?.searchID
            self.sessionID = searchTracking?.sessionID
        }
    }
}
