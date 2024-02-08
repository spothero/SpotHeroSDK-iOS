// Copyright © 2024 SpotHero, Inc. All rights reserved.

import Foundation
import UtilityBeltNetworking

/// Represents a request for fetching a monthly facility.
///
/// - See [searchMonthlyFacilityParking](https://api.spothero.com/v2/docs/#operation/searchMonthlyFacilityParking).
public struct SearchGetMonthlyFacilityRequest: RequestDefining {
    public typealias ResponseModel = MonthlyFacilitySearchResponse
    
    static let method: HTTPMethod = .get
    static let route = "/v2/search/monthly"
    
    let client: NetworkClient
    let interceptor: RequestInterceptor

    init(client: NetworkClient, interceptor: RequestInterceptor) {
        self.client = client
        self.interceptor = interceptor
    }

    @discardableResult
    public func callAsFunction(withID facilityID: Int,
                               parameters: Parameters? = nil,
                               completion: @escaping RequestCompletion<ResponseModel>) -> Request? {
        return self.client.request(
            route: "\(Self.route)/\(facilityID)",
            method: Self.method,
            interceptor: self.interceptor,
            parameters: parameters,
            completion: completion
        )
    }
}

// MARK: - Parameters

public extension SearchGetMonthlyFacilityRequest {
    /// Represents the query parameters used for fetching a monthly facility.
    struct Parameters: Encodable, SearchTracking, ParameterDictionaryConvertible {
        private enum CodingKeys: String, CodingKey {
            case startDate = "starts"
            case originLatitude = "origin_lat"
            case originLongitude = "origin_lon"
            case workLatitude = "work_lat"
            case workLongitude = "work_lon"
            case includeWalkingDistance = "include_walking_distance"
            
            case actionID = "action_id"
            case fingerprint
            case searchID = "search_id"
            case sessionID = "session_id"
        }
        
        /// Start date from which results will be generated. The supported format is YYYY-MM-DD.
        /// If this parameter is not provided, results will be generated from the date at which the request was received.
        private let startDate: Date?

        /// Latitude in decimal degrees of origin from where each result's distance will be calculated.
        /// Intended use case is to accurately calculate result distances from the initial search location after panning to a new area on the map.
        /// Must be specified with `originLongitude` parameter, if applicable. Origin latitude must be in [-90, 90].
        private let originLatitude: Double?

        /// Longitude in decimal degrees of origin from where each result's distance will be calculated.
        /// Intended use case is to accurately calculate result distances from the initial search location after panning to a new area on the map.
        /// Must be specified with `originLatitude` parameter, if applicable. Origin longitude must be in [-180, 180].
        private let originLongitude: Double?
        
        /// The work address latitude associated with the user’s commuter benefits card. Latitude must be in [-90, 90].
        private let workLatitude: Double?
        
        /// The work address longitude associated with the user’s commuter benefits card. Longitude must be in [-180, 180].
        private let workLongitude: Double?

        /// A boolean value indicating whether to include the walking distance information in the response or not.
        private let includeWalkingDistance: Bool
        
        let actionID: String?
        let fingerprint: String?
        let searchID: String?
        let sessionID: String?
        
        public init(startDate: Date? = nil,
                    originLatitude: Double? = nil,
                    originLongitude: Double? = nil,
                    workLatitude: Double? = nil,
                    workLongitude: Double? = nil,
                    includeWalkingDistance: Bool = true,
                    searchTracking: SearchTrackingParameters? = nil) {
            self.startDate = startDate
            self.originLatitude = originLatitude
            self.originLongitude = originLongitude
            self.workLatitude = workLatitude
            self.workLongitude = workLongitude
            self.includeWalkingDistance = includeWalkingDistance
            
            self.actionID = searchTracking?.actionID
            self.fingerprint = searchTracking?.fingerprint
            self.searchID = searchTracking?.searchID
            self.sessionID = searchTracking?.sessionID
        }
    }
}
