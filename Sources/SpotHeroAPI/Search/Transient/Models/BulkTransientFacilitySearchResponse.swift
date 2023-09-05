// Copyright © 2021 SpotHero, Inc. All rights reserved.

/// The response returned when fetching a transient facility.
public struct BulkTransientFacilitySearchResponse: Codable {
    /// The fetched facility result.
    public let result: BulkTransientFacilityResult
}
