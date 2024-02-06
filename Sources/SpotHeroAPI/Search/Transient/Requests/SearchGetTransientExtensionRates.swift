// Copyright © 2023 SpotHero, Inc. All rights reserved.

import Foundation
import UtilityBeltNetworking

/// Represents a request for fetching a transient extension rate for a given facility.
///
/// https://spothero.atlassian.net/wiki/spaces/~253418099/pages/3102146728/POC+-+New+endpoint+for+extension+rates.
public struct SearchGetTransientExtensionRates: RequestDefining {
    public typealias ResponseModel = TransientRateExtensionResponse

    static let method: HTTPMethod = .get
    static let route = "/v2/search/extension_rates"

    let client: NetworkClient
    let interceptor: RequestInterceptor

    init(client: NetworkClient, interceptor: RequestInterceptor) {
        self.client = client
        self.interceptor = interceptor
    }

    @discardableResult
    public func callAsFunction(withID facilityID: Int,
                               parameters: Parameters,
                               completion: @escaping RequestCompletion<ResponseModel>) -> Request? {
        return self.client.request(
            route: "\(Self.route)/\(facilityID)",
            method: Self.method,
            parameters: parameters,
            interceptor: interceptor,
            completion: completion
        )
    }
}

// MARK: - Parameters

public extension SearchGetTransientExtensionRates {
    struct Parameters: Encodable, SearchTracking, ParameterDictionaryConvertible {
        private enum CodingKeys: String, CodingKey {
            case endDate = "ends"
            case startDate = "starts"
            case isOversize = "oversize"
            case rateIDs = "rate_ids"
            case extensionHours = "extension_hours"

            case actionID = "action_id"
            case fingerprint
            case searchID = "search_id"
            case sessionID = "session_id"
        }

        /// Start datetime from which results will be generated. Supported formats are RFC3339 and YYYY-MM-DDTHH:MM:SS.
        /// If a time zone is not specified, the time will be localized to each generated facility's location.
        /// If this parameter is not provided, results will be generated from the time at which the request was received.
        private let startDate: Date

        /// End datetime from which results will be generated. Supported formats are RFC3339 and YYYY-MM-DDTHH:MM:SS.
        /// If a time zone is not specified, the time will be localized to each generated facility's location.
        /// If this parameter is not provided, results will be generated for 3 hours after the start time.
        private let endDate: Date

        /// Boolean that denotes whether or not the pricing calculated for this vehicle
        /// will incorporate pricing for an oversize vehicle, if applicable.
        private let isOversize: Bool

        /// The rate IDs that the search facility returns.
        private let rateIDs: String
        
        /// The additional hours that will be added to the end time to generate the extension rate
        private let extensionHours: String

        let actionID: String?
        let fingerprint: String?
        let searchID: String?
        let sessionID: String?

        public init(startDate: Date,
                    endDate: Date,
                    isOversize: Bool,
                    rateIDs: String,
                    extensionHours: String,
                    searchTracking: SearchTrackingParameters) {
            self.startDate = startDate
            self.endDate = endDate
            self.isOversize = isOversize
            self.rateIDs = rateIDs
            self.extensionHours = extensionHours

            self.actionID = searchTracking.actionID
            self.fingerprint = searchTracking.fingerprint
            self.searchID = searchTracking.searchID
            self.sessionID = searchTracking.sessionID
        }
    }
}
