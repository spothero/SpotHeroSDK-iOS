// Copyright © 2024 SpotHero, Inc. All rights reserved.

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
                               completion: @escaping RequestCompletion<ResponseModel>) -> Request? {
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
    struct Parameters: Encodable, SearchTracking, ParameterDictionaryConvertible {
        private enum CodingKeys: String, CodingKey {
            case endDate = "ends"
            case iataCode = "iata"
            case isOversize = "oversize"
            case pageSize = "page_size"
            case startDate = "starts"
            
            case actionID = "action_id"
            case fingerprint
            case searchID = "search_id"
            case sessionID = "session_id"
        }
        
        /// IATA airport code used as the origin position.
        private let iataCode: String
        
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
        
        /// The number of results to include in a single page.
        /// The default is nil (no limit). Must be >= 1, if provided.
        private let pageSize: Int?
        
        let actionID: String?
        let fingerprint: String?
        let searchID: String?
        let sessionID: String?
        
        public init(iataCode: String,
                    startDate: Date? = nil,
                    endDate: Date? = nil,
                    isOversize: Bool? = nil,
                    pageSize: Int? = nil,
                    searchTracking: SearchTrackingParameters? = nil) {
            self.iataCode = iataCode
            self.startDate = startDate
            self.endDate = endDate
            self.isOversize = isOversize
            self.pageSize = pageSize
            
            self.actionID = searchTracking?.actionID
            self.fingerprint = searchTracking?.fingerprint
            self.searchID = searchTracking?.searchID
            self.sessionID = searchTracking?.sessionID
        }
    }
}
