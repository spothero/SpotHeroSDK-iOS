// Copyright © 2021 SpotHero, Inc. All rights reserved.

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
    
    init(client: NetworkClient) {
        self.client = client
    }
    
    @discardableResult
    public func callAsFunction(withID facilityID: Int,
                               parameters: Parameters? = nil,
                               completion: @escaping RequestCompletion<ResponseModel>) -> URLSessionTask? {
        return self.client.request(
            route: "\(Self.route)/\(facilityID)",
            method: Self.method,
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
            case workLatitude = "work_lat"
            case workLongitude = "work_lon"
            
            case actionID = "action_id"
            case fingerprint
            case searchID = "search_id"
            case sessionID = "session_id"
        }
        
        /// Start date from which results will be generated. The supported format is YYYY-MM-DD.
        /// If this parameter is not provided, results will be generated from the date at which the request was received.
        private let startDate: Date?
        
        /// The work address latitude associated with the user’s commuter benefits card. Latitude must be in [-90, 90].
        private let workLatitude: Double?
        
        /// The work address longitude associated with the user’s commuter benefits card. Longitude must be in [-180, 180].
        private let workLongitude: Double?
        
        let actionID: String?
        let fingerprint: String?
        let searchID: String?
        let sessionID: String?
        
        public init(startDate: Date? = nil,
                    workLatitude: Double? = nil,
                    workLongitude: Double? = nil,
                    searchTracking: SearchTrackingParameters? = nil) {
            self.startDate = startDate
            self.workLatitude = workLatitude
            self.workLongitude = workLongitude
            
            self.actionID = searchTracking?.actionID
            self.fingerprint = searchTracking?.fingerprint
            self.searchID = searchTracking?.searchID
            self.sessionID = searchTracking?.sessionID
        }
    }
}
