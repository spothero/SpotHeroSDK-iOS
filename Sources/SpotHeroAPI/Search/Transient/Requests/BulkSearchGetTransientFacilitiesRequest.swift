// Copyright © 2024 SpotHero, Inc. All rights reserved.

import Foundation
import UtilityBeltNetworking

/// Represents a request for fetching transient facilities.
///
/// - See [searchBulkTransientParking](https://api.spothero.com/v2/docs/#operation/searchBulkTransientParking).
public struct BulkSearchGetTransientFacilitiesRequest: RequestDefining {
    public typealias ResponseModel = BulkTransientFacilitiesSearchResponse

    static let method: HTTPMethod = .post
    static let route = "/v2/search/bulk/transient"

    let client: NetworkClient

    init(client: NetworkClient) {
        self.client = client
    }

    @discardableResult
    public func callAsFunction(parameters: Parameters,
                               completion: @escaping RequestCompletion<ResponseModel>) -> Request? {
        guard var urlComponents = URLComponents(string: Self.route) else {
            return nil
        }

        urlComponents.queryItems = parameters.queryParameters.asParameterDictionary()?.map { key, value in
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
            route: Self.route.appending(urlComponents.query.map { "?\($0)" } ?? ""),
            method: Self.method,
            parameters: parameters.bodyParameters,
            completion: completion
        )
    }
}

// MARK: - Parameters

public extension BulkSearchGetTransientFacilitiesRequest {
    /// Represents the query parameters used for fetching transient facilities.
    struct Parameters: SearchTracking, ParameterDictionaryConvertible {
        fileprivate struct QueryParameters: Encodable, SearchTracking, ParameterDictionaryConvertible {
            // swiftlint:disable nesting
            private enum CodingKeys: String, CodingKey {
                case latitude = "lat"
                case longitude = "lon"
                case originLatitude = "origin_lat"
                case originLongitude = "origin_lon"
                case workLatitude = "work_lat"
                case workLongitude = "work_lon"
                case inFacilityExclusionExperiment = "in_fac_excl_exp"
                case actionID = "action_id"
                case fingerprint
                case searchID = "search_id"
                case sessionID = "session_id"
                case vehicleInfoId = "vehicle_info_id"
            }

            // swiftlint:enable nesting

            /// Latitude in decimal degrees of origin from where the search will be performed. Latitude must be in [-90, 90].
            let latitude: Double

            /// Longitude in decimal degrees of origin from where the search will be performed. Longitude must be in [-180, 180].
            let longitude: Double

            /// Latitude in decimal degrees of origin from where each result's distance will be calculated.
            /// Intended use case is to accurately calculate result distances from the initial search location after panning to a new area on the map.
            /// Must be specified with `originLongitude` parameter, if applicable. If `originLatitude` and `originLongitude` are not populated,
            /// result distances are calculated from the required `latitude` and `longitude` parameters. Origin latitude must be in [-90, 90].
            let originLatitude: Double?

            /// Longitude in decimal degrees of origin from where each result's distance will be calculated.
            /// Intended use case is to accurately calculate result distances from the initial search location after panning to a new area on the map.
            /// Must be specified with `originLatitude` parameter, if applicable. If `originLatitude` and `originLongitude` are not populated,
            /// result distances are calculated from the required `latitude` and `longitude` parameters. Origin longitude must be in [-180, 180].
            let originLongitude: Double?

            /// The work address latitude associated with the user’s commuter benefits card. Latitude must be in [-90, 90].
            let workLatitude: Double?

            /// The work address longitude associated with the user’s commuter benefits card. Longitude must be in [-180, 180].
            let workLongitude: Double?

            /// A boolean value indicating whether or not the client is included in the facility exclusion experiment.
            let inFacilityExclusionExperiment: Bool?
            
            /// An optional vehicle info id.
            let vehicleInfoId: Int?

            let actionID: String?
            let fingerprint: String?
            let searchID: String?
            let sessionID: String?
        }

        fileprivate struct BodyParameters: Encodable, ParameterDictionaryConvertible {
            // swiftlint:disable nesting
            private enum CodingKeys: String, CodingKey {
                case isOversize = "oversize"
                case maxDistanceMeters = "max_distance_meters"
                case pageSize = "page_size"
                case periods
                case includeWalkingDistance = "include_walking_distance"
                case sortBy = "sort_by"
            }

            // swiftlint:enable nesting

            /// The periods to search for.
            let periods: [BulkSearchPeriod]?

            /// Boolean that denotes whether or not the pricing calculated for this vehicle
            /// will incorporate pricing for an oversize vehicle, if applicable.
            let isOversize: Bool?

            /// Maximum distance in meters from the origin from which facility results will be generated.
            /// The default is 804.672 meters (.5 miles). The value is capped at 8046.72 meters (5 miles).
            let maxDistanceMeters: Double?

            /// A boolean value indicating whether to include the walking distance information in the response or not.
            let includeWalkingDistance: Bool
            
            /// A string value to sort the items by.
            let sortBy: SortByType?

            /// The number of results to include in a single page.
            /// The default is nil (no limit). Must be >= 1, if provided.
            let pageSize: Int?
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

        public init(latitude: Double,
                    longitude: Double,
                    originLatitude: Double? = nil,
                    originLongitude: Double? = nil,
                    workLatitude: Double? = nil,
                    workLongitude: Double? = nil,
                    periods: [BulkSearchPeriod]? = nil,
                    isOversize: Bool? = nil,
                    maxDistanceMeters: Double? = nil,
                    includeWalkingDistance: Bool = true,
                    sortBy: SortByType? = .relevance,
                    inFacilityExclusionExperiment: Bool? = nil,
                    pageSize: Int? = nil,
                    searchTracking: SearchTrackingParameters? = nil,
                    vehicleInfoId: Int? = nil) {
            self.queryParameters = .init(
                latitude: latitude,
                longitude: longitude,
                originLatitude: originLatitude,
                originLongitude: originLongitude,
                workLatitude: workLatitude,
                workLongitude: workLongitude,
                inFacilityExclusionExperiment: inFacilityExclusionExperiment,
                vehicleInfoId: vehicleInfoId,
                actionID: searchTracking?.actionID,
                fingerprint: searchTracking?.fingerprint,
                searchID: searchTracking?.searchID,
                sessionID: searchTracking?.sessionID
            )
            self.bodyParameters = .init(
                periods: periods,
                isOversize: isOversize,
                maxDistanceMeters: maxDistanceMeters,
                includeWalkingDistance: includeWalkingDistance,
                sortBy: sortBy,
                pageSize: pageSize
            )
        }
    }
}
