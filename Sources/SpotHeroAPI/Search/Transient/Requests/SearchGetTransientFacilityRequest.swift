// Copyright © 2020 SpotHero, Inc. All rights reserved.

import Foundation
import UtilityBeltNetworking

/// Represents a request for fetching transient facilities.
///
/// - See [searchTransientFacilityParking](https://s3.amazonaws.com/spothe.ro/craig-v2-api.html#operation/searchTransientFacilityParking).
public struct SearchGetTransientFacilityRequest: RequestDefining {
    public typealias ResponseModel = TransientFacilitySearchResponse
    
    static let method: HTTPMethod = .get
    static let route = "/v2/search/transient"
    
    let client: NetworkClient
    
    init(client: NetworkClient) {
        self.client = client
    }
    
    @discardableResult
    func callAsFunction(withID facilityID: Int,
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

extension SearchGetTransientFacilityRequest {
    /// Represents the query parameters used for fetching transient facilities.
    struct Parameters: Encodable {
        private enum CodingKeys: String, CodingKey {
            case endDate = "ends"
            case isOversize = "oversize"
            case startDate = "starts"
        }
        
        /// Start datetime from which results will be generated. Supported formats are RFC3339 and YYYY-MM-DDTHH:MM:SS.
        /// If a time zone is not specified, the time will be localized to each generated facility's location.
        /// If this parameter is not provided, results will be generated from the time at which the request was received.
        let startDate: Date?
        
        /// End datetime from which results will be generated. Supported formats are RFC3339 and YYYY-MM-DDTHH:MM:SS.
        /// If a time zone is not specified, the time will be localized to each generated facility's location.
        /// If this parameter is not provided, results will be generated for 3 hours after the start time.
        let endDate: Date?
        
        /// Boolean that denotes whether or not the pricing calculated for this vehicle
        /// will incorporate pricing for an oversize vehicle, if applicable.
        let isOversize: Bool?
        
        init(startDate: Date? = nil,
             endDate: Date? = nil,
             isOversize: Bool? = nil) {
            self.startDate = startDate
            self.endDate = endDate
            self.isOversize = isOversize
        }
    }
}

extension SearchGetTransientFacilityRequest.Parameters: ParameterDictionaryConvertible {
    func asParameterDictionary() -> [String: Any]? {
        var parameters: [String: Any] = [:]
        
        if let startDate = self.startDate {
            parameters[Self.CodingKeys.startDate.rawValue] = ISO8601DateFormatter().string(from: startDate)
        }
        
        if let endDate = self.endDate {
            parameters[Self.CodingKeys.endDate.rawValue] = ISO8601DateFormatter().string(from: endDate)
        }
        
        if let isOversize = self.isOversize {
            parameters[Self.CodingKeys.isOversize.rawValue] = isOversize
        }
        
        return parameters
    }
}
