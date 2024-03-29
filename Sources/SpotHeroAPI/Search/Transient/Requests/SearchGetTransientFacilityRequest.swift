// Copyright © 2024 SpotHero, Inc. All rights reserved.

import Foundation
import UtilityBeltNetworking

/// Represents a request for fetching a transient facility.
///
/// - See [searchTransientFacilityParking](https://api.spothero.com/v2/docs/#operation/searchTransientFacilityParking).
public struct SearchGetTransientFacilityRequest: RequestDefining {
    public typealias ResponseModel = TransientFacilitySearchResponse
    
    static let method: HTTPMethod = .get
    static let route = "/v2/search/transient"
    
    let client: NetworkClient
    
    init(client: NetworkClient) {
        self.client = client
    }
    
    @discardableResult
    public func callAsFunction(withID facilityID: Int,
                               parameters: Parameters? = nil,
                               completion: @escaping RequestCompletion<ResponseModel>) -> Request? {
        return self.client.request(
            route: "\(Self.route)/\(facilityID)",
            method: Self.method,
            parameters: parameters,
            completion: completion
        )
    }
}

// MARK: - Parameters

public extension SearchGetTransientFacilityRequest {
    /// Represents the query parameters used for fetching a transient facility.
    struct Parameters: Encodable, SearchTracking, ParameterDictionaryConvertible {
        private enum CodingKeys: String, CodingKey {
            case endDate = "ends"
            case isOversize = "oversize"
            case startDate = "starts"
            case originLatitude = "origin_lat"
            case originLongitude = "origin_lon"
            case workLatitude = "work_lat"
            case workLongitude = "work_lon"
            
            case actionID = "action_id"
            case fingerprint
            case searchID = "search_id"
            case sessionID = "session_id"

            case includeWalkingDistance = "include_walking_distance"
            case vehicleInfoId = "vehicle_info_id"
        }
        
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
        
        /// An optional vehicle info id.
        private let vehicleInfoId: Int?
        
        let actionID: String?
        let fingerprint: String?
        let searchID: String?
        let sessionID: String?
        
        public init(startDate: Date? = nil,
                    endDate: Date? = nil,
                    isOversize: Bool? = nil,
                    originLatitude: Double? = nil,
                    originLongitude: Double? = nil,
                    workLatitude: Double? = nil,
                    workLongitude: Double? = nil,
                    searchTracking: SearchTrackingParameters? = nil,
                    includeWalkingDistance: Bool = true,
                    vehicleInfoId: Int? = nil) {
            self.startDate = startDate
            self.endDate = endDate
            self.isOversize = isOversize
            self.originLatitude = originLatitude
            self.originLongitude = originLongitude
            self.workLatitude = workLatitude
            self.workLongitude = workLongitude
            self.vehicleInfoId = vehicleInfoId
            
            self.actionID = searchTracking?.actionID
            self.fingerprint = searchTracking?.fingerprint
            self.searchID = searchTracking?.searchID
            self.sessionID = searchTracking?.sessionID
            self.includeWalkingDistance = includeWalkingDistance
        }
    }
}
