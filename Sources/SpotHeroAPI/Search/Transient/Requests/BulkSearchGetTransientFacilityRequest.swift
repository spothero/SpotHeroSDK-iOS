// Copyright © 2024 SpotHero, Inc. All rights reserved.

import Foundation
import UtilityBeltNetworking

/// Represents a request for fetching a transient facility.
///
/// - See [searchTransientFacilityParking](https://api.spothero.com/v2/docs/#operation/searchTransientFacilityParking).
public struct BulkSearchGetTransientFacilityRequest: RequestDefining {
    public typealias ResponseModel = BulkTransientFacilitySearchResponse

    static let method: HTTPMethod = .post
    static let route = "/v2/search/bulk/transient"

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
        guard var urlComponents = URLComponents(string: Self.route) else {
            return nil
        }

        urlComponents.queryItems = parameters?.queryParameters.asParameterDictionary()?.map { key, value in
            if let value = value as? String {
                return .init(name: key, value: value)
            }
            if let value = value as? Int {
                return .init(name: key, value: String(value))
            }
            if let value = value as? Double {
                return .init(name: key, value: String(value))
            }
            return .init(name: key, value: String(describing: value))
        }

        return self.client.request(
            route: Self.route.appending("/\(facilityID)?\(urlComponents.query ?? "")"),
            method: Self.method,
            parameters: parameters?.bodyParameters,
            interceptor: self.interceptor,
            completion: completion
        )
    }
}

// MARK: - Parameters

public extension BulkSearchGetTransientFacilityRequest {
    /// Represents the query parameters used for fetching a transient facility.
    struct Parameters: Encodable, SearchTracking, ParameterDictionaryConvertible {
        fileprivate struct QueryParameters: Encodable, SearchTracking, ParameterDictionaryConvertible {
            // swiftlint:disable nesting
            private enum CodingKeys: String, CodingKey {
                case originLatitude = "origin_lat"
                case originLongitude = "origin_lon"
                case workLatitude = "work_lat"
                case workLongitude = "work_lon"
                case actionID = "action_id"
                case fingerprint
                case searchID = "search_id"
                case sessionID = "session_id"
            }

            /// Latitude in decimal degrees of origin from where each result's distance will be calculated.
            /// Intended use case is to accurately calculate result distances from the initial search location after panning to a new area on the map.
            /// Must be specified with `originLongitude` parameter, if applicable. Origin latitude must be in [-90, 90].
            let originLatitude: Double?

            /// Longitude in decimal degrees of origin from where each result's distance will be calculated.
            /// Intended use case is to accurately calculate result distances from the initial search location after panning to a new area on the map.
            /// Must be specified with `originLatitude` parameter, if applicable. Origin longitude must be in [-180, 180].
            let originLongitude: Double?

            /// The work address latitude associated with the user’s commuter benefits card. Latitude must be in [-90, 90].
            let workLatitude: Double?

            /// The work address longitude associated with the user’s commuter benefits card. Longitude must be in [-180, 180].
            let workLongitude: Double?

            let actionID: String?
            let fingerprint: String?
            let searchID: String?
            let sessionID: String?
        }

        fileprivate struct BodyParameters: Encodable, ParameterDictionaryConvertible {
            // swiftlint:disable nesting
            private enum CodingKeys: String, CodingKey {
                case isOversize = "oversize"
                case periods
                case includeWalkingDistance = "include_walking_distance"
            }

            /// Boolean that denotes whether or not the pricing calculated for this vehicle
            /// will incorporate pricing for an oversize vehicle, if applicable.
            let isOversize: Bool?

            /// The periods to search for.
            let periods: [BulkSearchPeriod]?

            /// A boolean value indicating whether to include the walking distance information in the response or not.
            let includeWalkingDistance: Bool
        }

        fileprivate let queryParameters: QueryParameters
        fileprivate let bodyParameters: BodyParameters

        var actionID: String? {
            self.queryParameters.actionID
        }

        var fingerprint: String? {
            self.queryParameters.fingerprint
        }

        var searchID: String? {
            self.queryParameters.searchID
        }

        var sessionID: String? {
            self.queryParameters.sessionID
        }

        public init(periods: [BulkSearchPeriod]? = nil,
                    isOversize: Bool? = nil,
                    originLatitude: Double? = nil,
                    originLongitude: Double? = nil,
                    workLatitude: Double? = nil,
                    workLongitude: Double? = nil,
                    searchTracking: SearchTrackingParameters? = nil,
                    includeWalkingDistance: Bool = true) {
            self.queryParameters = .init(
                originLatitude: originLatitude,
                originLongitude: originLongitude,
                workLatitude: workLatitude,
                workLongitude: workLongitude,
                actionID: searchTracking?.actionID,
                fingerprint: searchTracking?.fingerprint,
                searchID: searchTracking?.searchID,
                sessionID: searchTracking?.sessionID
            )
            self.bodyParameters = .init(
                isOversize: isOversize,
                periods: periods,
                includeWalkingDistance: includeWalkingDistance
            )
        }
    }
}
