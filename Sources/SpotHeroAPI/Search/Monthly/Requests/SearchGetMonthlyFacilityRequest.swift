// Copyright © 2020 SpotHero, Inc. All rights reserved.

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
    struct Parameters: SearchTracking, Encodable {
        private enum CodingKeys: String, CodingKey {
            case startDate = "starts"
        }
        
        /// Start date from which results will be generated. The supported format is YYYY-MM-DD.
        /// If this parameter is not provided, results will be generated from the date at which the request was received.
        private let startDate: Date?
        
        var actionID: String?
        var analyticsID: String?
        var searchID: String?
        var sessionID: String?
        
        public init(startDate: Date? = nil,
                    searchTracking: SearchTrackingParameters? = nil) {
            self.startDate = startDate
            
            self.actionID = searchTracking?.actionID
            self.analyticsID = searchTracking?.analyticsID
            self.searchID = searchTracking?.searchID
            self.sessionID = searchTracking?.sessionID
        }
    }
}

extension SearchGetMonthlyFacilityRequest.Parameters: ParameterDictionaryConvertible {
    public func asParameterDictionary() -> [String: Any]? {
        var parameters: [String: Any] = [:]
        
        if let startDate = self.startDate {
            parameters[Self.CodingKeys.startDate.rawValue] = ISO8601DateFormatter().string(from: startDate)
        }
        
        return parameters
    }
}
