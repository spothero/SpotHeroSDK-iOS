// Copyright © 2020 SpotHero, Inc. All rights reserved.

/// The response returned when fetching a transient facility.
public struct TransientFacilitySearchResponse: Codable {
    /// The fetched facility result.
    public let result: TransientFacilityResult
}
