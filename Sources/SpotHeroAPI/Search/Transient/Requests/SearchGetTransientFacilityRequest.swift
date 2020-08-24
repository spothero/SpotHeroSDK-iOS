// Copyright © 2020 SpotHero, Inc. All rights reserved.

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

public extension SearchGetTransientFacilityRequest {
    /// Represents the query parameters used for fetching a transient facility.
    struct Parameters: Encodable {
        private enum CodingKeys: String, CodingKey {
            case endDate = "ends"
            case isOversize = "oversize"
            case startDate = "starts"
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
        
        public init(startDate: Date? = nil,
                    endDate: Date? = nil,
                    isOversize: Bool? = nil) {
            self.startDate = startDate
            self.endDate = endDate
            self.isOversize = isOversize
        }
    }
}

extension SearchGetTransientFacilityRequest.Parameters: ParameterDictionaryConvertible {
    public func asParameterDictionary() -> [String: Any]? {
        var parameters: [String: Any] = [:]
        parameters[Self.CodingKeys.isOversize.rawValue] = self.isOversize
        
        if let startDate = self.startDate {
            parameters[Self.CodingKeys.startDate.rawValue] = ISO8601DateFormatter().string(from: startDate)
        }
        
        if let endDate = self.endDate {
            parameters[Self.CodingKeys.endDate.rawValue] = ISO8601DateFormatter().string(from: endDate)
        }
        
        return parameters
    }
}
