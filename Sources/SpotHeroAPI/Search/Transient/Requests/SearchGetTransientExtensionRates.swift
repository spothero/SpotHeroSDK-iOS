// Copyright © 2023 SpotHero, Inc. All rights reserved.

import Foundation
import UtilityBeltNetworking

/// Represents a request for fetching a transient extension rate for a given facility.
///
/// https://spothero.atlassian.net/wiki/spaces/~253418099/pages/3102146728/POC+-+New+endpoint+for+extension+rates.
public struct SearchGetTransientExtensionRates: RequestDefining {
    public typealias ResponseModel = ExtensionQuote

    static let method: HTTPMethod = .get
    static let route = "/v2/search/extension_rates"

    let client: NetworkClient

    init(client: NetworkClient) {
        self.client = client
    }

    @discardableResult
    public func callAsFunction(withID facilityID: Int,
                               parameters: Parameters,
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

public extension SearchGetTransientExtensionRates {
    struct Parameters: Encodable, ParameterDictionaryConvertible {
        private enum CodingKeys: String, CodingKey {
            case endDate = "ends"
            case startDate = "starts"
            case isOversize = "oversize"
            case rateIDs = "rate_ids"
            case extensionHours = "extension_hours"
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

        /// The rate IDs that the search facility returns.
        private let rateIDs: String

        private let extensionHours: String

        public init(startDate: Date?, endDate: Date?, isOversize: Bool?, rateIDs: String, extensionHours: String) {
            self.startDate = startDate
            self.endDate = endDate
            self.isOversize = isOversize
            self.rateIDs = rateIDs
            self.extensionHours = extensionHours
        }
    }
}
